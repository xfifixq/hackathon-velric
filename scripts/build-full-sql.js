/**
 * Builds one full SQL file for Supabase. Run: node scripts/build-full-sql.js
 */
const fs = require('fs');
const path = require('path');

const root = path.join(__dirname, '..');
const backend = path.join(root, 'backend');

let sql = `-- ============================================================
-- GreenPulse — FULL Supabase Setup
-- Paste this entire file into Supabase SQL Editor and click Run
-- Safe to run multiple times (uses IF NOT EXISTS, ON CONFLICT)
-- ============================================================

`;

// 1. Foundation tables
sql += `-- ======================== FOUNDATION ========================
CREATE TABLE IF NOT EXISTS departments (
  department TEXT PRIMARY KEY,
  label       TEXT,
  created_at  TIMESTAMPTZ DEFAULT now()
);
INSERT INTO departments (department, label) VALUES
  ('R&D', 'R&D'), ('Marketing', 'Marketing'), ('IT', 'IT'), ('Legal', 'Legal'),
  ('Supply Chain', 'Supply Chain'), ('HR', 'HR'), ('CxO / Executive', 'CxO / Executive'),
  ('Operations', 'Operations'), ('Procurement', 'Procurement'), ('Finance', 'Finance')
ON CONFLICT (department) DO NOTHING;

CREATE TABLE IF NOT EXISTS department_edges (
  id TEXT PRIMARY KEY, source TEXT NOT NULL, target TEXT NOT NULL,
  relationship TEXT DEFAULT 'collaborates', weight NUMERIC(3,2) DEFAULT 1
);

CREATE TABLE IF NOT EXISTS green_skills (
  id SERIAL PRIMARY KEY, department TEXT NOT NULL, skill_family TEXT NOT NULL,
  green_skill TEXT NOT NULL, theme TEXT, description TEXT, why_it_matters TEXT,
  example_behaviours TEXT, required_level INT DEFAULT 3,
  opt_carbon_footprint NUMERIC(5,2) DEFAULT 0.5, opt_renewable_energy NUMERIC(5,2) DEFAULT 0.5,
  opt_hvac NUMERIC(5,2) DEFAULT 0.5, opt_office_space NUMERIC(5,2) DEFAULT 0.5,
  opt_remote_work NUMERIC(5,2) DEFAULT 0.5, opt_work_schedule NUMERIC(5,2) DEFAULT 0.5,
  opt_water_use NUMERIC(5,2) DEFAULT 0.5, opt_digital_footprint NUMERIC(5,2) DEFAULT 0.5,
  opt_ai_compute NUMERIC(5,2) DEFAULT 0.5, opt_iot_telemetry NUMERIC(5,2) DEFAULT 0.5,
  opt_hardware_circularity NUMERIC(5,2) DEFAULT 0.5, opt_supply_chain_emissions NUMERIC(5,2) DEFAULT 0.5,
  opt_logistics_shipping NUMERIC(5,2) DEFAULT 0.5, opt_fleet_electrification NUMERIC(5,2) DEFAULT 0.5,
  opt_employee_commuting NUMERIC(5,2) DEFAULT 0.5, opt_material_waste NUMERIC(5,2) DEFAULT 0.5,
  UNIQUE(department, skill_family, green_skill)
);

`;

// 2. Green skills seed
sql += fs.readFileSync(path.join(__dirname, 'green_skills_seed.sql'), 'utf8') + '\n\n';

// 3. Assessment tables (no DROP, use IF NOT EXISTS)
sql += `-- ======================== ASSESSMENT TABLES ========================
CREATE TABLE IF NOT EXISTS company_profiles (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES auth.users(id),
  company_name TEXT NOT NULL, industry TEXT, company_size TEXT, location TEXT,
  created_at TIMESTAMPTZ DEFAULT now(), updated_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS assessment_questions (
  id SERIAL PRIMARY KEY, department TEXT NOT NULL REFERENCES departments(department),
  theme TEXT NOT NULL, question_number INT NOT NULL, question TEXT NOT NULL,
  best_practice TEXT, developing TEXT, emerging TEXT, beginner TEXT, linked_skills TEXT,
  created_at TIMESTAMPTZ DEFAULT now(), UNIQUE(department, question_number)
);

CREATE TABLE IF NOT EXISTS assessment_responses (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  company_id UUID NOT NULL REFERENCES company_profiles(id) ON DELETE CASCADE,
  question_id INT NOT NULL REFERENCES assessment_questions(id),
  score INT NOT NULL CHECK (score BETWEEN 1 AND 4), answered_at TIMESTAMPTZ DEFAULT now(),
  UNIQUE(company_id, question_id)
);

`;

// 4. Assessment questions - read from greenpulse and add ON CONFLICT
let aq = fs.readFileSync(path.join(backend, 'greenpulse_assessment.sql'), 'utf8');
// Extract just the INSERT statements (between "SEED: assessment_questions" and "-- INDEXES")
const match = aq.match(/INSERT INTO assessment_questions[\s\S]*?(?=-- ============================================================\s*-- INDEXES)/);
if (match) {
  let inserts = match[0];
  // Change each ");" at end of an INSERT line to ") ON CONFLICT (department, question_number) DO NOTHING;"
  inserts = inserts.replace(/\);(\s*)(INSERT INTO assessment_questions)/g, ') ON CONFLICT (department, question_number) DO NOTHING;$1$2');
  inserts = inserts.replace(/\);(\s*)$/g, ') ON CONFLICT (department, question_number) DO NOTHING;$1');
  sql += inserts + '\n\n';
}

// 5. Indexes (IF NOT EXISTS)
sql += `CREATE INDEX IF NOT EXISTS idx_aq_department ON assessment_questions(department);
CREATE INDEX IF NOT EXISTS idx_aq_theme ON assessment_questions(theme);
CREATE INDEX IF NOT EXISTS idx_ar_company ON assessment_responses(company_id);
CREATE INDEX IF NOT EXISTS idx_ar_question ON assessment_responses(question_id);
CREATE INDEX IF NOT EXISTS idx_cp_user ON company_profiles(user_id);

`;

// 6. fn_02 (company_skill_gaps, company_department_scores, fn_calculate_company_gaps)
sql += fs.readFileSync(path.join(backend, 'fn_02_calculate_gaps.sql'), 'utf8') + '\n\n';

// 7. fn_01
sql += fs.readFileSync(path.join(backend, 'fn_01_submit_assessment.sql'), 'utf8') + '\n\n';

// 8. fn_03
sql += fs.readFileSync(path.join(backend, 'fn_03_risk_priority.sql'), 'utf8') + '\n\n';

// 9. fn_04
sql += fs.readFileSync(path.join(backend, 'fn_04_dashboard_kpis.sql'), 'utf8');

const outPath = path.join(root, 'supabase-full-setup.sql');
fs.writeFileSync(outPath, sql);
console.log('Written to supabase-full-setup.sql');
