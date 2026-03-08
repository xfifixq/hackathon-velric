-- ============================================================
-- GreenPulse Supabase Setup — Run this in Supabase SQL Editor
-- ============================================================
-- Run in order: Copy each section into Supabase Dashboard > SQL Editor > New Query
-- ============================================================

-- ============================================================
-- STEP 1: Foundation tables (MUST run first)
-- ============================================================

-- Departments (referenced by assessment_questions)
CREATE TABLE IF NOT EXISTS departments (
  department TEXT PRIMARY KEY,
  label       TEXT,
  created_at  TIMESTAMPTZ DEFAULT now()
);

INSERT INTO departments (department, label) VALUES
  ('R&D', 'R&D'),
  ('Marketing', 'Marketing'),
  ('IT', 'IT'),
  ('Legal', 'Legal'),
  ('Supply Chain', 'Supply Chain'),
  ('HR', 'HR'),
  ('CxO / Executive', 'CxO / Executive'),
  ('Operations', 'Operations'),
  ('Procurement', 'Procurement'),
  ('Finance', 'Finance')
ON CONFLICT (department) DO NOTHING;

-- Department edges (for network graph)
CREATE TABLE IF NOT EXISTS department_edges (
  id           TEXT PRIMARY KEY,
  source       TEXT NOT NULL,
  target       TEXT NOT NULL,
  relationship TEXT DEFAULT 'collaborates',
  weight       NUMERIC(3,2) DEFAULT 1
);

-- Green skills (referenced by fn_calculate_company_gaps)
CREATE TABLE IF NOT EXISTS green_skills (
  id                      SERIAL PRIMARY KEY,
  department              TEXT NOT NULL,
  skill_family             TEXT NOT NULL,
  green_skill              TEXT NOT NULL,
  theme                    TEXT,
  description              TEXT,
  why_it_matters           TEXT,
  example_behaviours       TEXT,
  required_level           INT DEFAULT 3,
  opt_carbon_footprint     NUMERIC(5,2) DEFAULT 0.5,
  opt_renewable_energy     NUMERIC(5,2) DEFAULT 0.5,
  opt_hvac                 NUMERIC(5,2) DEFAULT 0.5,
  opt_office_space         NUMERIC(5,2) DEFAULT 0.5,
  opt_remote_work          NUMERIC(5,2) DEFAULT 0.5,
  opt_work_schedule        NUMERIC(5,2) DEFAULT 0.5,
  opt_water_use            NUMERIC(5,2) DEFAULT 0.5,
  opt_digital_footprint    NUMERIC(5,2) DEFAULT 0.5,
  opt_ai_compute           NUMERIC(5,2) DEFAULT 0.5,
  opt_iot_telemetry        NUMERIC(5,2) DEFAULT 0.5,
  opt_hardware_circularity NUMERIC(5,2) DEFAULT 0.5,
  opt_supply_chain_emissions NUMERIC(5,2) DEFAULT 0.5,
  opt_logistics_shipping   NUMERIC(5,2) DEFAULT 0.5,
  opt_fleet_electrification NUMERIC(5,2) DEFAULT 0.5,
  opt_employee_commuting   NUMERIC(5,2) DEFAULT 0.5,
  opt_material_waste      NUMERIC(5,2) DEFAULT 0.5,
  UNIQUE(department, skill_family, green_skill)
);

-- STEP 1b: Seed green_skills (120 rows)
-- Run: node scripts/generate-green-skills-seed.js
-- Then run the output in scripts/green_skills_seed.sql in Supabase SQL Editor

-- ============================================================
-- STEP 2: Run backend/greenpulse_assessment.sql
-- ============================================================
-- Copy the entire contents of backend/greenpulse_assessment.sql
-- (creates company_profiles, assessment_questions, assessment_responses + 250 questions)

-- ============================================================
-- STEP 3: Run backend/fn_02_calculate_gaps.sql
-- ============================================================
-- Creates company_skill_gaps, company_department_scores, fn_calculate_company_gaps

-- ============================================================
-- STEP 4: Run backend/fn_01_submit_assessment.sql
-- ============================================================
-- Creates fn_submit_assessment, fn_create_company, fn_get_assessment_questions

-- ============================================================
-- STEP 5: Run backend/fn_03_risk_priority.sql
-- ============================================================
-- Creates fn_get_risk_priority, fn_get_department_risk_summary, fn_get_optimization_impact

-- ============================================================
-- STEP 6: Run backend/fn_04_dashboard_kpis.sql
-- ============================================================
-- Creates fn_dashboard_kpis

-- ============================================================
-- RLS (Row Level Security) — Enable if using Supabase Auth
-- ============================================================
-- ALTER TABLE company_profiles ENABLE ROW LEVEL SECURITY;
-- CREATE POLICY "Users can read own company" ON company_profiles FOR SELECT USING (auth.uid() = user_id);
-- CREATE POLICY "Users can insert own company" ON company_profiles FOR INSERT WITH CHECK (auth.uid() = user_id);
