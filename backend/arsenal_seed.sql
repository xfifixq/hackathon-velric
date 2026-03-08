-- ============================================================
-- GreenPulse — Arsenal FC Seed Data
-- Departments, Green Skills, Department Edges
-- Tailored for Arsenal Football Club (Sports sector)
-- ============================================================

-- Clear existing data (must respect FK order: assessment_responses -> assessment_questions -> departments)
DELETE FROM assessment_responses;
DELETE FROM assessment_questions;
DELETE FROM green_skills;
DELETE FROM department_edges;
DELETE FROM departments;

-- Add columns required by Arsenal seed (supabase-full-setup only has department, label, created_at)
ALTER TABLE departments ADD COLUMN IF NOT EXISTS id TEXT UNIQUE;
ALTER TABLE departments ADD COLUMN IF NOT EXISTS overall_score NUMERIC(5,2);
ALTER TABLE departments ADD COLUMN IF NOT EXISTS gap_severity TEXT;
ALTER TABLE departments ADD COLUMN IF NOT EXISTS critical_gap_count INT;
ALTER TABLE departments ADD COLUMN IF NOT EXISTS moderate_gap_count INT;
ALTER TABLE departments ADD COLUMN IF NOT EXISTS no_gap_count INT;
ALTER TABLE departments ADD COLUMN IF NOT EXISTS top_gaps TEXT;
ALTER TABLE departments ADD COLUMN IF NOT EXISTS desired_knowledge TEXT;
ALTER TABLE departments ADD COLUMN IF NOT EXISTS priority_level TEXT;
ALTER TABLE departments ADD COLUMN IF NOT EXISTS opt_carbon_footprint NUMERIC(5,2);
ALTER TABLE departments ADD COLUMN IF NOT EXISTS opt_renewable_energy NUMERIC(5,2);
ALTER TABLE departments ADD COLUMN IF NOT EXISTS opt_hvac NUMERIC(5,2);
ALTER TABLE departments ADD COLUMN IF NOT EXISTS opt_office_space NUMERIC(5,2);
ALTER TABLE departments ADD COLUMN IF NOT EXISTS opt_remote_work NUMERIC(5,2);
ALTER TABLE departments ADD COLUMN IF NOT EXISTS opt_work_schedule NUMERIC(5,2);
ALTER TABLE departments ADD COLUMN IF NOT EXISTS opt_water_use NUMERIC(5,2);
ALTER TABLE departments ADD COLUMN IF NOT EXISTS opt_digital_footprint NUMERIC(5,2);
ALTER TABLE departments ADD COLUMN IF NOT EXISTS opt_ai_compute NUMERIC(5,2);
ALTER TABLE departments ADD COLUMN IF NOT EXISTS opt_iot_telemetry NUMERIC(5,2);
ALTER TABLE departments ADD COLUMN IF NOT EXISTS opt_hardware_circularity NUMERIC(5,2);
ALTER TABLE departments ADD COLUMN IF NOT EXISTS opt_supply_chain_emissions NUMERIC(5,2);
ALTER TABLE departments ADD COLUMN IF NOT EXISTS opt_logistics_shipping NUMERIC(5,2);
ALTER TABLE departments ADD COLUMN IF NOT EXISTS opt_fleet_electrification NUMERIC(5,2);
ALTER TABLE departments ADD COLUMN IF NOT EXISTS opt_employee_commuting NUMERIC(5,2);
ALTER TABLE departments ADD COLUMN IF NOT EXISTS opt_material_waste NUMERIC(5,2);

-- ========================
-- DEPARTMENTS
-- ========================

INSERT INTO departments (id, label, department, overall_score, gap_severity, critical_gap_count, moderate_gap_count, no_gap_count, top_gaps, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  'procurement', 'Procurement', 'Procurement', 33.0, 'Critical', 12, 0, 0,
  'Sustainable Sourcing; Life Cycle Analysis; Low-Carbon Contracting; Supplier Emissions Data; Circular Procurement', 'Arsenal FC Procurement department requires green skills across sustainability, decarbonisation, and ESG compliance to meet Sports sector standards.', 'Critical',
  0.45, 0.15, 0.05, 0.25, 0.4, 0.35,
  0.1, 0.1, 0.05, 0.03, 0.2,
  0.5, 0.2, 0.1, 0.65, 0.35
);

INSERT INTO departments (id, label, department, overall_score, gap_severity, critical_gap_count, moderate_gap_count, no_gap_count, top_gaps, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  'finance', 'Finance', 'Finance', 31.0, 'Critical', 12, 0, 0,
  'ESG Risk Modelling; Carbon Costing; Impact Investing; Green Finance Principles; Regulatory Compliance', 'Arsenal FC Finance department requires green skills across sustainability, decarbonisation, and ESG compliance to meet Sports sector standards.', 'Critical',
  0.2, 0.1, 0.05, 0.3, 0.55, 0.4,
  0.05, 0.15, 0.08, 0.02, 0.05,
  0.1, 0.05, 0.05, 0.7, 0.1
);

INSERT INTO departments (id, label, department, overall_score, gap_severity, critical_gap_count, moderate_gap_count, no_gap_count, top_gaps, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  'marketing', 'Marketing', 'Marketing', 37.0, 'Low', 0, 5, 7,
  '', 'Arsenal FC Marketing department requires green skills across sustainability, decarbonisation, and ESG compliance to meet Sports sector standards.', 'Medium',
  0.15, 0.1, 0.05, 0.3, 0.6, 0.45,
  0.05, 0.4, 0.15, 0.03, 0.08,
  0.05, 0.08, 0.05, 0.75, 0.2
);

INSERT INTO departments (id, label, department, overall_score, gap_severity, critical_gap_count, moderate_gap_count, no_gap_count, top_gaps, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  'it', 'IT', 'IT', 36.0, 'Low', 0, 0, 12,
  '', 'Arsenal FC IT department requires green skills across sustainability, decarbonisation, and ESG compliance to meet Sports sector standards.', 'Medium',
  0.25, 0.3, 0.15, 0.25, 0.7, 0.5,
  0.05, 0.5, 0.35, 0.1, 0.3,
  0.05, 0.03, 0.03, 0.65, 0.15
);

INSERT INTO departments (id, label, department, overall_score, gap_severity, critical_gap_count, moderate_gap_count, no_gap_count, top_gaps, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  'legal', 'Legal', 'Legal', 38.0, 'Low', 0, 12, 0,
  '', 'Arsenal FC Legal department requires green skills across sustainability, decarbonisation, and ESG compliance to meet Sports sector standards.', 'High',
  0.1, 0.1, 0.05, 0.3, 0.55, 0.4,
  0.03, 0.1, 0.03, 0.02, 0.03,
  0.1, 0.03, 0.03, 0.7, 0.05
);

INSERT INTO departments (id, label, department, overall_score, gap_severity, critical_gap_count, moderate_gap_count, no_gap_count, top_gaps, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  'supply_chain', 'Supply Chain', 'Supply Chain', 28.0, 'Critical', 12, 0, 0,
  'Carbon Hotspot Mapping; Low-Emission Transport; Circular Inventory; Circular Logistics; Scope 3 Visibility', 'Arsenal FC Supply Chain department requires green skills across sustainability, decarbonisation, and ESG compliance to meet Sports sector standards.', 'Critical',
  0.65, 0.15, 0.05, 0.2, 0.25, 0.3,
  0.15, 0.1, 0.05, 0.05, 0.15,
  0.6, 0.3, 0.2, 0.6, 0.4
);

INSERT INTO departments (id, label, department, overall_score, gap_severity, critical_gap_count, moderate_gap_count, no_gap_count, top_gaps, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  'hr', 'HR', 'HR', 35.0, 'Low', 0, 0, 12,
  '', 'Arsenal FC HR department requires green skills across sustainability, decarbonisation, and ESG compliance to meet Sports sector standards.', 'Medium',
  0.15, 0.1, 0.05, 0.4, 0.6, 0.5,
  0.05, 0.15, 0.05, 0.02, 0.05,
  0.05, 0.03, 0.05, 0.8, 0.1
);

INSERT INTO departments (id, label, department, overall_score, gap_severity, critical_gap_count, moderate_gap_count, no_gap_count, top_gaps, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  'cxo_executive', 'CxO / Executive', 'CxO / Executive', 44.0, 'Critical', 4, 8, 0,
  'Decarbonisation Roadmapping; Sustainable Investment; Stewardship Values; Adaptive Mindset', 'Arsenal FC CxO / Executive department requires green skills across sustainability, decarbonisation, and ESG compliance to meet Sports sector standards.', 'Critical',
  0.5, 0.35, 0.1, 0.35, 0.45, 0.35,
  0.12, 0.25, 0.12, 0.05, 0.1,
  0.3, 0.1, 0.15, 0.75, 0.25
);

INSERT INTO departments (id, label, department, overall_score, gap_severity, critical_gap_count, moderate_gap_count, no_gap_count, top_gaps, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  'operations', 'Operations', 'Operations', 37.0, 'Critical', 12, 0, 0,
  'Energy Efficiency; Circular Process Design; Waste Reduction; Process Footprinting; Emissions Tracking', 'Arsenal FC Operations department requires green skills across sustainability, decarbonisation, and ESG compliance to meet Sports sector standards.', 'Critical',
  0.6, 0.45, 0.35, 0.35, 0.2, 0.35,
  0.3, 0.1, 0.05, 0.15, 0.15,
  0.25, 0.15, 0.25, 0.7, 0.45
);

INSERT INTO departments (id, label, department, overall_score, gap_severity, critical_gap_count, moderate_gap_count, no_gap_count, top_gaps, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  'r&d', 'R&D', 'R&D', 60.0, 'Low', 0, 0, 12,
  '', 'Arsenal FC R&D department requires green skills across sustainability, decarbonisation, and ESG compliance to meet Sports sector standards.', 'Medium',
  0.15, 0.2, 0.1, 0.3, 0.7, 0.4,
  0.1, 0.25, 0.17, 0.03, 0.09,
  0.1, 0.03, 0.09, 0.7, 0.15
);

-- Add columns required by Arsenal seed (green_skills base schema lacks these)
ALTER TABLE green_skills ADD COLUMN IF NOT EXISTS current_level NUMERIC(5,2);
ALTER TABLE green_skills ADD COLUMN IF NOT EXISTS gap NUMERIC(5,2);
ALTER TABLE green_skills ADD COLUMN IF NOT EXISTS severity TEXT;
ALTER TABLE green_skills ADD COLUMN IF NOT EXISTS desired_knowledge TEXT;
ALTER TABLE green_skills ADD COLUMN IF NOT EXISTS priority_level TEXT;

-- ========================
-- GREEN SKILLS
-- ========================

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  1, 'Procurement', 'Technical', 'Sustainable Sourcing', 'Integrate sustainability into purchasing decisions', 'Drives emissions reductions, supports ethical practices, and strengthens resilience in the value chain.', 'Including sustainability criteria in RFPs, preferring suppliers with certifications, evaluating total life cycle impact.',
  'Decarbonisation', 3.6, 1.4, 2.2, 'Critical', 'Arsenal FC requires Sustainable Sourcing at 3.6/4 maturity', 'Foundation',
  0.45, 0.15, 0.05, 0.25, 0.4, 0.35,
  0.1, 0.1, 0.05, 0.03, 0.2,
  0.5, 0.2, 0.1, 0.65, 0.35
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  2, 'Procurement', 'Technical', 'Life Cycle Analysis', 'Evaluate product impacts across their life cycle', 'Enables informed decision-making and transparent reporting on product footprint.', 'Conducting cradle-to-grave assessments, comparing material options, integrating LCA results into procurement criteria.',
  'Decarbonisation', 3.6, 1.4, 2.2, 'Critical', 'Arsenal FC requires Life Cycle Analysis at 3.6/4 maturity', 'Medium',
  0.45, 0.15, 0.05, 0.25, 0.4, 0.35,
  0.1, 0.1, 0.05, 0.03, 0.2,
  0.5, 0.2, 0.1, 0.65, 0.35
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  3, 'Procurement', 'Technical', 'Low-Carbon Contracting', 'Embed emissions goals into supplier agreements', 'Aligns suppliers to decarbonisation commitments and ensures accountability.', 'Including carbon KPIs in contracts, requiring regular emissions reporting, enforcing consequences for non-compliance.',
  'Decarbonisation', 3.6, 1.4, 2.2, 'Critical', 'Arsenal FC requires Low-Carbon Contracting at 3.6/4 maturity', 'High',
  0.45, 0.15, 0.05, 0.25, 0.4, 0.35,
  0.1, 0.1, 0.05, 0.03, 0.2,
  0.5, 0.2, 0.1, 0.65, 0.35
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  4, 'Procurement', 'Knowledgeable', 'Supplier Emissions Data', 'Understand emissions data in the supply chain', 'Provides a foundation for accurate carbon accounting and progress tracking.', 'Requesting supplier emissions data, verifying against standards, supporting suppliers to improve data quality.',
  'Climate Fluency', 3.6, 1.4, 2.2, 'Critical', 'Arsenal FC requires Supplier Emissions Data at 3.6/4 maturity', 'Foundation',
  0.45, 0.15, 0.05, 0.25, 0.4, 0.35,
  0.1, 0.1, 0.05, 0.03, 0.2,
  0.5, 0.2, 0.1, 0.65, 0.35
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  5, 'Procurement', 'Knowledgeable', 'Circular Procurement', 'Prioritise circular materials and processes', 'Reduces waste and resource consumption, supports circular economy goals.', 'Including circularity requirements in tenders, preferring remanufactured products, tracking circular performance metrics.',
  'Circular Practices', 3.6, 1.2, 2.4, 'Critical', 'Arsenal FC requires Circular Procurement at 3.6/4 maturity', 'Medium',
  0.45, 0.15, 0.05, 0.25, 0.4, 0.35,
  0.1, 0.1, 0.05, 0.03, 0.2,
  0.5, 0.2, 0.1, 0.65, 0.35
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  6, 'Procurement', 'Knowledgeable', 'Scope 3 Reporting', 'Disclose supply chain carbon impacts', 'Supports transparency and regulatory compliance under frameworks like CSRD.', 'Preparing supplier GHG inventories, consolidating data for reports, explaining Scope 3 contributions to stakeholders.',
  'Data & AI', 3.6, 1.2, 2.4, 'Critical', 'Arsenal FC requires Scope 3 Reporting at 3.6/4 maturity', 'High',
  0.45, 0.15, 0.05, 0.25, 0.4, 0.35,
  0.1, 0.1, 0.05, 0.03, 0.2,
  0.5, 0.2, 0.1, 0.65, 0.35
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  7, 'Procurement', 'Values', 'Ethical Purchasing', 'Uphold fairness and sustainability in buying', 'Builds trust with stakeholders and protects reputation.', 'Selecting fair trade suppliers, avoiding products linked to deforestation or exploitation, prioritising local sourcing where possible.',
  'Risk', 3.6, 1.4, 2.2, 'Critical', 'Arsenal FC requires Ethical Purchasing at 3.6/4 maturity', 'Foundation',
  0.45, 0.15, 0.05, 0.25, 0.4, 0.35,
  0.1, 0.1, 0.05, 0.03, 0.2,
  0.5, 0.2, 0.1, 0.65, 0.35
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  8, 'Procurement', 'Values', 'Transparency Focus', 'Share clear information about sourcing', 'Fosters accountability and strengthens supplier relationships.', 'Publishing sourcing policies, providing feedback to suppliers, reporting progress externally.',
  'Risk', 3.6, 1.4, 2.2, 'Critical', 'Arsenal FC requires Transparency Focus at 3.6/4 maturity', 'Medium',
  0.45, 0.15, 0.05, 0.25, 0.4, 0.35,
  0.1, 0.1, 0.05, 0.03, 0.2,
  0.5, 0.2, 0.1, 0.65, 0.35
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  9, 'Procurement', 'Values', 'Responsibility Mindset', 'Take ownership of impacts', 'Encourages proactive improvements rather than compliance-only approaches.', 'Developing action plans for high-impact categories, training teams, engaging in supplier development programs.',
  'Risk', 3.6, 1.4, 2.2, 'Critical', 'Arsenal FC requires Responsibility Mindset at 3.6/4 maturity', 'High',
  0.45, 0.15, 0.05, 0.25, 0.4, 0.35,
  0.1, 0.1, 0.05, 0.03, 0.2,
  0.5, 0.2, 0.1, 0.65, 0.35
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  10, 'Procurement', 'Attitudes', 'Proactive Engagement', 'Anticipate issues and act early', 'Reduces disruptions, speeds progress, and demonstrates leadership.', 'Engaging suppliers early on expectations, piloting improvements, sharing forecasts for demand planning.',
  'Circular Practices', 3.6, 1.2, 2.4, 'Critical', 'Arsenal FC requires Proactive Engagement at 3.6/4 maturity', 'Foundation',
  0.45, 0.15, 0.05, 0.25, 0.4, 0.35,
  0.1, 0.1, 0.05, 0.03, 0.2,
  0.5, 0.2, 0.1, 0.65, 0.35
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  11, 'Procurement', 'Attitudes', 'Continuous Improvement', 'Seek better solutions over time', 'Ensures progress keeps pace with expectations and innovation.', 'Conducting periodic reviews, benchmarking against peers, updating policies based on lessons learned.',
  'Data & AI', 3.6, 1.2, 2.4, 'Critical', 'Arsenal FC requires Continuous Improvement at 3.6/4 maturity', 'Medium',
  0.45, 0.15, 0.05, 0.25, 0.4, 0.35,
  0.1, 0.1, 0.05, 0.03, 0.2,
  0.5, 0.2, 0.1, 0.65, 0.35
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  12, 'Procurement', 'Attitudes', 'Collaboration Driven', 'Work with suppliers and peers to solve challenges', 'Helps address systemic issues and improves outcomes that no organisation can tackle alone.', 'Joining industry coalitions, co-creating solutions with suppliers, sharing best practices and resources.',
  'Climate Fluency', 3.6, 1.4, 2.2, 'Critical', 'Arsenal FC requires Collaboration Driven at 3.6/4 maturity', 'High',
  0.45, 0.15, 0.05, 0.25, 0.4, 0.35,
  0.1, 0.1, 0.05, 0.03, 0.2,
  0.5, 0.2, 0.1, 0.65, 0.35
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  13, 'Finance', 'Technical', 'ESG Risk Modelling', 'Quantify sustainability-related financial risks', 'Supports resilience and informed decision-making on investments and allocations.', 'Building scenario models, quantifying exposure to carbon pricing, stress-testing assets against climate scenarios.',
  'Risk', 3.4, 1.4, 2.0, 'Critical', 'Arsenal FC requires ESG Risk Modelling at 3.4/4 maturity', 'Foundation',
  0.2, 0.1, 0.05, 0.3, 0.55, 0.4,
  0.05, 0.15, 0.08, 0.02, 0.05,
  0.1, 0.05, 0.05, 0.7, 0.1
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  14, 'Finance', 'Technical', 'Carbon Costing', 'Integrate emissions costs into planning', 'Encourages low-carbon decisions and transparency in financial analysis.', 'Including carbon costs in ROI calculations, advising on emissions reduction paybacks, presenting alternative scenarios with carbon pricing.',
  'Decarbonisation', 3.4, 1.2, 2.2, 'Critical', 'Arsenal FC requires Carbon Costing at 3.4/4 maturity', 'Medium',
  0.2, 0.1, 0.05, 0.3, 0.55, 0.4,
  0.05, 0.15, 0.08, 0.02, 0.05,
  0.1, 0.05, 0.05, 0.7, 0.1
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  15, 'Finance', 'Technical', 'Impact Investing', 'Allocate funds for positive outcomes', 'Positions the business for sustainable growth and stakeholder confidence.', 'Screening investments for ESG criteria, developing green finance products, monitoring impact KPIs.',
  'Decarbonisation', 3.4, 1.2, 2.2, 'Critical', 'Arsenal FC requires Impact Investing at 3.4/4 maturity', 'High',
  0.2, 0.1, 0.05, 0.3, 0.55, 0.4,
  0.05, 0.15, 0.08, 0.02, 0.05,
  0.1, 0.05, 0.05, 0.7, 0.1
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  16, 'Finance', 'Knowledgeable', 'Green Finance Principles', 'Understand sustainable finance frameworks', 'Ensures compliance and alignment with evolving expectations.', 'Staying updated on regulations, advising teams on eligibility, integrating principles into investment strategies.',
  'Climate Fluency', 3.4, 1.2, 2.2, 'Critical', 'Arsenal FC requires Green Finance Principles at 3.4/4 maturity', 'Foundation',
  0.2, 0.1, 0.05, 0.3, 0.55, 0.4,
  0.05, 0.15, 0.08, 0.02, 0.05,
  0.1, 0.05, 0.05, 0.7, 0.1
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  17, 'Finance', 'Knowledgeable', 'Regulatory Compliance', 'Track and meet disclosure requirements', 'Avoids legal risk and strengthens investor confidence.', 'Preparing climate disclosures, coordinating data collection, validating accuracy with auditors.',
  'Risk', 3.4, 1.4, 2.0, 'Critical', 'Arsenal FC requires Regulatory Compliance at 3.4/4 maturity', 'Medium',
  0.2, 0.1, 0.05, 0.3, 0.55, 0.4,
  0.05, 0.15, 0.08, 0.02, 0.05,
  0.1, 0.05, 0.05, 0.7, 0.1
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  18, 'Finance', 'Knowledgeable', 'TCFD Knowledge', 'Apply climate risk disclosure frameworks', 'Demonstrates transparency and readiness for regulatory scrutiny.', 'Producing scenario analysis, supporting board reporting, aligning with investor expectations.',
  'Climate Fluency', 3.4, 1.2, 2.2, 'Critical', 'Arsenal FC requires TCFD Knowledge at 3.4/4 maturity', 'High',
  0.2, 0.1, 0.05, 0.3, 0.55, 0.4,
  0.05, 0.15, 0.08, 0.02, 0.05,
  0.1, 0.05, 0.05, 0.7, 0.1
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  19, 'Finance', 'Values', 'Stewardship Commitment', 'Take responsibility for long-term outcomes', 'Reinforces trust with stakeholders and underpins sustainable performance.', 'Prioritising long-term value creation, questioning short-term trade-offs, advocating responsible investment decisions.',
  'Climate Fluency', 3.4, 1.2, 2.2, 'Critical', 'Arsenal FC requires Stewardship Commitment at 3.4/4 maturity', 'Foundation',
  0.2, 0.1, 0.05, 0.3, 0.55, 0.4,
  0.05, 0.15, 0.08, 0.02, 0.05,
  0.1, 0.05, 0.05, 0.7, 0.1
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  20, 'Finance', 'Values', 'Integrity Orientation', 'Uphold ethical standards in reporting', 'Protects reputation and ensures compliance with regulations.', 'Double-checking ESG data, challenging incomplete narratives, ensuring clarity in sustainability messaging.',
  'Risk', 3.4, 1.4, 2.0, 'Critical', 'Arsenal FC requires Integrity Orientation at 3.4/4 maturity', 'Medium',
  0.2, 0.1, 0.05, 0.3, 0.55, 0.4,
  0.05, 0.15, 0.08, 0.02, 0.05,
  0.1, 0.05, 0.05, 0.7, 0.1
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  21, 'Finance', 'Values', 'Purpose Driven', 'Align finance with impact goals', 'Enhances engagement and positions finance as a strategic partner.', 'Embedding ESG metrics into KPIs, proposing investments that align with purpose, celebrating impact achievements.',
  'Decarbonisation', 3.4, 1.2, 2.2, 'Critical', 'Arsenal FC requires Purpose Driven at 3.4/4 maturity', 'High',
  0.2, 0.1, 0.05, 0.3, 0.55, 0.4,
  0.05, 0.15, 0.08, 0.02, 0.05,
  0.1, 0.05, 0.05, 0.7, 0.1
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  22, 'Finance', 'Attitudes', 'Long-Term Thinking', 'Prioritise enduring value over short-term gains', 'Future-proofs the business and builds resilience.', 'Reviewing scenarios over 10–30 years, questioning short-term savings that conflict with sustainability, balancing financial and environmental outcomes.',
  'Data & AI', 3.4, 1.2, 2.2, 'Critical', 'Arsenal FC requires Long-Term Thinking at 3.4/4 maturity', 'Foundation',
  0.2, 0.1, 0.05, 0.3, 0.55, 0.4,
  0.05, 0.15, 0.08, 0.02, 0.05,
  0.1, 0.05, 0.05, 0.7, 0.1
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  23, 'Finance', 'Attitudes', 'Accountability Culture', 'Take ownership for ESG results', 'Encourages proactive problem solving and transparency.', 'Regularly reporting progress, engaging peers in shared accountability, driving performance improvements.',
  'Risk', 3.4, 1.4, 2.0, 'Critical', 'Arsenal FC requires Accountability Culture at 3.4/4 maturity', 'Medium',
  0.2, 0.1, 0.05, 0.3, 0.55, 0.4,
  0.05, 0.15, 0.08, 0.02, 0.05,
  0.1, 0.05, 0.05, 0.7, 0.1
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  24, 'Finance', 'Attitudes', 'Results Focused', 'Deliver measurable ESG outcomes', 'Builds credibility with investors and stakeholders.', 'Tracking progress against KPIs, addressing gaps quickly, celebrating successes publicly.',
  'Circular Practices', 3.4, 1.2, 2.2, 'Critical', 'Arsenal FC requires Results Focused at 3.4/4 maturity', 'High',
  0.2, 0.1, 0.05, 0.3, 0.55, 0.4,
  0.05, 0.15, 0.08, 0.02, 0.05,
  0.1, 0.05, 0.05, 0.7, 0.1
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  25, 'Marketing', 'Technical', 'Green Claims Review', 'Assess accuracy of sustainability messages', 'Protects brand trust and ensures compliance with regulations.', 'Verifying claims against evidence, consulting legal teams, updating messaging as needed.',
  'Risk', 2.2, 1.8, 0.4, 'No Gap', 'Arsenal FC requires Green Claims Review at 2.2/4 maturity', 'Foundation',
  0.15, 0.1, 0.05, 0.3, 0.6, 0.45,
  0.05, 0.4, 0.15, 0.03, 0.08,
  0.05, 0.08, 0.05, 0.75, 0.2
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  26, 'Marketing', 'Technical', 'Low-Impact Campaigns', 'Reduce emissions from marketing activities', 'Demonstrates authenticity and supports decarbonisation targets.', 'Selecting low-carbon media, using digital channels, measuring campaign footprint.',
  'Decarbonisation', 2.2, 1.2, 1.0, 'Moderate', 'Arsenal FC requires Low-Impact Campaigns at 2.2/4 maturity', 'Medium',
  0.15, 0.1, 0.05, 0.3, 0.6, 0.45,
  0.05, 0.4, 0.15, 0.03, 0.08,
  0.05, 0.08, 0.05, 0.75, 0.2
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  27, 'Marketing', 'Technical', 'Eco-Labelling Compliance', 'Use environmental certifications appropriately', 'Avoids misleading customers and meets legal obligations.', 'Confirming certification requirements, training teams, maintaining approvals documentation.',
  'Circular Practices', 2.2, 1.2, 1.0, 'Moderate', 'Arsenal FC requires Eco-Labelling Compliance at 2.2/4 maturity', 'High',
  0.15, 0.1, 0.05, 0.3, 0.6, 0.45,
  0.05, 0.4, 0.15, 0.03, 0.08,
  0.05, 0.08, 0.05, 0.75, 0.2
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  28, 'Marketing', 'Knowledgeable', 'Sustainability Storytelling', 'Communicate impact in compelling ways', 'Builds credibility and inspires customers to engage.', 'Developing case studies, producing videos, aligning messaging to strategy.',
  'Climate Fluency', 2.2, 1.6, 0.6, 'No Gap', 'Arsenal FC requires Sustainability Storytelling at 2.2/4 maturity', 'Foundation',
  0.15, 0.1, 0.05, 0.3, 0.6, 0.45,
  0.05, 0.4, 0.15, 0.03, 0.08,
  0.05, 0.08, 0.05, 0.75, 0.2
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  29, 'Marketing', 'Knowledgeable', 'Behavioural Insights', 'Apply psychology to encourage sustainable choices', 'Supports decarbonisation and circularity goals through demand shifts.', 'Designing calls to action, testing messages, analysing impact data.',
  'Data & AI', 2.2, 1.6, 0.6, 'No Gap', 'Arsenal FC requires Behavioural Insights at 2.2/4 maturity', 'Medium',
  0.15, 0.1, 0.05, 0.3, 0.6, 0.45,
  0.05, 0.4, 0.15, 0.03, 0.08,
  0.05, 0.08, 0.05, 0.75, 0.2
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  30, 'Marketing', 'Knowledgeable', 'Circular Promotion', 'Highlight reuse and recycling benefits', 'Helps grow participation in circular models and drives differentiation.', 'Campaigning on reuse schemes, co-creating content with customers, celebrating impact stories.',
  'Circular Practices', 2.2, 1.2, 1.0, 'Moderate', 'Arsenal FC requires Circular Promotion at 2.2/4 maturity', 'High',
  0.15, 0.1, 0.05, 0.3, 0.6, 0.45,
  0.05, 0.4, 0.15, 0.03, 0.08,
  0.05, 0.08, 0.05, 0.75, 0.2
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  31, 'Marketing', 'Values', 'Authentic Messaging', 'Be truthful and transparent in communication', 'Protects reputation and avoids regulatory penalties.', 'Reviewing materials carefully, removing exaggerated language, providing clear sourcing information.',
  'Risk', 2.2, 1.8, 0.4, 'No Gap', 'Arsenal FC requires Authentic Messaging at 2.2/4 maturity', 'Foundation',
  0.15, 0.1, 0.05, 0.3, 0.6, 0.45,
  0.05, 0.4, 0.15, 0.03, 0.08,
  0.05, 0.08, 0.05, 0.75, 0.2
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  32, 'Marketing', 'Values', 'Honesty in Claims', 'Never overstate progress or impacts', 'Builds trust and manages expectations.', 'Publishing supporting data, addressing trade-offs, using neutral language.',
  'Risk', 2.2, 1.8, 0.4, 'No Gap', 'Arsenal FC requires Honesty in Claims at 2.2/4 maturity', 'Medium',
  0.15, 0.1, 0.05, 0.3, 0.6, 0.45,
  0.05, 0.4, 0.15, 0.03, 0.08,
  0.05, 0.08, 0.05, 0.75, 0.2
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  33, 'Marketing', 'Values', 'Social Responsibility', 'Align marketing with positive impact', 'Strengthens purpose-led brand identity and stakeholder loyalty.', 'Avoiding stereotypes, promoting inclusivity, choosing sustainable partners.',
  'Decarbonisation', 2.2, 1.2, 1.0, 'Moderate', 'Arsenal FC requires Social Responsibility at 2.2/4 maturity', 'High',
  0.15, 0.1, 0.05, 0.3, 0.6, 0.45,
  0.05, 0.4, 0.15, 0.03, 0.08,
  0.05, 0.08, 0.05, 0.75, 0.2
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  34, 'Marketing', 'Attitudes', 'Customer Centricity', 'Put customer needs and values first', 'Improves relevance and engagement.', 'Conducting research, adjusting messaging, responding to feedback.',
  'Climate Fluency', 2.2, 1.6, 0.6, 'No Gap', 'Arsenal FC requires Customer Centricity at 2.2/4 maturity', 'Foundation',
  0.15, 0.1, 0.05, 0.3, 0.6, 0.45,
  0.05, 0.4, 0.15, 0.03, 0.08,
  0.05, 0.08, 0.05, 0.75, 0.2
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  35, 'Marketing', 'Attitudes', 'Openness to Feedback', 'Be willing to adapt strategies', 'Drives learning and continuous improvement.', 'Running post-campaign reviews, tracking sentiment, acting on feedback.',
  'Data & AI', 2.2, 1.6, 0.6, 'No Gap', 'Arsenal FC requires Openness to Feedback at 2.2/4 maturity', 'Medium',
  0.15, 0.1, 0.05, 0.3, 0.6, 0.45,
  0.05, 0.4, 0.15, 0.03, 0.08,
  0.05, 0.08, 0.05, 0.75, 0.2
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  36, 'Marketing', 'Attitudes', 'Learning Orientation', 'Stay curious about sustainability trends', 'Keeps marketing relevant and legally compliant.', 'Subscribing to updates, attending webinars, sharing insights internally.',
  'Circular Practices', 2.2, 1.2, 1.0, 'Moderate', 'Arsenal FC requires Learning Orientation at 2.2/4 maturity', 'High',
  0.15, 0.1, 0.05, 0.3, 0.6, 0.45,
  0.05, 0.4, 0.15, 0.03, 0.08,
  0.05, 0.08, 0.05, 0.75, 0.2
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  37, 'IT', 'Technical', 'Green Software Design', 'Develop energy-efficient applications', 'Lowers digital footprint and operational costs.', 'Optimising code, reducing data storage needs, selecting efficient platforms.',
  'Decarbonisation', 1.6, 1.4, 0.2, 'No Gap', 'Arsenal FC requires Green Software Design at 1.6/4 maturity', 'Foundation',
  0.25, 0.3, 0.15, 0.25, 0.7, 0.5,
  0.05, 0.5, 0.35, 0.1, 0.3,
  0.05, 0.03, 0.03, 0.65, 0.15
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  38, 'IT', 'Technical', 'Cloud Efficiency', 'Optimise resource use in cloud environments', 'Supports decarbonisation and cost management.', 'Rightsizing instances, auto-scaling workloads, selecting low-carbon data centres.',
  'Decarbonisation', 1.6, 1.4, 0.2, 'No Gap', 'Arsenal FC requires Cloud Efficiency at 1.6/4 maturity', 'Medium',
  0.25, 0.3, 0.15, 0.25, 0.7, 0.5,
  0.05, 0.5, 0.35, 0.1, 0.3,
  0.05, 0.03, 0.03, 0.65, 0.15
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  39, 'IT', 'Technical', 'Data Footprint Reduction', 'Minimise unnecessary data storage and processing', 'Reduces environmental impact and boosts performance.', 'Implementing data lifecycle policies, automating deletion, reporting results.',
  'Decarbonisation', 1.6, 1.4, 0.2, 'No Gap', 'Arsenal FC requires Data Footprint Reduction at 1.6/4 maturity', 'High',
  0.25, 0.3, 0.15, 0.25, 0.7, 0.5,
  0.05, 0.5, 0.35, 0.1, 0.3,
  0.05, 0.03, 0.03, 0.65, 0.15
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  40, 'IT', 'Knowledgeable', 'ESG Data Management', 'Collect and report sustainability metrics', 'Enables accurate reporting and transparency.', 'Building data pipelines, ensuring data quality, maintaining secure access controls.',
  'Data & AI', 1.6, 1.6, 0.0, 'No Gap', 'Arsenal FC requires ESG Data Management at 1.6/4 maturity', 'Foundation',
  0.25, 0.3, 0.15, 0.25, 0.7, 0.5,
  0.05, 0.5, 0.35, 0.1, 0.3,
  0.05, 0.03, 0.03, 0.65, 0.15
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  41, 'IT', 'Knowledgeable', 'AI Ethics Knowledge', 'Understand responsible AI practices', 'Reduces risks of bias, privacy breaches, and misuse.', 'Reviewing algorithms, training teams, embedding ethical considerations.',
  'Data & AI', 1.6, 1.6, 0.0, 'No Gap', 'Arsenal FC requires AI Ethics Knowledge at 1.6/4 maturity', 'Medium',
  0.25, 0.3, 0.15, 0.25, 0.7, 0.5,
  0.05, 0.5, 0.35, 0.1, 0.3,
  0.05, 0.03, 0.03, 0.65, 0.15
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  42, 'IT', 'Knowledgeable', 'Cyber-ESG Risk', 'Protect ESG data from security threats', 'Maintains trust and compliance.', 'Implementing controls, auditing systems, managing incidents effectively.',
  'Risk', 1.6, 1.4, 0.2, 'No Gap', 'Arsenal FC requires Cyber-ESG Risk at 1.6/4 maturity', 'High',
  0.25, 0.3, 0.15, 0.25, 0.7, 0.5,
  0.05, 0.5, 0.35, 0.1, 0.3,
  0.05, 0.03, 0.03, 0.65, 0.15
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  43, 'IT', 'Values', 'Digital Responsibility', 'Use technology ethically and sustainably', 'Builds long-term trust and resilience.', 'Selecting responsible vendors, questioning unnecessary growth, prioritising privacy.',
  'Climate Fluency', 1.6, 1.6, 0.0, 'No Gap', 'Arsenal FC requires Digital Responsibility at 1.6/4 maturity', 'Foundation',
  0.25, 0.3, 0.15, 0.25, 0.7, 0.5,
  0.05, 0.5, 0.35, 0.1, 0.3,
  0.05, 0.03, 0.03, 0.65, 0.15
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  44, 'IT', 'Values', 'Transparency Culture', 'Share clear data on impacts', 'Fosters accountability and engagement.', 'Publishing dashboards, reporting progress, explaining methodologies.',
  'Climate Fluency', 1.6, 1.6, 0.0, 'No Gap', 'Arsenal FC requires Transparency Culture at 1.6/4 maturity', 'Medium',
  0.25, 0.3, 0.15, 0.25, 0.7, 0.5,
  0.05, 0.5, 0.35, 0.1, 0.3,
  0.05, 0.03, 0.03, 0.65, 0.15
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  45, 'IT', 'Values', 'Privacy Respect', 'Protect stakeholder data rights', 'Meets legal requirements and earns user trust.', 'Anonymising data, obtaining consents, adhering to regulations.',
  'Risk', 1.6, 1.4, 0.2, 'No Gap', 'Arsenal FC requires Privacy Respect at 1.6/4 maturity', 'High',
  0.25, 0.3, 0.15, 0.25, 0.7, 0.5,
  0.05, 0.5, 0.35, 0.1, 0.3,
  0.05, 0.03, 0.03, 0.65, 0.15
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  46, 'IT', 'Attitudes', 'Innovation Mindset', 'Explore creative solutions for sustainability', 'Accelerates progress and competitiveness.', 'Piloting tools, testing prototypes, scaling successes.',
  'Data & AI', 1.6, 1.6, 0.0, 'No Gap', 'Arsenal FC requires Innovation Mindset at 1.6/4 maturity', 'High',
  0.25, 0.3, 0.15, 0.25, 0.7, 0.5,
  0.05, 0.5, 0.35, 0.1, 0.3,
  0.05, 0.03, 0.03, 0.65, 0.15
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  47, 'IT', 'Attitudes', 'Problem Solving', 'Tackle sustainability challenges proactively', 'Reduces delays and enhances effectiveness.', 'Investigating inefficiencies, proposing solutions, collaborating cross-functionally.',
  'Circular Practices', 1.6, 1.2, 0.4, 'No Gap', 'Arsenal FC requires Problem Solving at 1.6/4 maturity', 'High',
  0.25, 0.3, 0.15, 0.25, 0.7, 0.5,
  0.05, 0.5, 0.35, 0.1, 0.3,
  0.05, 0.03, 0.03, 0.65, 0.15
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  48, 'IT', 'Attitudes', 'Adaptive Thinking', 'Adjust strategies in response to change', 'Keeps IT responsive to evolving needs and regulations.', 'Updating roadmaps, reallocating resources, revising targets.',
  'Circular Practices', 1.6, 1.2, 0.4, 'No Gap', 'Arsenal FC requires Adaptive Thinking at 1.6/4 maturity', 'High',
  0.25, 0.3, 0.15, 0.25, 0.7, 0.5,
  0.05, 0.5, 0.35, 0.1, 0.3,
  0.05, 0.03, 0.03, 0.65, 0.15
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  49, 'Legal', 'Technical', 'ESG Contract Clauses', 'Draft sustainability requirements into agreements', 'Ensures commitments are enforceable and clear.', 'Including carbon targets, requiring supplier disclosures, defining audit rights.',
  'Decarbonisation', 3.0, 1.2, 1.8, 'Moderate', 'Arsenal FC requires ESG Contract Clauses at 3.0/4 maturity', 'Foundation',
  0.1, 0.1, 0.05, 0.3, 0.55, 0.4,
  0.03, 0.1, 0.03, 0.02, 0.03,
  0.1, 0.03, 0.03, 0.7, 0.05
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  50, 'Legal', 'Technical', 'Greenwashing Defense', 'Mitigate risks of misleading claims', 'Reduces reputational and regulatory risks.', 'Reviewing campaigns, checking substantiation, advising on disclaimers.',
  'Risk', 3.0, 2.0, 1.0, 'Moderate', 'Arsenal FC requires Greenwashing Defense at 3.0/4 maturity', 'Medium',
  0.1, 0.1, 0.05, 0.3, 0.55, 0.4,
  0.03, 0.1, 0.03, 0.02, 0.03,
  0.1, 0.03, 0.03, 0.7, 0.05
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  51, 'Legal', 'Technical', 'Circular Policy Drafting', 'Support circular economy laws and policies', 'Embeds sustainability into legal frameworks.', 'Developing procurement policies, updating supplier codes, advising business units.',
  'Circular Practices', 3.0, 1.2, 1.8, 'Moderate', 'Arsenal FC requires Circular Policy Drafting at 3.0/4 maturity', 'High',
  0.1, 0.1, 0.05, 0.3, 0.55, 0.4,
  0.03, 0.1, 0.03, 0.02, 0.03,
  0.1, 0.03, 0.03, 0.7, 0.05
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  52, 'Legal', 'Knowledgeable', 'Environmental Regulations', 'Understand evolving ESG laws', 'Ensures proactive compliance and readiness.', 'Tracking regulations, briefing teams, updating policies.',
  'Climate Fluency', 3.0, 1.8, 1.2, 'Moderate', 'Arsenal FC requires Environmental Regulations at 3.0/4 maturity', 'Foundation',
  0.1, 0.1, 0.05, 0.3, 0.55, 0.4,
  0.03, 0.1, 0.03, 0.02, 0.03,
  0.1, 0.03, 0.03, 0.7, 0.05
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  53, 'Legal', 'Knowledgeable', 'Climate Disclosure Rules', 'Advise on climate reporting obligations', 'Supports transparency and reduces litigation risk.', 'Reviewing reports, advising boards, ensuring consistency.',
  'Climate Fluency', 3.0, 1.8, 1.2, 'Moderate', 'Arsenal FC requires Climate Disclosure Rules at 3.0/4 maturity', 'Medium',
  0.1, 0.1, 0.05, 0.3, 0.55, 0.4,
  0.03, 0.1, 0.03, 0.02, 0.03,
  0.1, 0.03, 0.03, 0.7, 0.05
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  54, 'Legal', 'Knowledgeable', 'Due Diligence Law', 'Apply ESG in M&A and partnerships', 'Avoids inheriting liabilities and protects value.', 'Conducting ESG due diligence, flagging risks, advising on warranties.',
  'Risk', 3.0, 2.0, 1.0, 'Moderate', 'Arsenal FC requires Due Diligence Law at 3.0/4 maturity', 'High',
  0.1, 0.1, 0.05, 0.3, 0.55, 0.4,
  0.03, 0.1, 0.03, 0.02, 0.03,
  0.1, 0.03, 0.03, 0.7, 0.05
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  55, 'Legal', 'Values', 'Fairness Focus', 'Prioritise justice in legal decisions', 'Reinforces trust with stakeholders.', 'Considering community impacts, balancing interests, advising on ethics.',
  'Climate Fluency', 3.0, 1.8, 1.2, 'Moderate', 'Arsenal FC requires Fairness Focus at 3.0/4 maturity', 'Foundation',
  0.1, 0.1, 0.05, 0.3, 0.55, 0.4,
  0.03, 0.1, 0.03, 0.02, 0.03,
  0.1, 0.03, 0.03, 0.7, 0.05
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  56, 'Legal', 'Values', 'Compliance Ethos', 'Uphold standards rigorously', 'Protects the organisation and maintains credibility.', 'Refusing shortcuts, challenging non-compliance, documenting decisions.',
  'Risk', 3.0, 2.0, 1.0, 'Moderate', 'Arsenal FC requires Compliance Ethos at 3.0/4 maturity', 'Medium',
  0.1, 0.1, 0.05, 0.3, 0.55, 0.4,
  0.03, 0.1, 0.03, 0.02, 0.03,
  0.1, 0.03, 0.03, 0.7, 0.05
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  57, 'Legal', 'Values', 'Justice Orientation', 'Promote equity and fairness', 'Builds stakeholder confidence and reduces risk of discrimination.', 'Advising on inclusive policies, reviewing language, championing access to remedies.',
  'Decarbonisation', 3.0, 1.2, 1.8, 'Moderate', 'Arsenal FC requires Justice Orientation at 3.0/4 maturity', 'High',
  0.1, 0.1, 0.05, 0.3, 0.55, 0.4,
  0.03, 0.1, 0.03, 0.02, 0.03,
  0.1, 0.03, 0.03, 0.7, 0.05
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  58, 'Legal', 'Attitudes', 'Integrity Driven', 'Act with honesty and consistency', 'Protects reputation and sets the tone for the organisation.', 'Disclosing conflicts, admitting errors, advocating transparent decisions.',
  'Data & AI', 3.0, 1.4, 1.6, 'Moderate', 'Arsenal FC requires Integrity Driven at 3.0/4 maturity', 'Foundation',
  0.1, 0.1, 0.05, 0.3, 0.55, 0.4,
  0.03, 0.1, 0.03, 0.02, 0.03,
  0.1, 0.03, 0.03, 0.7, 0.05
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  59, 'Legal', 'Attitudes', 'Risk Awareness', 'Recognise and mitigate ESG risks', 'Enables proactive responses to new threats.', 'Monitoring developments, flagging early warnings, updating risk registers.',
  'Risk', 3.0, 2.0, 1.0, 'Moderate', 'Arsenal FC requires Risk Awareness at 3.0/4 maturity', 'Medium',
  0.1, 0.1, 0.05, 0.3, 0.55, 0.4,
  0.03, 0.1, 0.03, 0.02, 0.03,
  0.1, 0.03, 0.03, 0.7, 0.05
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  60, 'Legal', 'Attitudes', 'Critical Analysis', 'Question assumptions and interpretations', 'Ensures defensible and robust outcomes.', 'Testing scenarios, consulting experts, playing devil’s advocate.',
  'Circular Practices', 3.0, 1.2, 1.8, 'Moderate', 'Arsenal FC requires Critical Analysis at 3.0/4 maturity', 'High',
  0.1, 0.1, 0.05, 0.3, 0.55, 0.4,
  0.03, 0.1, 0.03, 0.02, 0.03,
  0.1, 0.03, 0.03, 0.7, 0.05
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  61, 'Supply Chain', 'Technical', 'Carbon Hotspot Mapping', 'Identify emissions-intensive activities', 'Targets improvement efforts where they matter most.', 'Mapping emissions by tier, ranking suppliers, updating priority lists.',
  'Decarbonisation', 3.4, 1.2, 2.2, 'Critical', 'Arsenal FC requires Carbon Hotspot Mapping at 3.4/4 maturity', 'Foundation',
  0.65, 0.15, 0.05, 0.2, 0.25, 0.3,
  0.15, 0.1, 0.05, 0.05, 0.15,
  0.6, 0.3, 0.2, 0.6, 0.4
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  62, 'Supply Chain', 'Technical', 'Low-Emission Transport', 'Reduce logistics emissions', 'Lowers Scope 3 emissions and costs.', 'Selecting electric fleets, optimising routes, consolidating shipments.',
  'Decarbonisation', 3.4, 1.2, 2.2, 'Critical', 'Arsenal FC requires Low-Emission Transport at 3.4/4 maturity', 'Medium',
  0.65, 0.15, 0.05, 0.2, 0.25, 0.3,
  0.15, 0.1, 0.05, 0.05, 0.15,
  0.6, 0.3, 0.2, 0.6, 0.4
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  63, 'Supply Chain', 'Technical', 'Circular Inventory', 'Manage products for reuse and recycling', 'Supports circular economy commitments and cost savings.', 'Implementing take-back programs, designing for disassembly, managing stock for reuse.',
  'Circular Practices', 3.4, 1.0, 2.4, 'Critical', 'Arsenal FC requires Circular Inventory at 3.4/4 maturity', 'High',
  0.65, 0.15, 0.05, 0.2, 0.25, 0.3,
  0.15, 0.1, 0.05, 0.05, 0.15,
  0.6, 0.3, 0.2, 0.6, 0.4
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  64, 'Supply Chain', 'Knowledgeable', 'Circular Logistics', 'Understand reverse logistics principles', 'Enables effective circular supply chains.', 'Learning best practices, sharing case studies, training teams.',
  'Circular Practices', 3.4, 1.0, 2.4, 'Critical', 'Arsenal FC requires Circular Logistics at 3.4/4 maturity', 'Foundation',
  0.65, 0.15, 0.05, 0.2, 0.25, 0.3,
  0.15, 0.1, 0.05, 0.05, 0.15,
  0.6, 0.3, 0.2, 0.6, 0.4
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  65, 'Supply Chain', 'Knowledgeable', 'Scope 3 Visibility', 'Track indirect supply chain emissions', 'Supports transparency and compliance with reporting standards.', 'Using tools to collect data, verifying accuracy, preparing reports.',
  'Data & AI', 3.4, 1.0, 2.4, 'Critical', 'Arsenal FC requires Scope 3 Visibility at 3.4/4 maturity', 'Medium',
  0.65, 0.15, 0.05, 0.2, 0.25, 0.3,
  0.15, 0.1, 0.05, 0.05, 0.15,
  0.6, 0.3, 0.2, 0.6, 0.4
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  66, 'Supply Chain', 'Knowledgeable', 'Climate Risk Planning', 'Anticipate disruptions from climate impacts', 'Builds resilience and protects continuity.', 'Conducting risk assessments, modelling scenarios, updating contingency plans.',
  'Risk', 3.4, 1.2, 2.2, 'Critical', 'Arsenal FC requires Climate Risk Planning at 3.4/4 maturity', 'High',
  0.65, 0.15, 0.05, 0.2, 0.25, 0.3,
  0.15, 0.1, 0.05, 0.05, 0.15,
  0.6, 0.3, 0.2, 0.6, 0.4
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  67, 'Supply Chain', 'Values', 'Responsible Sourcing', 'Choose ethical and sustainable suppliers', 'Improves resilience and protects brand reputation.', 'Using supplier codes, auditing compliance, rewarding leaders.',
  'Climate Fluency', 3.4, 1.2, 2.2, 'Critical', 'Arsenal FC requires Responsible Sourcing at 3.4/4 maturity', 'Foundation',
  0.65, 0.15, 0.05, 0.2, 0.25, 0.3,
  0.15, 0.1, 0.05, 0.05, 0.15,
  0.6, 0.3, 0.2, 0.6, 0.4
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  68, 'Supply Chain', 'Values', 'Resource Stewardship', 'Use resources wisely', 'Reduces costs and environmental footprint.', 'Monitoring waste, optimising packaging, designing efficient processes.',
  'Decarbonisation', 3.4, 1.2, 2.2, 'Critical', 'Arsenal FC requires Resource Stewardship at 3.4/4 maturity', 'Medium',
  0.65, 0.15, 0.05, 0.2, 0.25, 0.3,
  0.15, 0.1, 0.05, 0.05, 0.15,
  0.6, 0.3, 0.2, 0.6, 0.4
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  69, 'Supply Chain', 'Values', 'Fair Trade Values', 'Develop Fair Trade Values capabilities for sustainable supply chain operations', 'Reinforces social responsibility and compliance.', 'Selecting certified suppliers, communicating expectations, monitoring labour practices.',
  'Risk', 3.4, 1.2, 2.2, 'Critical', 'Arsenal FC requires Fair Trade Values at 3.4/4 maturity', 'High',
  0.65, 0.15, 0.05, 0.2, 0.25, 0.3,
  0.15, 0.1, 0.05, 0.05, 0.15,
  0.6, 0.3, 0.2, 0.6, 0.4
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  70, 'Supply Chain', 'Attitudes', 'Resilience Focus', 'Anticipate and adapt to disruptions', 'Maintains performance under pressure.', 'Reviewing contingency plans, training teams, building redundancy.',
  'Risk', 3.4, 1.2, 2.2, 'Critical', 'Arsenal FC requires Resilience Focus at 3.4/4 maturity', 'Foundation',
  0.65, 0.15, 0.05, 0.2, 0.25, 0.3,
  0.15, 0.1, 0.05, 0.05, 0.15,
  0.6, 0.3, 0.2, 0.6, 0.4
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  71, 'Supply Chain', 'Attitudes', 'Partnership Mindset', 'Collaborate to solve challenges', 'Leverages collective knowledge and influence.', 'Joining collaborations, co-developing solutions, sharing best practices.',
  'Climate Fluency', 3.4, 1.2, 2.2, 'Critical', 'Arsenal FC requires Partnership Mindset at 3.4/4 maturity', 'Medium',
  0.65, 0.15, 0.05, 0.2, 0.25, 0.3,
  0.15, 0.1, 0.05, 0.05, 0.15,
  0.6, 0.3, 0.2, 0.6, 0.4
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  72, 'Supply Chain', 'Attitudes', 'Systems Thinking', 'Understand interdependencies', 'Leads to better-informed, more strategic decisions.', 'Mapping value chain impacts, identifying leverage points, communicating across functions.',
  'Data & AI', 3.4, 1.0, 2.4, 'Critical', 'Arsenal FC requires Systems Thinking at 3.4/4 maturity', 'High',
  0.65, 0.15, 0.05, 0.2, 0.25, 0.3,
  0.15, 0.1, 0.05, 0.05, 0.15,
  0.6, 0.3, 0.2, 0.6, 0.4
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  73, 'HR', 'Technical', 'Green Workforce Planning', 'Align workforce to sustainability goals', 'Ensures the business has the right capabilities for the transition.', 'Workforce mapping, future skills analysis, succession planning.',
  'Climate Fluency', 2.0, 1.8, 0.2, 'No Gap', 'Arsenal FC requires Green Workforce Planning at 2.0/4 maturity', 'Foundation',
  0.15, 0.1, 0.05, 0.4, 0.6, 0.5,
  0.05, 0.15, 0.05, 0.02, 0.05,
  0.05, 0.03, 0.05, 0.8, 0.1
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  74, 'HR', 'Technical', 'Sustainable Benefits', 'Create benefits supporting sustainability', 'Reinforces commitment and engages employees.', 'Subsidising public transport, offering green pensions, creating wellbeing programs.',
  'Decarbonisation', 2.0, 1.4, 0.6, 'No Gap', 'Arsenal FC requires Sustainable Benefits at 2.0/4 maturity', 'Medium',
  0.15, 0.1, 0.05, 0.4, 0.6, 0.5,
  0.05, 0.15, 0.05, 0.02, 0.05,
  0.05, 0.03, 0.05, 0.8, 0.1
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  75, 'HR', 'Technical', 'Net Zero Onboarding', 'Embed sustainability in induction programs', 'Builds early engagement and alignment.', 'Including ESG modules, assigning champions, sharing resources.',
  'Decarbonisation', 2.0, 1.4, 0.6, 'No Gap', 'Arsenal FC requires Net Zero Onboarding at 2.0/4 maturity', 'High',
  0.15, 0.1, 0.05, 0.4, 0.6, 0.5,
  0.05, 0.15, 0.05, 0.02, 0.05,
  0.05, 0.03, 0.05, 0.8, 0.1
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  76, 'HR', 'Knowledgeable', 'Green Upskilling Knowledge', 'Develop Green Upskilling Knowledge capabilities for sustainable hr operations', 'Critical for Arsenal FC''s sustainability strategy in HR', 'Apply Green Upskilling Knowledge practices in hr activities',
  'Climate Fluency', 2.0, 1.8, 0.2, 'No Gap', 'Arsenal FC requires Green Upskilling Knowledge at 2.0/4 maturity', 'Medium',
  0.15, 0.1, 0.05, 0.4, 0.6, 0.5,
  0.05, 0.15, 0.05, 0.02, 0.05,
  0.05, 0.03, 0.05, 0.8, 0.1
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  77, 'HR', 'Knowledgeable', 'Climate Policy Awareness', 'Understand sustainability regulations affecting HR', 'Avoids compliance risks and supports proactive action.', 'Reviewing regulations, briefing leaders, updating policies.',
  'Risk', 2.0, 1.4, 0.6, 'No Gap', 'Arsenal FC requires Climate Policy Awareness at 2.0/4 maturity', 'Medium',
  0.15, 0.1, 0.05, 0.4, 0.6, 0.5,
  0.05, 0.15, 0.05, 0.02, 0.05,
  0.05, 0.03, 0.05, 0.8, 0.1
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  78, 'HR', 'Knowledgeable', 'Diversity Integration', 'Connect inclusion with sustainability', 'Strengthens culture and social impact.', 'Linking DEI and sustainability metrics, developing inclusive practices.',
  'Circular Practices', 2.0, 1.2, 0.8, 'No Gap', 'Arsenal FC requires Diversity Integration at 2.0/4 maturity', 'High',
  0.15, 0.1, 0.05, 0.4, 0.6, 0.5,
  0.05, 0.15, 0.05, 0.02, 0.05,
  0.05, 0.03, 0.05, 0.8, 0.1
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  79, 'HR', 'Values', 'Inclusion Commitment', 'Prioritise fairness and belonging', 'Drives engagement and retention.', 'Addressing bias, celebrating diversity, promoting psychological safety.',
  'Climate Fluency', 2.0, 1.8, 0.2, 'No Gap', 'Arsenal FC requires Inclusion Commitment at 2.0/4 maturity', 'Foundation',
  0.15, 0.1, 0.05, 0.4, 0.6, 0.5,
  0.05, 0.15, 0.05, 0.02, 0.05,
  0.05, 0.03, 0.05, 0.8, 0.1
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  80, 'HR', 'Values', 'Purpose Driven', 'Connect work to a bigger mission', 'Enhances motivation and performance.', 'Sharing success stories, aligning goals to purpose, recognising contributions.',
  'Decarbonisation', 2.0, 1.4, 0.6, 'No Gap', 'Arsenal FC requires Purpose Driven at 2.0/4 maturity', 'Medium',
  0.15, 0.1, 0.05, 0.4, 0.6, 0.5,
  0.05, 0.15, 0.05, 0.02, 0.05,
  0.05, 0.03, 0.05, 0.8, 0.1
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  81, 'HR', 'Values', 'Health & Wellbeing Focus', 'Develop Health & Wellbeing Focus capabilities for sustainable hr operations', 'Critical for Arsenal FC''s sustainability strategy in HR', 'Apply Health & Wellbeing Focus practices in hr activities',
  'Risk', 2.0, 1.4, 0.6, 'No Gap', 'Arsenal FC requires Health & Wellbeing Focus at 2.0/4 maturity', 'Medium',
  0.15, 0.1, 0.05, 0.4, 0.6, 0.5,
  0.05, 0.15, 0.05, 0.02, 0.05,
  0.05, 0.03, 0.05, 0.8, 0.1
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  82, 'HR', 'Attitudes', 'Culture Building', 'Foster shared values and practices', 'Embeds long-term behavioural change.', 'Running engagement programs, championing recognition, reinforcing rituals.',
  'Data & AI', 2.0, 1.2, 0.8, 'No Gap', 'Arsenal FC requires Culture Building at 2.0/4 maturity', 'Foundation',
  0.15, 0.1, 0.05, 0.4, 0.6, 0.5,
  0.05, 0.15, 0.05, 0.02, 0.05,
  0.05, 0.03, 0.05, 0.8, 0.1
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  83, 'HR', 'Attitudes', 'Empathy Orientation', 'Understand diverse perspectives', 'Increases inclusion and quality of solutions.', 'Conducting listening exercises, adapting policies, modelling understanding.',
  'Climate Fluency', 2.0, 1.8, 0.2, 'No Gap', 'Arsenal FC requires Empathy Orientation at 2.0/4 maturity', 'Medium',
  0.15, 0.1, 0.05, 0.4, 0.6, 0.5,
  0.05, 0.15, 0.05, 0.02, 0.05,
  0.05, 0.03, 0.05, 0.8, 0.1
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  84, 'HR', 'Attitudes', 'Open Communication', 'Share information transparently', 'Builds trust and credibility.', 'Regular updates, clear expectations, two-way feedback channels.',
  'Circular Practices', 2.0, 1.2, 0.8, 'No Gap', 'Arsenal FC requires Open Communication at 2.0/4 maturity', 'High',
  0.15, 0.1, 0.05, 0.4, 0.6, 0.5,
  0.05, 0.15, 0.05, 0.02, 0.05,
  0.05, 0.03, 0.05, 0.8, 0.1
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  85, 'CxO / Executive', 'Technical', 'ESG Strategy Design', 'Develop ESG Strategy Design capabilities for sustainable cxo / executive operations', 'Critical for Arsenal FC''s sustainability strategy in CxO / Executive', 'Apply ESG Strategy Design practices in cxo / executive activities',
  'Climate Fluency', 3.6, 2.2, 1.4, 'Moderate', 'Arsenal FC requires ESG Strategy Design at 3.6/4 maturity', 'Critical',
  0.5, 0.35, 0.1, 0.35, 0.45, 0.35,
  0.12, 0.25, 0.12, 0.05, 0.1,
  0.3, 0.1, 0.15, 0.75, 0.25
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  86, 'CxO / Executive', 'Technical', 'Decarbonisation Roadmapping', 'Develop Decarbonisation Roadmapping capabilities for sustainable cxo / executive operations', 'Critical for Arsenal FC''s sustainability strategy in CxO / Executive', 'Apply Decarbonisation Roadmapping practices in cxo / executive activities',
  'Decarbonisation', 3.6, 1.6, 2.0, 'Critical', 'Arsenal FC requires Decarbonisation Roadmapping at 3.6/4 maturity', 'Critical',
  0.5, 0.35, 0.1, 0.35, 0.45, 0.35,
  0.12, 0.25, 0.12, 0.05, 0.1,
  0.3, 0.1, 0.15, 0.75, 0.25
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  87, 'CxO / Executive', 'Technical', 'Sustainable Investment', 'Develop Sustainable Investment capabilities for sustainable cxo / executive operations', 'Critical for Arsenal FC''s sustainability strategy in CxO / Executive', 'Apply Sustainable Investment practices in cxo / executive activities',
  'Decarbonisation', 3.6, 1.6, 2.0, 'Critical', 'Arsenal FC requires Sustainable Investment at 3.6/4 maturity', 'Critical',
  0.5, 0.35, 0.1, 0.35, 0.45, 0.35,
  0.12, 0.25, 0.12, 0.05, 0.1,
  0.3, 0.1, 0.15, 0.75, 0.25
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  88, 'CxO / Executive', 'Knowledgeable', 'Climate Governance', 'Develop Climate Governance capabilities for sustainable cxo / executive operations', 'Critical for Arsenal FC''s sustainability strategy in CxO / Executive', 'Apply Climate Governance practices in cxo / executive activities',
  'Climate Fluency', 3.6, 2.2, 1.4, 'Moderate', 'Arsenal FC requires Climate Governance at 3.6/4 maturity', 'Critical',
  0.5, 0.35, 0.1, 0.35, 0.45, 0.35,
  0.12, 0.25, 0.12, 0.05, 0.1,
  0.3, 0.1, 0.15, 0.75, 0.25
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  89, 'CxO / Executive', 'Knowledgeable', 'Regulatory Mastery', 'Develop Regulatory Mastery capabilities for sustainable cxo / executive operations', 'Critical for Arsenal FC''s sustainability strategy in CxO / Executive', 'Apply Regulatory Mastery practices in cxo / executive activities',
  'Risk', 3.6, 1.8, 1.8, 'Moderate', 'Arsenal FC requires Regulatory Mastery at 3.6/4 maturity', 'Critical',
  0.5, 0.35, 0.1, 0.35, 0.45, 0.35,
  0.12, 0.25, 0.12, 0.05, 0.1,
  0.3, 0.1, 0.15, 0.75, 0.25
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  90, 'CxO / Executive', 'Knowledgeable', 'TCFD Familiarity', 'Develop TCFD Familiarity capabilities for sustainable cxo / executive operations', 'Critical for Arsenal FC''s sustainability strategy in CxO / Executive', 'Apply TCFD Familiarity practices in cxo / executive activities',
  'Data & AI', 3.6, 1.8, 1.8, 'Moderate', 'Arsenal FC requires TCFD Familiarity at 3.6/4 maturity', 'Critical',
  0.5, 0.35, 0.1, 0.35, 0.45, 0.35,
  0.12, 0.25, 0.12, 0.05, 0.1,
  0.3, 0.1, 0.15, 0.75, 0.25
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  91, 'CxO / Executive', 'Values', 'Visionary Leadership', 'Develop Visionary Leadership capabilities for sustainable cxo / executive operations', 'Critical for Arsenal FC''s sustainability strategy in CxO / Executive', 'Apply Visionary Leadership practices in cxo / executive activities',
  'Climate Fluency', 3.6, 2.2, 1.4, 'Moderate', 'Arsenal FC requires Visionary Leadership at 3.6/4 maturity', 'Critical',
  0.5, 0.35, 0.1, 0.35, 0.45, 0.35,
  0.12, 0.25, 0.12, 0.05, 0.1,
  0.3, 0.1, 0.15, 0.75, 0.25
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  92, 'CxO / Executive', 'Values', 'Stewardship Values', 'Develop Stewardship Values capabilities for sustainable cxo / executive operations', 'Critical for Arsenal FC''s sustainability strategy in CxO / Executive', 'Apply Stewardship Values practices in cxo / executive activities',
  'Decarbonisation', 3.6, 1.6, 2.0, 'Critical', 'Arsenal FC requires Stewardship Values at 3.6/4 maturity', 'Critical',
  0.5, 0.35, 0.1, 0.35, 0.45, 0.35,
  0.12, 0.25, 0.12, 0.05, 0.1,
  0.3, 0.1, 0.15, 0.75, 0.25
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  93, 'CxO / Executive', 'Values', 'Systemic Responsibility', 'Develop Systemic Responsibility capabilities for sustainable cxo / executive operations', 'Critical for Arsenal FC''s sustainability strategy in CxO / Executive', 'Apply Systemic Responsibility practices in cxo / executive activities',
  'Risk', 3.6, 1.8, 1.8, 'Moderate', 'Arsenal FC requires Systemic Responsibility at 3.6/4 maturity', 'Critical',
  0.5, 0.35, 0.1, 0.35, 0.45, 0.35,
  0.12, 0.25, 0.12, 0.05, 0.1,
  0.3, 0.1, 0.15, 0.75, 0.25
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  94, 'CxO / Executive', 'Attitudes', 'Bold Commitment', 'Develop Bold Commitment capabilities for sustainable cxo / executive operations', 'Critical for Arsenal FC''s sustainability strategy in CxO / Executive', 'Apply Bold Commitment practices in cxo / executive activities',
  'Climate Fluency', 3.6, 2.2, 1.4, 'Moderate', 'Arsenal FC requires Bold Commitment at 3.6/4 maturity', 'Critical',
  0.5, 0.35, 0.1, 0.35, 0.45, 0.35,
  0.12, 0.25, 0.12, 0.05, 0.1,
  0.3, 0.1, 0.15, 0.75, 0.25
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  95, 'CxO / Executive', 'Attitudes', 'Accountability Driven', 'Develop Accountability Driven capabilities for sustainable cxo / executive operations', 'Critical for Arsenal FC''s sustainability strategy in CxO / Executive', 'Apply Accountability Driven practices in cxo / executive activities',
  'Risk', 3.6, 1.8, 1.8, 'Moderate', 'Arsenal FC requires Accountability Driven at 3.6/4 maturity', 'Critical',
  0.5, 0.35, 0.1, 0.35, 0.45, 0.35,
  0.12, 0.25, 0.12, 0.05, 0.1,
  0.3, 0.1, 0.15, 0.75, 0.25
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  96, 'CxO / Executive', 'Attitudes', 'Adaptive Mindset', 'Develop Adaptive Mindset capabilities for sustainable cxo / executive operations', 'Critical for Arsenal FC''s sustainability strategy in CxO / Executive', 'Apply Adaptive Mindset practices in cxo / executive activities',
  'Circular Practices', 3.6, 1.4, 2.2, 'Critical', 'Arsenal FC requires Adaptive Mindset at 3.6/4 maturity', 'Critical',
  0.5, 0.35, 0.1, 0.35, 0.45, 0.35,
  0.12, 0.25, 0.12, 0.05, 0.1,
  0.3, 0.1, 0.15, 0.75, 0.25
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  97, 'Operations', 'Technical', 'Energy Efficiency', 'Reduce energy use in operations', 'Cuts costs and supports decarbonisation commitments.', 'Upgrading equipment, optimising schedules, tracking energy performance.',
  'Decarbonisation', 3.8, 1.6, 2.2, 'Critical', 'Arsenal FC requires Energy Efficiency at 3.8/4 maturity', 'Foundation',
  0.6, 0.45, 0.35, 0.35, 0.2, 0.35,
  0.3, 0.1, 0.05, 0.15, 0.15,
  0.25, 0.15, 0.25, 0.7, 0.45
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  98, 'Operations', 'Technical', 'Circular Process Design', 'Design for reuse and recycling', 'Reduces resource use and aligns with circular economy strategies.', 'Setting up closed-loop systems, redesigning packaging, specifying recyclable materials.',
  'Circular Practices', 3.8, 1.2, 2.6, 'Critical', 'Arsenal FC requires Circular Process Design at 3.8/4 maturity', 'Medium',
  0.6, 0.45, 0.35, 0.35, 0.2, 0.35,
  0.3, 0.1, 0.05, 0.15, 0.15,
  0.25, 0.15, 0.25, 0.7, 0.45
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  99, 'Operations', 'Technical', 'Waste Reduction', 'Minimise operational waste', 'Reduces environmental impacts and regulatory risks.', 'Conducting waste audits, implementing reduction plans, measuring progress.',
  'Circular Practices', 3.8, 1.2, 2.6, 'Critical', 'Arsenal FC requires Waste Reduction at 3.8/4 maturity', 'High',
  0.6, 0.45, 0.35, 0.35, 0.2, 0.35,
  0.3, 0.1, 0.05, 0.15, 0.15,
  0.25, 0.15, 0.25, 0.7, 0.45
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  100, 'Operations', 'Knowledgeable', 'Process Footprinting', 'Understand environmental impacts of operations', 'Informs decisions to prioritise improvements.', 'Creating impact maps, benchmarking performance, sharing insights.',
  'Data & AI', 3.8, 1.4, 2.4, 'Critical', 'Arsenal FC requires Process Footprinting at 3.8/4 maturity', 'Foundation',
  0.6, 0.45, 0.35, 0.35, 0.2, 0.35,
  0.3, 0.1, 0.05, 0.15, 0.15,
  0.25, 0.15, 0.25, 0.7, 0.45
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  101, 'Operations', 'Knowledgeable', 'Emissions Tracking', 'Monitor carbon output from activities', 'Ensures accurate reporting and supports progress monitoring.', 'Installing meters, maintaining records, integrating data into reporting.',
  'Decarbonisation', 3.8, 1.6, 2.2, 'Critical', 'Arsenal FC requires Emissions Tracking at 3.8/4 maturity', 'Medium',
  0.6, 0.45, 0.35, 0.35, 0.2, 0.35,
  0.3, 0.1, 0.05, 0.15, 0.15,
  0.25, 0.15, 0.25, 0.7, 0.45
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  102, 'Operations', 'Knowledgeable', 'ESG Compliance', 'Adhere to sustainability regulations', 'Avoids legal risks and builds credibility.', 'Reviewing requirements, updating procedures, training staff.',
  'Risk', 3.8, 1.4, 2.4, 'Critical', 'Arsenal FC requires ESG Compliance at 3.8/4 maturity', 'High',
  0.6, 0.45, 0.35, 0.35, 0.2, 0.35,
  0.3, 0.1, 0.05, 0.15, 0.15,
  0.25, 0.15, 0.25, 0.7, 0.45
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  103, 'Operations', 'Values', 'Operational Integrity', 'Uphold sustainability commitments', 'Builds trust internally and externally.', 'Meeting targets, disclosing progress, flagging issues promptly.',
  'Climate Fluency', 3.8, 1.8, 2.0, 'Critical', 'Arsenal FC requires Operational Integrity at 3.8/4 maturity', 'Foundation',
  0.6, 0.45, 0.35, 0.35, 0.2, 0.35,
  0.3, 0.1, 0.05, 0.15, 0.15,
  0.25, 0.15, 0.25, 0.7, 0.45
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  104, 'Operations', 'Values', 'Resource Responsibility', 'Use materials and energy efficiently', 'Reduces costs and environmental impacts.', 'Reducing scrap rates, optimising processes, training teams.',
  'Decarbonisation', 3.8, 1.6, 2.2, 'Critical', 'Arsenal FC requires Resource Responsibility at 3.8/4 maturity', 'Medium',
  0.6, 0.45, 0.35, 0.35, 0.2, 0.35,
  0.3, 0.1, 0.05, 0.15, 0.15,
  0.25, 0.15, 0.25, 0.7, 0.45
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  105, 'Operations', 'Values', 'Transparency Ethos', 'Share clear information on performance', 'Builds credibility with stakeholders.', 'Publishing dashboards, sharing lessons learned, updating teams.',
  'Risk', 3.8, 1.4, 2.4, 'Critical', 'Arsenal FC requires Transparency Ethos at 3.8/4 maturity', 'High',
  0.6, 0.45, 0.35, 0.35, 0.2, 0.35,
  0.3, 0.1, 0.05, 0.15, 0.15,
  0.25, 0.15, 0.25, 0.7, 0.45
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  106, 'Operations', 'Attitudes', 'Improvement Focus', 'Seek out better ways to work', 'Drives ongoing progress and innovation.', 'Suggesting new ideas, testing pilots, celebrating improvements.',
  'Climate Fluency', 3.8, 1.8, 2.0, 'Critical', 'Arsenal FC requires Improvement Focus at 3.8/4 maturity', 'Foundation',
  0.6, 0.45, 0.35, 0.35, 0.2, 0.35,
  0.3, 0.1, 0.05, 0.15, 0.15,
  0.25, 0.15, 0.25, 0.7, 0.45
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  107, 'Operations', 'Attitudes', 'Ownership Culture', 'Take responsibility for results', 'Increases engagement and delivery of targets.', 'Setting clear expectations, recognising success, addressing gaps quickly.',
  'Data & AI', 3.8, 1.4, 2.4, 'Critical', 'Arsenal FC requires Ownership Culture at 3.8/4 maturity', 'Medium',
  0.6, 0.45, 0.35, 0.35, 0.2, 0.35,
  0.3, 0.1, 0.05, 0.15, 0.15,
  0.25, 0.15, 0.25, 0.7, 0.45
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  108, 'Operations', 'Attitudes', 'Results Orientation', 'Focus on measurable progress', 'Delivers credibility and progress.', 'Defining KPIs, tracking impact rigorously, reporting transparently.',
  'Circular Practices', 3.8, 1.2, 2.6, 'Critical', 'Arsenal FC requires Results Orientation at 3.8/4 maturity', 'High',
  0.6, 0.45, 0.35, 0.35, 0.2, 0.35,
  0.3, 0.1, 0.05, 0.15, 0.15,
  0.25, 0.15, 0.25, 0.7, 0.45
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  109, 'R&D', 'Technical', 'Sustainable Design', 'Develop products with low impacts', 'Drives innovation and aligns with sustainability goals.', 'Using eco-design tools, specifying low-impact materials, testing prototypes.',
  'Climate Fluency', 2.8, 2.4, 0.4, 'No Gap', 'Arsenal FC requires Sustainable Design at 2.8/4 maturity', 'Foundation',
  0.15, 0.2, 0.1, 0.3, 0.7, 0.4,
  0.1, 0.25, 0.17, 0.03, 0.09,
  0.1, 0.03, 0.09, 0.7, 0.15
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  110, 'R&D', 'Technical', 'Low-Carbon Prototyping', 'Test sustainable solutions early', 'Enables rapid learning and reduces risks.', 'Selecting clean technologies, measuring impacts, iterating designs.',
  'Decarbonisation', 2.8, 2.4, 0.4, 'No Gap', 'Arsenal FC requires Low-Carbon Prototyping at 2.8/4 maturity', 'Medium',
  0.15, 0.2, 0.1, 0.3, 0.7, 0.4,
  0.1, 0.25, 0.17, 0.03, 0.09,
  0.1, 0.03, 0.09, 0.7, 0.15
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  111, 'R&D', 'Technical', 'Lifecycle Impact', 'Assess cradle-to-grave impacts', 'Informs better decisions and supports credible claims.', 'Completing LCAs, sharing data with stakeholders, integrating findings.',
  'Decarbonisation', 2.8, 2.4, 0.4, 'No Gap', 'Arsenal FC requires Lifecycle Impact at 2.8/4 maturity', 'High',
  0.15, 0.2, 0.1, 0.3, 0.7, 0.4,
  0.1, 0.25, 0.17, 0.03, 0.09,
  0.1, 0.03, 0.09, 0.7, 0.15
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  112, 'R&D', 'Knowledgeable', 'Circular Innovation', 'Create circular products and models', 'Supports transition to circular economy.', 'Developing take-back schemes, designing modular products, using recycled content.',
  'Circular Practices', 2.8, 2.4, 0.4, 'No Gap', 'Arsenal FC requires Circular Innovation at 2.8/4 maturity', 'Foundation',
  0.15, 0.2, 0.1, 0.3, 0.7, 0.4,
  0.1, 0.25, 0.17, 0.03, 0.09,
  0.1, 0.03, 0.09, 0.7, 0.15
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  113, 'R&D', 'Knowledgeable', 'Eco-Material Knowledge', 'Understand low-impact material options', 'Enables informed material selection and innovation.', 'Researching suppliers, testing materials, documenting performance.',
  'Data & AI', 2.8, 2.4, 0.4, 'No Gap', 'Arsenal FC requires Eco-Material Knowledge at 2.8/4 maturity', 'High',
  0.15, 0.2, 0.1, 0.3, 0.7, 0.4,
  0.1, 0.25, 0.17, 0.03, 0.09,
  0.1, 0.03, 0.09, 0.7, 0.15
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  114, 'R&D', 'Knowledgeable', 'Climate Solutions', 'Develop technologies for decarbonisation', 'Positions the organisation as a leader in sustainability.', 'Prototyping clean tech, scaling solutions, measuring benefits.',
  'Decarbonisation', 2.8, 2.4, 0.4, 'No Gap', 'Arsenal FC requires Climate Solutions at 2.8/4 maturity', 'High',
  0.15, 0.2, 0.1, 0.3, 0.7, 0.4,
  0.1, 0.25, 0.17, 0.03, 0.09,
  0.1, 0.03, 0.09, 0.7, 0.15
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  115, 'R&D', 'Values', 'Regenerative Thinking', 'Design to restore ecosystems', 'Builds resilience and leadership.', 'Developing regenerative products, testing closed-loop models, collaborating with partners.',
  'Climate Fluency', 2.8, 2.4, 0.4, 'No Gap', 'Arsenal FC requires Regenerative Thinking at 2.8/4 maturity', 'Foundation',
  0.15, 0.2, 0.1, 0.3, 0.7, 0.4,
  0.1, 0.25, 0.17, 0.03, 0.09,
  0.1, 0.03, 0.09, 0.7, 0.15
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  116, 'R&D', 'Values', 'Future Orientation', 'Innovate with long-term impacts in mind', 'Avoids short-termism and builds credibility.', 'Incorporating scenarios, engaging stakeholders, reviewing legacy impacts.',
  'Decarbonisation', 2.8, 2.4, 0.4, 'No Gap', 'Arsenal FC requires Future Orientation at 2.8/4 maturity', 'Medium',
  0.15, 0.2, 0.1, 0.3, 0.7, 0.4,
  0.1, 0.25, 0.17, 0.03, 0.09,
  0.1, 0.03, 0.09, 0.7, 0.15
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  117, 'R&D', 'Values', 'Impact Awareness', 'Understand consequences of decisions', 'Builds transparency and trust.', 'Documenting impacts, disclosing limitations, updating designs.',
  'Risk', 2.8, 2.4, 0.4, 'No Gap', 'Arsenal FC requires Impact Awareness at 2.8/4 maturity', 'High',
  0.15, 0.2, 0.1, 0.3, 0.7, 0.4,
  0.1, 0.25, 0.17, 0.03, 0.09,
  0.1, 0.03, 0.09, 0.7, 0.15
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  118, 'R&D', 'Attitudes', 'Curiosity Driven', 'Explore new ideas actively', 'Drives innovation and adaptability.', 'Piloting new approaches, asking questions, sharing insights.',
  'Climate Fluency', 2.8, 2.4, 0.4, 'No Gap', 'Arsenal FC requires Curiosity Driven at 2.8/4 maturity', 'Foundation',
  0.15, 0.2, 0.1, 0.3, 0.7, 0.4,
  0.1, 0.25, 0.17, 0.03, 0.09,
  0.1, 0.03, 0.09, 0.7, 0.15
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  119, 'R&D', 'Attitudes', 'Challenge Acceptance', 'Tackle tough sustainability problems', 'Enables breakthroughs and resilience.', 'Leading pilots, iterating under uncertainty, engaging cross-functional teams.',
  'Data & AI', 2.8, 2.4, 0.4, 'No Gap', 'Arsenal FC requires Challenge Acceptance at 2.8/4 maturity', 'Medium',
  0.15, 0.2, 0.1, 0.3, 0.7, 0.4,
  0.1, 0.25, 0.17, 0.03, 0.09,
  0.1, 0.03, 0.09, 0.7, 0.15
);

INSERT INTO green_skills (id, department, skill_family, green_skill, description, why_it_matters, example_behaviours, theme, required_level, current_level, gap, severity, desired_knowledge, priority_level,
  opt_carbon_footprint, opt_renewable_energy, opt_hvac, opt_office_space, opt_remote_work, opt_work_schedule,
  opt_water_use, opt_digital_footprint, opt_ai_compute, opt_iot_telemetry, opt_hardware_circularity,
  opt_supply_chain_emissions, opt_logistics_shipping, opt_fleet_electrification, opt_employee_commuting, opt_material_waste)
VALUES (
  120, 'R&D', 'Attitudes', 'Experimentation Focus', 'Test, learn, and improve continuously', 'Speeds progress and reduces risks.', 'Running experiments, sharing learnings, pivoting when needed.',
  'Circular Practices', 2.8, 2.4, 0.4, 'No Gap', 'Arsenal FC requires Experimentation Focus at 2.8/4 maturity', 'High',
  0.15, 0.2, 0.1, 0.3, 0.7, 0.4,
  0.1, 0.25, 0.17, 0.03, 0.09,
  0.1, 0.03, 0.09, 0.7, 0.15
);

-- ========================
-- DEPARTMENT EDGES
-- ========================

INSERT INTO department_edges (id, source, target, relationship, weight)
VALUES ('1', 'procurement', 'supply_chain', 'Supplier & Logistics Integration', 0.9);

INSERT INTO department_edges (id, source, target, relationship, weight)
VALUES ('2', 'procurement', 'finance', 'Budget & Cost Alignment', 0.7);

INSERT INTO department_edges (id, source, target, relationship, weight)
VALUES ('3', 'procurement', 'legal', 'Contract & Compliance', 0.6);

INSERT INTO department_edges (id, source, target, relationship, weight)
VALUES ('4', 'procurement', 'operations', 'Stadium Supply Management', 0.8);

INSERT INTO department_edges (id, source, target, relationship, weight)
VALUES ('5', 'finance', 'cxo___executive', 'Strategic Investment Oversight', 0.9);

INSERT INTO department_edges (id, source, target, relationship, weight)
VALUES ('6', 'finance', 'legal', 'Regulatory Compliance', 0.7);

INSERT INTO department_edges (id, source, target, relationship, weight)
VALUES ('7', 'finance', 'operations', 'Operational Budget Control', 0.6);

INSERT INTO department_edges (id, source, target, relationship, weight)
VALUES ('8', 'marketing', 'cxo___executive', 'Brand Strategy Alignment', 0.8);

INSERT INTO department_edges (id, source, target, relationship, weight)
VALUES ('9', 'marketing', 'legal', 'Green Claims Compliance', 0.7);

INSERT INTO department_edges (id, source, target, relationship, weight)
VALUES ('10', 'marketing', 'it', 'Digital Campaign Infrastructure', 0.5);

INSERT INTO department_edges (id, source, target, relationship, weight)
VALUES ('11', 'marketing', 'hr', 'Employer Branding', 0.4);

INSERT INTO department_edges (id, source, target, relationship, weight)
VALUES ('12', 'it', 'operations', 'Stadium Technology Systems', 0.8);

INSERT INTO department_edges (id, source, target, relationship, weight)
VALUES ('13', 'it', 'finance', 'FinTech & Data Analytics', 0.5);

INSERT INTO department_edges (id, source, target, relationship, weight)
VALUES ('14', 'it', 'hr', 'HR Technology Platforms', 0.4);

INSERT INTO department_edges (id, source, target, relationship, weight)
VALUES ('15', 'legal', 'cxo___executive', 'Governance & Risk Advisory', 0.8);

INSERT INTO department_edges (id, source, target, relationship, weight)
VALUES ('16', 'legal', 'hr', 'Employment Law & Policy', 0.5);

INSERT INTO department_edges (id, source, target, relationship, weight)
VALUES ('17', 'supply_chain', 'operations', 'Logistics & Venue Operations', 0.8);

INSERT INTO department_edges (id, source, target, relationship, weight)
VALUES ('18', 'supply_chain', 'r_d', 'Innovation Sourcing', 0.4);

INSERT INTO department_edges (id, source, target, relationship, weight)
VALUES ('19', 'hr', 'cxo___executive', 'Talent & Culture Strategy', 0.7);

INSERT INTO department_edges (id, source, target, relationship, weight)
VALUES ('20', 'hr', 'operations', 'Workforce Management', 0.6);

INSERT INTO department_edges (id, source, target, relationship, weight)
VALUES ('21', 'operations', 'cxo___executive', 'Performance & KPI Reporting', 0.7);

INSERT INTO department_edges (id, source, target, relationship, weight)
VALUES ('22', 'r_d', 'it', 'Technology Innovation', 0.6);

INSERT INTO department_edges (id, source, target, relationship, weight)
VALUES ('23', 'r_d', 'cxo___executive', 'Innovation Strategy', 0.5);

INSERT INTO department_edges (id, source, target, relationship, weight)
VALUES ('24', 'r_d', 'marketing', 'Product-Market Innovation', 0.4);