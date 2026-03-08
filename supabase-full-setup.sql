-- ============================================================
-- GreenPulse — FULL Supabase Setup
-- Paste this entire file into Supabase SQL Editor and click Run
-- Safe to run multiple times (uses IF NOT EXISTS, ON CONFLICT)
-- ============================================================

-- ======================== FOUNDATION ========================
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

-- Generated green_skills seed (run after table creation)
INSERT INTO green_skills (department, skill_family, green_skill, theme, description, why_it_matters, example_behaviours, required_level) VALUES
('Procurement', 'Technical', 'Sustainable Sourcing', 'Climate Fluency', 'Integrate sustainability into purchasing decisions', 'Drives emissions reductions, supports ethical practices, and strengthens resilience in the value chain.', 'Including sustainability criteria in RFPs, preferring suppliers with certifications, evaluating total life cycle impact.', 3),
('Procurement', 'Technical', 'Life Cycle Analysis', 'Climate Fluency', 'Evaluate product impacts across their life cycle', 'Enables informed decision-making and transparent reporting on product footprint.', 'Conducting cradle-to-grave assessments, comparing material options, integrating LCA results into procurement criteria.', 3),
('Procurement', 'Technical', 'Low-Carbon Contracting', 'Climate Fluency', 'Embed emissions goals into supplier agreements', 'Aligns suppliers to decarbonisation commitments and ensures accountability.', 'Including carbon KPIs in contracts, requiring regular emissions reporting, enforcing consequences for non-compliance.', 3),
('Procurement', 'Knowledgeable', 'Supplier Emissions Data', 'Data & AI', 'Understand emissions data in the supply chain', 'Provides a foundation for accurate carbon accounting and progress tracking.', 'Requesting supplier emissions data, verifying against standards, supporting suppliers to improve data quality.', 3),
('Procurement', 'Knowledgeable', 'Circular Procurement', 'Data & AI', 'Prioritise circular materials and processes', 'Reduces waste and resource consumption, supports circular economy goals.', 'Including circularity requirements in tenders, preferring remanufactured products, tracking circular performance metrics.', 3),
('Procurement', 'Knowledgeable', 'Scope 3 Reporting', 'Data & AI', 'Disclose supply chain carbon impacts', 'Supports transparency and regulatory compliance under frameworks like CSRD.', 'Preparing supplier GHG inventories, consolidating data for reports, explaining Scope 3 contributions to stakeholders.', 3),
('Procurement', 'Values', 'Ethical Purchasing', 'Decarbonisation', 'Uphold fairness and sustainability in buying', 'Builds trust with stakeholders and protects reputation.', 'Selecting fair trade suppliers, avoiding products linked to deforestation or exploitation, prioritising local sourcing where possible.', 3),
('Procurement', 'Values', 'Transparency Focus', 'Decarbonisation', 'Share clear information about sourcing', 'Fosters accountability and strengthens supplier relationships.', 'Publishing sourcing policies, providing feedback to suppliers, reporting progress externally.', 3),
('Procurement', 'Values', 'Responsibility Mindset', 'Decarbonisation', 'Take ownership of impacts', 'Encourages proactive improvements rather than compliance-only approaches.', 'Developing action plans for high-impact categories, training teams, engaging in supplier development programs.', 3),
('Procurement', 'Attitudes', 'Proactive Engagement', 'Risk', 'Anticipate issues and act early', 'Reduces disruptions, speeds progress, and demonstrates leadership.', 'Engaging suppliers early on expectations, piloting improvements, sharing forecasts for demand planning.', 3),
('Procurement', 'Attitudes', 'Continuous Improvement', 'Circular Practices', 'Seek better solutions over time', 'Ensures progress keeps pace with expectations and innovation.', 'Conducting periodic reviews, benchmarking against peers, updating policies based on lessons learned.', 3),
('Procurement', 'Attitudes', 'Collaboration Driven', 'Circular Practices', 'Work with suppliers and peers to solve challenges', 'Helps address systemic issues and improves outcomes that no organisation can tackle alone.', 'Joining industry coalitions, co-creating solutions with suppliers, sharing best practices and resources.', 3),
('Finance', 'Technical', 'ESG Risk Modelling', 'Climate Fluency', 'Quantify sustainability-related financial risks', 'Supports resilience and informed decision-making on investments and allocations.', 'Building scenario models, quantifying exposure to carbon pricing, stress-testing assets against climate scenarios.', 3),
('Finance', 'Technical', 'Carbon Costing', 'Climate Fluency', 'Integrate emissions costs into planning', 'Encourages low-carbon decisions and transparency in financial analysis.', 'Including carbon costs in ROI calculations, advising on emissions reduction paybacks, presenting alternative scenarios with carbon pricing.', 3),
('Finance', 'Technical', 'Impact Investing', 'Climate Fluency', 'Allocate funds for positive outcomes', 'Positions the business for sustainable growth and stakeholder confidence.', 'Screening investments for ESG criteria, developing green finance products, monitoring impact KPIs.', 3),
('Finance', 'Knowledgeable', 'Green Finance Principles', 'Data & AI', 'Understand sustainable finance frameworks', 'Ensures compliance and alignment with evolving expectations.', 'Staying updated on regulations, advising teams on eligibility, integrating principles into investment strategies.', 3),
('Finance', 'Knowledgeable', 'Regulatory Compliance', 'Data & AI', 'Track and meet disclosure requirements', 'Avoids legal risk and strengthens investor confidence.', 'Preparing climate disclosures, coordinating data collection, validating accuracy with auditors.', 3),
('Finance', 'Knowledgeable', 'TCFD Knowledge', 'Data & AI', 'Apply climate risk disclosure frameworks', 'Demonstrates transparency and readiness for regulatory scrutiny.', 'Producing scenario analysis, supporting board reporting, aligning with investor expectations.', 3),
('Finance', 'Values', 'Stewardship Commitment', 'Decarbonisation', 'Take responsibility for long-term outcomes', 'Reinforces trust with stakeholders and underpins sustainable performance.', 'Prioritising long-term value creation, questioning short-term trade-offs, advocating responsible investment decisions.', 3),
('Finance', 'Values', 'Integrity Orientation', 'Decarbonisation', 'Uphold ethical standards in reporting', 'Protects reputation and ensures compliance with regulations.', 'Double-checking ESG data, challenging incomplete narratives, ensuring clarity in sustainability messaging.', 3),
('Finance', 'Values', 'Purpose Driven', 'Decarbonisation', 'Align finance with impact goals', 'Enhances engagement and positions finance as a strategic partner.', 'Embedding ESG metrics into KPIs, proposing investments that align with purpose, celebrating impact achievements.', 3),
('Finance', 'Attitudes', 'Long-Term Thinking', 'Risk', 'Prioritise enduring value over short-term gains', 'Future-proofs the business and builds resilience.', 'Reviewing scenarios over 10–30 years, questioning short-term savings that conflict with sustainability, balancing financial and environmental outcomes.', 3),
('Finance', 'Attitudes', 'Accountability Culture', 'Circular Practices', 'Take ownership for ESG results', 'Encourages proactive problem solving and transparency.', 'Regularly reporting progress, engaging peers in shared accountability, driving performance improvements.', 3),
('Finance', 'Attitudes', 'Results Focused', 'Circular Practices', 'Deliver measurable ESG outcomes', 'Builds credibility with investors and stakeholders.', 'Tracking progress against KPIs, addressing gaps quickly, celebrating successes publicly.', 3),
('Marketing', 'Technical', 'Green Claims Review', 'Climate Fluency', 'Assess accuracy of sustainability messages', 'Protects brand trust and ensures compliance with regulations.', 'Verifying claims against evidence, consulting legal teams, updating messaging as needed.', 3),
('Marketing', 'Technical', 'Low-Impact Campaigns', 'Climate Fluency', 'Reduce emissions from marketing activities', 'Demonstrates authenticity and supports decarbonisation targets.', 'Selecting low-carbon media, using digital channels, measuring campaign footprint.', 3),
('Marketing', 'Technical', 'Eco-Labelling Compliance', 'Climate Fluency', 'Use environmental certifications appropriately', 'Avoids misleading customers and meets legal obligations.', 'Confirming certification requirements, training teams, maintaining approvals documentation.', 3),
('Marketing', 'Knowledgeable', 'Sustainability Storytelling', 'Data & AI', 'Communicate impact in compelling ways', 'Builds credibility and inspires customers to engage.', 'Developing case studies, producing videos, aligning messaging to strategy.', 3),
('Marketing', 'Knowledgeable', 'Behavioural Insights', 'Data & AI', 'Apply psychology to encourage sustainable choices', 'Supports decarbonisation and circularity goals through demand shifts.', 'Designing calls to action, testing messages, analysing impact data.', 3),
('Marketing', 'Knowledgeable', 'Circular Promotion', 'Data & AI', 'Highlight reuse and recycling benefits', 'Helps grow participation in circular models and drives differentiation.', 'Campaigning on reuse schemes, co-creating content with customers, celebrating impact stories.', 3),
('Marketing', 'Values', 'Authentic Messaging', 'Decarbonisation', 'Be truthful and transparent in communication', 'Protects reputation and avoids regulatory penalties.', 'Reviewing materials carefully, removing exaggerated language, providing clear sourcing information.', 3),
('Marketing', 'Values', 'Honesty in Claims', 'Decarbonisation', 'Never overstate progress or impacts', 'Builds trust and manages expectations.', 'Publishing supporting data, addressing trade-offs, using neutral language.', 3),
('Marketing', 'Values', 'Social Responsibility', 'Decarbonisation', 'Align marketing with positive impact', 'Strengthens purpose-led brand identity and stakeholder loyalty.', 'Avoiding stereotypes, promoting inclusivity, choosing sustainable partners.', 3),
('Marketing', 'Attitudes', 'Customer Centricity', 'Risk', 'Put customer needs and values first', 'Improves relevance and engagement.', 'Conducting research, adjusting messaging, responding to feedback.', 3),
('Marketing', 'Attitudes', 'Openness to Feedback', 'Circular Practices', 'Be willing to adapt strategies', 'Drives learning and continuous improvement.', 'Running post-campaign reviews, tracking sentiment, acting on feedback.', 3),
('Marketing', 'Attitudes', 'Learning Orientation', 'Circular Practices', 'Stay curious about sustainability trends', 'Keeps marketing relevant and legally compliant.', 'Subscribing to updates, attending webinars, sharing insights internally.', 3),
('IT', 'Technical', 'Green Software Design', 'Climate Fluency', 'Develop energy-efficient applications', 'Lowers digital footprint and operational costs.', 'Optimising code, reducing data storage needs, selecting efficient platforms.', 3),
('IT', 'Technical', 'Cloud Efficiency', 'Climate Fluency', 'Optimise resource use in cloud environments', 'Supports decarbonisation and cost management.', 'Rightsizing instances, auto-scaling workloads, selecting low-carbon data centres.', 3),
('IT', 'Technical', 'Data Footprint Reduction', 'Climate Fluency', 'Minimise unnecessary data storage and processing', 'Reduces environmental impact and boosts performance.', 'Implementing data lifecycle policies, automating deletion, reporting results.', 3),
('IT', 'Knowledgeable', 'ESG Data Management', 'Data & AI', 'Collect and report sustainability metrics', 'Enables accurate reporting and transparency.', 'Building data pipelines, ensuring data quality, maintaining secure access controls.', 3),
('IT', 'Knowledgeable', 'AI Ethics Knowledge', 'Data & AI', 'Understand responsible AI practices', 'Reduces risks of bias, privacy breaches, and misuse.', 'Reviewing algorithms, training teams, embedding ethical considerations.', 3),
('IT', 'Knowledgeable', 'Cyber-ESG Risk', 'Data & AI', 'Protect ESG data from security threats', 'Maintains trust and compliance.', 'Implementing controls, auditing systems, managing incidents effectively.', 3),
('IT', 'Values', 'Digital Responsibility', 'Decarbonisation', 'Use technology ethically and sustainably', 'Builds long-term trust and resilience.', 'Selecting responsible vendors, questioning unnecessary growth, prioritising privacy.', 3),
('IT', 'Values', 'Transparency Culture', 'Decarbonisation', 'Share clear data on impacts', 'Fosters accountability and engagement.', 'Publishing dashboards, reporting progress, explaining methodologies.', 3),
('IT', 'Values', 'Privacy Respect', 'Decarbonisation', 'Protect stakeholder data rights', 'Meets legal requirements and earns user trust.', 'Anonymising data, obtaining consents, adhering to regulations.', 3),
('IT', 'Attitudes', 'Innovation Mindset', 'Risk', 'Explore creative solutions for sustainability', 'Accelerates progress and competitiveness.', 'Piloting tools, testing prototypes, scaling successes.', 3),
('IT', 'Attitudes', 'Problem Solving', 'Circular Practices', 'Tackle sustainability challenges proactively', 'Reduces delays and enhances effectiveness.', 'Investigating inefficiencies, proposing solutions, collaborating cross-functionally.', 3),
('IT', 'Attitudes', 'Adaptive Thinking', 'Circular Practices', 'Adjust strategies in response to change', 'Keeps IT responsive to evolving needs and regulations.', 'Updating roadmaps, reallocating resources, revising targets.', 3),
('Legal', 'Technical', 'ESG Contract Clauses', 'Climate Fluency', 'Draft sustainability requirements into agreements', 'Ensures commitments are enforceable and clear.', 'Including carbon targets, requiring supplier disclosures, defining audit rights.', 3),
('Legal', 'Technical', 'Greenwashing Defense', 'Climate Fluency', 'Mitigate risks of misleading claims', 'Reduces reputational and regulatory risks.', 'Reviewing campaigns, checking substantiation, advising on disclaimers.', 3),
('Legal', 'Technical', 'Circular Policy Drafting', 'Climate Fluency', 'Support circular economy laws and policies', 'Embeds sustainability into legal frameworks.', 'Developing procurement policies, updating supplier codes, advising business units.', 3),
('Legal', 'Knowledgeable', 'Environmental Regulations', 'Data & AI', 'Understand evolving ESG laws', 'Ensures proactive compliance and readiness.', 'Tracking regulations, briefing teams, updating policies.', 3),
('Legal', 'Knowledgeable', 'Climate Disclosure Rules', 'Data & AI', 'Advise on climate reporting obligations', 'Supports transparency and reduces litigation risk.', 'Reviewing reports, advising boards, ensuring consistency.', 3),
('Legal', 'Knowledgeable', 'Due Diligence Law', 'Data & AI', 'Apply ESG in M&A and partnerships', 'Avoids inheriting liabilities and protects value.', 'Conducting ESG due diligence, flagging risks, advising on warranties.', 3),
('Legal', 'Values', 'Fairness Focus', 'Decarbonisation', 'Prioritise justice in legal decisions', 'Reinforces trust with stakeholders.', 'Considering community impacts, balancing interests, advising on ethics.', 3),
('Legal', 'Values', 'Compliance Ethos', 'Decarbonisation', 'Uphold standards rigorously', 'Protects the organisation and maintains credibility.', 'Refusing shortcuts, challenging non-compliance, documenting decisions.', 3),
('Legal', 'Values', 'Justice Orientation', 'Decarbonisation', 'Promote equity and fairness', 'Builds stakeholder confidence and reduces risk of discrimination.', 'Advising on inclusive policies, reviewing language, championing access to remedies.', 3),
('Legal', 'Attitudes', 'Integrity Driven', 'Risk', 'Act with honesty and consistency', 'Protects reputation and sets the tone for the organisation.', 'Disclosing conflicts, admitting errors, advocating transparent decisions.', 3),
('Legal', 'Attitudes', 'Risk Awareness', 'Circular Practices', 'Recognise and mitigate ESG risks', 'Enables proactive responses to new threats.', 'Monitoring developments, flagging early warnings, updating risk registers.', 3),
('Legal', 'Attitudes', 'Critical Analysis', 'Circular Practices', 'Question assumptions and interpretations', 'Ensures defensible and robust outcomes.', 'Testing scenarios, consulting experts, playing devil’s advocate.', 3),
('Supply Chain', 'Technical', 'Carbon Hotspot Mapping', 'Climate Fluency', 'Identify emissions-intensive activities', 'Targets improvement efforts where they matter most.', 'Mapping emissions by tier, ranking suppliers, updating priority lists.', 3),
('Supply Chain', 'Technical', 'Low-Emission Transport', 'Climate Fluency', 'Reduce logistics emissions', 'Lowers Scope 3 emissions and costs.', 'Selecting electric fleets, optimising routes, consolidating shipments.', 3),
('Supply Chain', 'Technical', 'Circular Inventory', 'Climate Fluency', 'Manage products for reuse and recycling', 'Supports circular economy commitments and cost savings.', 'Implementing take-back programs, designing for disassembly, managing stock for reuse.', 3),
('Supply Chain', 'Knowledgeable', 'Circular Logistics', 'Data & AI', 'Understand reverse logistics principles', 'Enables effective circular supply chains.', 'Learning best practices, sharing case studies, training teams.', 3),
('Supply Chain', 'Knowledgeable', 'Scope 3 Visibility', 'Data & AI', 'Track indirect supply chain emissions', 'Supports transparency and compliance with reporting standards.', 'Using tools to collect data, verifying accuracy, preparing reports.', 3),
('Supply Chain', 'Knowledgeable', 'Climate Risk Planning', 'Data & AI', 'Anticipate disruptions from climate impacts', 'Builds resilience and protects continuity.', 'Conducting risk assessments, modelling scenarios, updating contingency plans.', 3),
('Supply Chain', 'Values', 'Responsible Sourcing', 'Decarbonisation', 'Choose ethical and sustainable suppliers', 'Improves resilience and protects brand reputation.', 'Using supplier codes, auditing compliance, rewarding leaders.', 3),
('Supply Chain', 'Values', 'Resource Stewardship', 'Decarbonisation', 'Use resources wisely', 'Reduces costs and environmental footprint.', 'Monitoring waste, optimising packaging, designing efficient processes.', 3),
('Supply Chain', 'Values', 'Fair Trade Values', 'Decarbonisation', 'Support equitable trade practices', 'Reinforces social responsibility and compliance.', 'Selecting certified suppliers, communicating expectations, monitoring labour practices.', 3),
('Supply Chain', 'Attitudes', 'Resilience Focus', 'Risk', 'Anticipate and adapt to disruptions', 'Maintains performance under pressure.', 'Reviewing contingency plans, training teams, building redundancy.', 3),
('Supply Chain', 'Attitudes', 'Partnership Mindset', 'Circular Practices', 'Collaborate to solve challenges', 'Leverages collective knowledge and influence.', 'Joining collaborations, co-developing solutions, sharing best practices.', 3),
('Supply Chain', 'Attitudes', 'Systems Thinking', 'Circular Practices', 'Understand interdependencies', 'Leads to better-informed, more strategic decisions.', 'Mapping value chain impacts, identifying leverage points, communicating across functions.', 3),
('HR', 'Technical', 'Green Workforce Planning', 'Climate Fluency', 'Align workforce to sustainability goals', 'Ensures the business has the right capabilities for the transition.', 'Workforce mapping, future skills analysis, succession planning.', 3),
('HR', 'Technical', 'Sustainable Benefits', 'Climate Fluency', 'Create benefits supporting sustainability', 'Reinforces commitment and engages employees.', 'Subsidising public transport, offering green pensions, creating wellbeing programs.', 3),
('HR', 'Technical', 'Net Zero Onboarding', 'Climate Fluency', 'Embed sustainability in induction programs', 'Builds early engagement and alignment.', 'Including ESG modules, assigning champions, sharing resources.', 3),
('HR', 'Knowledgeable', 'ESG Training Knowledge', 'Data & AI', 'Know core sustainability concepts', 'Equips HR to design effective learning and culture programs.', 'Developing training materials, advising managers, measuring progress.', 3),
('HR', 'Knowledgeable', 'Climate Policy Awareness', 'Data & AI', 'Understand sustainability regulations affecting HR', 'Avoids compliance risks and supports proactive action.', 'Reviewing regulations, briefing leaders, updating policies.', 3),
('HR', 'Knowledgeable', 'Diversity Integration', 'Data & AI', 'Connect inclusion with sustainability', 'Strengthens culture and social impact.', 'Linking DEI and sustainability metrics, developing inclusive practices.', 3),
('HR', 'Values', 'Inclusion Commitment', 'Decarbonisation', 'Prioritise fairness and belonging', 'Drives engagement and retention.', 'Addressing bias, celebrating diversity, promoting psychological safety.', 3),
('HR', 'Values', 'Purpose Driven', 'Decarbonisation', 'Connect work to a bigger mission', 'Enhances motivation and performance.', 'Sharing success stories, aligning goals to purpose, recognising contributions.', 3),
('HR', 'Values', 'Wellbeing Focus', 'Decarbonisation', 'Prioritise health and balance', 'Builds resilience and attracts talent.', 'Offering flexible working, mental health support, health promotion programs.', 3),
('HR', 'Attitudes', 'Culture Building', 'Risk', 'Foster shared values and practices', 'Embeds long-term behavioural change.', 'Running engagement programs, championing recognition, reinforcing rituals.', 3),
('HR', 'Attitudes', 'Empathy Orientation', 'Circular Practices', 'Understand diverse perspectives', 'Increases inclusion and quality of solutions.', 'Conducting listening exercises, adapting policies, modelling understanding.', 3),
('HR', 'Attitudes', 'Open Communication', 'Circular Practices', 'Share information transparently', 'Builds trust and credibility.', 'Regular updates, clear expectations, two-way feedback channels.', 3),
('CxO / Executive', 'Technical', 'ESG Strategy Design', 'Climate Fluency', 'Develop sustainability-aligned strategy', 'Sets the direction and inspires action.', 'Leading strategy workshops, aligning goals to purpose, approving investments.', 3),
('CxO / Executive', 'Technical', 'Decarbonisation Roadmapping', 'Climate Fluency', 'Plan pathways to net zero', 'Drives accountability and progress.', 'Setting targets, allocating resources, reviewing progress.', 3),
('CxO / Executive', 'Technical', 'Sustainable Investment', 'Climate Fluency', 'Fund transformative projects', 'Speeds innovation and demonstrates leadership.', 'Approving green investments, reallocating budgets, supporting pilots.', 3),
('CxO / Executive', 'Knowledgeable', 'Climate Governance', 'Data & AI', 'Oversee ESG governance structures', 'Builds trust with stakeholders and ensures compliance.', 'Reviewing dashboards, approving policies, engaging with stakeholders.', 3),
('CxO / Executive', 'Knowledgeable', 'Regulatory Mastery', 'Data & AI', 'Understand evolving ESG regulations', 'Reduces risk and improves readiness.', 'Regular briefings, scenario planning, engaging with policymakers.', 3),
('CxO / Executive', 'Knowledgeable', 'TCFD Familiarity', 'Data & AI', 'Lead climate disclosure processes', 'Enhances transparency and reputation.', 'Reviewing reports, ensuring alignment to best practice, briefing investors.', 3),
('CxO / Executive', 'Values', 'Visionary Leadership', 'Decarbonisation', 'Inspire ambition and purpose', 'Creates momentum and clarity.', 'Publicly committing to targets, role-modelling behaviours, storytelling.', 3),
('CxO / Executive', 'Values', 'Stewardship Values', 'Decarbonisation', 'Protect resources for future generations', 'Demonstrates authenticity and responsibility.', 'Approving long-term investments, challenging short-termism, mentoring leaders.', 3),
('CxO / Executive', 'Values', 'Systemic Responsibility', 'Decarbonisation', 'Take accountability for the whole system', 'Creates broader positive impact and resilience.', 'Advocating for collaboration, addressing supply chain risks, engaging in partnerships.', 3),
('CxO / Executive', 'Attitudes', 'Bold Commitment', 'Risk', 'Take decisive action with confidence', 'Accelerates progress and inspires confidence.', 'Setting stretch goals, investing ahead of regulation, championing innovation.', 3),
('CxO / Executive', 'Attitudes', 'Accountability Driven', 'Circular Practices', 'Own progress and outcomes', 'Builds credibility and drives performance.', 'Regular reporting, transparent updates, course correcting when needed.', 3),
('CxO / Executive', 'Attitudes', 'Adaptive Mindset', 'Circular Practices', 'Pivot strategies as needed', 'Maintains relevance and resilience.', 'Reviewing progress, updating priorities, reallocating resources.', 3),
('Operations', 'Technical', 'Energy Efficiency', 'Climate Fluency', 'Reduce energy use in operations', 'Cuts costs and supports decarbonisation commitments.', 'Upgrading equipment, optimising schedules, tracking energy performance.', 3),
('Operations', 'Technical', 'Circular Process Design', 'Climate Fluency', 'Design for reuse and recycling', 'Reduces resource use and aligns with circular economy strategies.', 'Setting up closed-loop systems, redesigning packaging, specifying recyclable materials.', 3),
('Operations', 'Technical', 'Waste Reduction', 'Climate Fluency', 'Minimise operational waste', 'Reduces environmental impacts and regulatory risks.', 'Conducting waste audits, implementing reduction plans, measuring progress.', 3),
('Operations', 'Knowledgeable', 'Process Footprinting', 'Data & AI', 'Understand environmental impacts of operations', 'Informs decisions to prioritise improvements.', 'Creating impact maps, benchmarking performance, sharing insights.', 3),
('Operations', 'Knowledgeable', 'Emissions Tracking', 'Data & AI', 'Monitor carbon output from activities', 'Ensures accurate reporting and supports progress monitoring.', 'Installing meters, maintaining records, integrating data into reporting.', 3),
('Operations', 'Knowledgeable', 'ESG Compliance', 'Data & AI', 'Adhere to sustainability regulations', 'Avoids legal risks and builds credibility.', 'Reviewing requirements, updating procedures, training staff.', 3),
('Operations', 'Values', 'Operational Integrity', 'Decarbonisation', 'Uphold sustainability commitments', 'Builds trust internally and externally.', 'Meeting targets, disclosing progress, flagging issues promptly.', 3),
('Operations', 'Values', 'Resource Responsibility', 'Decarbonisation', 'Use materials and energy efficiently', 'Reduces costs and environmental impacts.', 'Reducing scrap rates, optimising processes, training teams.', 3),
('Operations', 'Values', 'Transparency Ethos', 'Decarbonisation', 'Share clear information on performance', 'Builds credibility with stakeholders.', 'Publishing dashboards, sharing lessons learned, updating teams.', 3),
('Operations', 'Attitudes', 'Improvement Focus', 'Risk', 'Seek out better ways to work', 'Drives ongoing progress and innovation.', 'Suggesting new ideas, testing pilots, celebrating improvements.', 3),
('Operations', 'Attitudes', 'Ownership Culture', 'Circular Practices', 'Take responsibility for results', 'Increases engagement and delivery of targets.', 'Setting clear expectations, recognising success, addressing gaps quickly.', 3),
('Operations', 'Attitudes', 'Results Orientation', 'Circular Practices', 'Focus on measurable progress', 'Delivers credibility and progress.', 'Defining KPIs, tracking impact rigorously, reporting transparently.', 3),
('R&D', 'Technical', 'Sustainable Design', 'Climate Fluency', 'Develop products with low impacts', 'Drives innovation and aligns with sustainability goals.', 'Using eco-design tools, specifying low-impact materials, testing prototypes.', 3),
('R&D', 'Technical', 'Low-Carbon Prototyping', 'Climate Fluency', 'Test sustainable solutions early', 'Enables rapid learning and reduces risks.', 'Selecting clean technologies, measuring impacts, iterating designs.', 3),
('R&D', 'Technical', 'Lifecycle Impact', 'Climate Fluency', 'Assess cradle-to-grave impacts', 'Informs better decisions and supports credible claims.', 'Completing LCAs, sharing data with stakeholders, integrating findings.', 3),
('R&D', 'Knowledgeable', 'Circular Innovation', 'Data & AI', 'Create circular products and models', 'Supports transition to circular economy.', 'Developing take-back schemes, designing modular products, using recycled content.', 3),
('R&D', 'Knowledgeable', 'Eco-Material Knowledge', 'Data & AI', 'Understand low-impact material options', 'Enables informed material selection and innovation.', 'Researching suppliers, testing materials, documenting performance.', 3),
('R&D', 'Knowledgeable', 'Climate Solutions', 'Data & AI', 'Develop technologies for decarbonisation', 'Positions the organisation as a leader in sustainability.', 'Prototyping clean tech, scaling solutions, measuring benefits.', 3),
('R&D', 'Values', 'Regenerative Thinking', 'Decarbonisation', 'Design to restore ecosystems', 'Builds resilience and leadership.', 'Developing regenerative products, testing closed-loop models, collaborating with partners.', 3),
('R&D', 'Values', 'Future Orientation', 'Decarbonisation', 'Innovate with long-term impacts in mind', 'Avoids short-termism and builds credibility.', 'Incorporating scenarios, engaging stakeholders, reviewing legacy impacts.', 3),
('R&D', 'Values', 'Impact Awareness', 'Decarbonisation', 'Understand consequences of decisions', 'Builds transparency and trust.', 'Documenting impacts, disclosing limitations, updating designs.', 3),
('R&D', 'Attitudes', 'Curiosity Driven', 'Risk', 'Explore new ideas actively', 'Drives innovation and adaptability.', 'Piloting new approaches, asking questions, sharing insights.', 3),
('R&D', 'Attitudes', 'Challenge Acceptance', 'Circular Practices', 'Tackle tough sustainability problems', 'Enables breakthroughs and resilience.', 'Leading pilots, iterating under uncertainty, engaging cross-functional teams.', 3),
('R&D', 'Attitudes', 'Experimentation Focus', 'Circular Practices', 'Test, learn, and improve continuously', 'Speeds progress and reduces risks.', 'Running experiments, sharing learnings, pivoting when needed.', 3)
ON CONFLICT (department, skill_family, green_skill) DO NOTHING;

-- ======================== ASSESSMENT TABLES ========================
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

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('R&D', 'Climate Fluency', 1, 'How well do you understand the climate impact of products and services developed by R&D?', 'Deep understanding across lifecycle stages; I apply GHG Protocol Product Standard and lifecycle assessment tools like SimaPro or GaBi in my work.', 'Good understanding of main impact areas (e.g., energy intensity, material sourcing) but limited in detailed quantification.', 'Limited awareness of environmental impacts beyond general concepts.', 'No awareness of climate impacts related to R&D.', '• Sustainable Design\n• Low-Carbon Prototyping\n• Lifecycle Impact') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('R&D', 'Climate Fluency', 2, 'How confident are you integrating climate considerations into innovation processes?', 'Very confident; I consistently embed carbon footprint reduction, climate adaptation features, and circularity into design briefs and development sprints.', 'Somewhat confident; I include sustainability criteria in some projects.', 'Limited confidence; I need guidance from sustainability specialists.', 'Not confident; I have not included climate considerations in innovation.', '• Sustainable Design\n• Low-Carbon Prototyping\n• Lifecycle Impact') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('R&D', 'Climate Fluency', 3, 'How familiar are you with science-based design frameworks (e.g., cradle-to-cradle, PAS 2050)?', 'Very familiar; I reference these frameworks to validate product sustainability claims and inform material choices.', 'Some familiarity; I have reviewed these standards but don’t apply them routinely.', 'Limited awareness; I’ve heard of them but never used them.', 'No awareness of these frameworks.', '• Sustainable Design\n• Low-Carbon Prototyping\n• Lifecycle Impact') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('R&D', 'Climate Fluency', 4, 'How often do you engage teams on sustainable innovation and climate literacy?', 'Regularly; I lead workshops and embed sustainability goals into project charters and KPIs.', 'Occasionally; I share resources and updates when relevant.', 'Rarely; only when requested.', 'Never discussed sustainability with teams.', '• Sustainable Design\n• Low-Carbon Prototyping\n• Lifecycle Impact') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('R&D', 'Climate Fluency', 5, 'How proactive are you in identifying opportunities to design low-carbon solutions?', 'Very proactive; I actively scan emerging technologies and materials aligned with SBTi pathways and regenerative design principles.', 'Somewhat proactive; I explore options when prompted by clients or leadership.', 'Occasionally; I consider alternatives in select projects.', 'Not proactive; I rely on others to suggest improvements.', '• Sustainable Design\n• Low-Carbon Prototyping\n• Lifecycle Impact') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('R&D', 'Data & AI', 6, 'How advanced are your tools to assess environmental impacts of innovation?', 'Fully integrated digital tools (e.g., lifecycle assessment software, real-time emissions dashboards) are part of standard workflows.', 'Partially integrated; tools are available but not consistently used.', 'Basic tools with limited data coverage.', 'No tools or systems to assess impacts.', '• Circular Innovation\n• Eco-Material Knowledge\n• Climate Solutions') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('R&D', 'Data & AI', 7, 'How confident are you using ESG data to guide innovation decisions?', 'Very confident; ESG metrics directly influence design choices, go/no-go decisions, and R&D investment.', 'Somewhat confident; I consider data in evaluations.', 'Limited confidence; I refer to data occasionally.', 'Not confident; I don’t use ESG data.', '• Circular Innovation\n• Eco-Material Knowledge\n• Climate Solutions') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('R&D', 'Data & AI', 8, 'Do you use AI to model sustainability outcomes or optimize design?', 'Yes; AI tools (e.g., predictive modeling for energy efficiency, material selection algorithms) are routinely applied.', 'Sometimes; AI used for select analyses or pilots.', 'Rarely; AI considered but not widely adopted.', 'Never used AI for sustainability modeling.', '• Circular Innovation\n• Eco-Material Knowledge\n• Climate Solutions') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('R&D', 'Data & AI', 9, 'How often do you validate sustainability data accuracy for R&D?', 'Regularly audited by third parties or internal specialists to ensure data credibility.', 'Occasionally validated; checks are informal.', 'Rarely validated; data is assumed accurate.', 'Never validated sustainability data.', '• Circular Innovation\n• Eco-Material Knowledge\n• Climate Solutions') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('R&D', 'Data & AI', 10, 'How familiar are you with digital lifecycle assessment tools?', 'Very familiar; tools like OpenLCA or EcoInvent are standard in my workflow.', 'Some familiarity; used in a few projects.', 'Limited awareness of tools.', 'No awareness.', '• Circular Innovation\n• Eco-Material Knowledge\n• Climate Solutions') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('R&D', 'Decarbonisation', 11, 'How aligned is R&D strategy with decarbonisation targets (e.g., SBTi commitments)?', 'Fully aligned; product roadmaps and KPIs are structured to achieve Science-Based Targets and decarbonisation milestones.', 'Partially aligned; decarbonisation goals are referenced but not fully operationalized in R&D.', 'Limited alignment; considered in a few isolated projects.', 'Not aligned; no link between decarbonisation targets and R&D priorities.', '• Regenerative Thinking\n• Future Orientation\n• Impact Awareness') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('R&D', 'Decarbonisation', 12, 'How confident are you designing low-carbon products and services?', 'Very confident; I lead development using tools like lifecycle carbon footprinting (PAS 2050), low-carbon material sourcing, and energy optimization analysis.', 'Somewhat confident; I include low-carbon considerations in select projects.', 'Limited confidence; I rely heavily on external expertise.', 'Not confident; I have no experience designing low-carbon products.', '• Regenerative Thinking\n• Future Orientation\n• Impact Awareness') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('R&D', 'Decarbonisation', 13, 'Do you set clear emissions reduction targets within innovation projects?', 'Always; targets are embedded in project charters, tracked during development, and verified post-launch.', 'Often; targets set for priority projects but not all.', 'Occasionally; targets are informal or loosely defined.', 'Never set emissions reduction targets in R&D.', '• Regenerative Thinking\n• Future Orientation\n• Impact Awareness') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('R&D', 'Decarbonisation', 14, 'How familiar are you with renewable materials and energy-efficient design methods?', 'Very familiar; I specify renewable feedstocks, low-carbon polymers, and efficient manufacturing techniques (e.g., additive manufacturing to reduce waste).', 'Some familiarity; I have used renewable or efficient options in some projects.', 'Limited awareness; I know basic concepts but lack experience applying them.', 'No awareness of these approaches.', '• Regenerative Thinking\n• Future Orientation\n• Impact Awareness') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('R&D', 'Decarbonisation', 15, 'How proactive are you in identifying decarbonisation opportunities in innovation pipelines?', 'Very proactive; I initiate carbon hotspot analyses, engage suppliers on decarbonisation roadmaps, and champion pilots for low-carbon technologies.', 'Somewhat proactive; I respond to opportunities when identified by others.', 'Occasionally proactive; I consider improvements in select cases.', 'Not proactive; I wait for direction from sustainability teams.', '• Regenerative Thinking\n• Future Orientation\n• Impact Awareness') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('R&D', 'Risk', 16, 'How aware are you of climate-related risks affecting product development (e.g., resource scarcity, regulatory bans)?', 'Very aware; I assess supply chain and regulatory risks using tools like lifecycle-based risk mapping and horizon scanning reports.', 'Somewhat aware; I monitor risks during project planning but rely on others for detailed analysis.', 'Limited awareness; I only consider risks when issues arise.', 'No awareness of climate-related risks in development.', '• Curiosity Driven') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('R&D', 'Risk', 17, 'How confident are you addressing compliance risks for sustainability claims (e.g., greenwashing)?', 'Very confident; I review claims against ISO 14021, EU Green Claims Directive, and consult legal teams before publication.', 'Somewhat confident; I use templates and guidelines but sometimes need extra guidance.', 'Limited confidence; I often defer to compliance colleagues.', 'Not confident; I have not worked on claims compliance.', '• Curiosity Driven') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('R&D', 'Risk', 18, 'How integrated are ESG risks in your innovation risk assessments and project reviews?', 'Fully integrated; ESG and climate risks are part of all stage-gate reviews, project charters, and risk registers.', 'Partially integrated; included in priority projects but not consistently tracked.', 'Limited integration; added on an ad hoc basis.', 'Not integrated; ESG risks are not considered.', '• Curiosity Driven') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('R&D', 'Risk', 19, 'How prepared are you for ESG regulations affecting product development (e.g., EU Ecodesign, Extended Producer Responsibility)?', 'Fully prepared; we have documented plans and product pipelines aligned to comply with emerging regulations.', 'Somewhat prepared; plans are in development but not finalized.', 'Limited preparation; awareness exists but no action yet.', 'Not prepared; no plans in place.', '• Curiosity Driven') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('R&D', 'Risk', 20, 'How often do you assess potential liabilities related to sustainability in innovation projects?', 'Regularly; I conduct risk assessments in partnership with legal and compliance teams during early design stages.', 'Occasionally; I participate in assessments when required.', 'Rarely; liabilities are assessed late or reactively.', 'Never; liabilities are not considered in R&D.', '• Curiosity Driven') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('R&D', 'Circular Practices', 21, 'How familiar are you with circular design principles (e.g., modularity, design for disassembly, cradle-to-cradle certification)?', 'Very familiar; I embed these principles in product design and validate them through recognized certifications (e.g., Cradle to Cradle Certified).', 'Some familiarity; I use guidelines occasionally but not systematically.', 'Limited awareness; I have read about these concepts but don’t apply them.', 'No awareness of circular design principles.', '• Challenge Acceptance\n• Experimentation Focus') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('R&D', 'Circular Practices', 22, 'Do you prioritize circular economy approaches (e.g., reuse, refurbishment) in product development?', 'Always; circularity is embedded in design briefs, material selection, and supplier requirements.', 'Often; considered in major projects and tenders.', 'Occasionally; applied in isolated cases.', 'Never considered in development.', '• Challenge Acceptance\n• Experimentation Focus') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('R&D', 'Circular Practices', 23, 'How confident are you embedding circularity into design and innovation processes?', 'Very confident; I have led projects incorporating recycled materials, closed-loop models, and product take-back schemes.', 'Somewhat confident; I have contributed to circular initiatives but not led them.', 'Limited confidence; I rely on experts for guidance.', 'Not confident; I have not worked on circular innovation.', '• Challenge Acceptance\n• Experimentation Focus') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('R&D', 'Circular Practices', 24, 'How often do you measure and report on circularity performance (e.g., % recycled content, reuse potential)?', 'Always; circularity metrics are tracked as standard KPIs and included in reports.', 'Occasionally; metrics are collected for key launches.', 'Rarely; metrics are ad hoc.', 'Never measured or reported.', '• Challenge Acceptance\n• Experimentation Focus') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('R&D', 'Circular Practices', 25, 'Do you collaborate with supply chain and partners to advance circular innovation?', 'Regularly; I co-develop circular solutions with suppliers, recyclers, and R&D partners.', 'Occasionally; I engage stakeholders in select projects.', 'Rarely; collaboration is informal or limited.', 'Never; I do not engage on circular initiatives.', '• Challenge Acceptance\n• Experimentation Focus') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Marketing', 'Climate Fluency', 1, 'How well do you understand the environmental impact of marketing activities (e.g., digital advertising, print media, events)?', 'Deep understanding; I quantify impacts using tools like AdGreen and apply carbon budgets to all campaigns.', 'Good understanding; I consider impacts for major campaigns but don''t quantify them consistently.', 'Basic awareness; I recognise marketing has environmental impacts but haven''t assessed them in detail.', 'Limited awareness; I haven''t considered the environmental footprint of marketing activities.', '• Green Storytelling\n• Anti-Greenwashing\n• Sustainable Campaigns') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Marketing', 'Climate Fluency', 2, 'How confident are you communicating your organisation''s sustainability story without overstating claims?', 'Very confident; I follow CMA Green Claims Code and substantiate every claim with verified data.', 'Fairly confident; I review claims for accuracy but don''t always reference formal standards.', 'Somewhat confident; I try to be honest but sometimes lack the data to back up claims.', 'Not confident; I''m unsure how to communicate sustainability without risking greenwashing.', '• Green Storytelling\n• Anti-Greenwashing\n• Sustainable Campaigns') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Marketing', 'Climate Fluency', 3, 'How familiar are you with sustainability frameworks relevant to marketing (e.g., CMA Green Claims Code, EU Green Claims Directive)?', 'Very familiar; I apply these frameworks to campaign sign-off processes and train team members on them.', 'Familiar; I''ve read the key guidelines and reference them for major campaigns.', 'Somewhat familiar; I''ve heard of them but haven''t applied them directly.', 'Not familiar; I''m not aware of specific sustainability marketing frameworks.', '• Green Storytelling\n• Anti-Greenwashing\n• Sustainable Campaigns') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Marketing', 'Climate Fluency', 4, 'How often do you engage your team on the connection between marketing decisions and climate outcomes?', 'Regularly; I lead briefings on sustainable marketing and embed climate literacy into team development.', 'Sometimes; I raise sustainability in team meetings but don''t have a structured approach.', 'Rarely; I mention it occasionally but it''s not part of regular team discussions.', 'Never; sustainability isn''t part of our team conversations.', '• Green Storytelling\n• Anti-Greenwashing\n• Sustainable Campaigns') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Marketing', 'Climate Fluency', 5, 'How proactive are you in identifying opportunities to reduce the environmental footprint of campaigns and channels?', 'Very proactive; I actively seek low-carbon alternatives for media buying, production, and distribution.', 'Fairly proactive; I consider greener options when they''re available but don''t always seek them out.', 'Somewhat; I''d choose a greener option if presented but don''t actively look for them.', 'Not proactive; environmental footprint isn''t a factor in my campaign planning.', '• Green Storytelling\n• Anti-Greenwashing\n• Sustainable Campaigns') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Marketing', 'Data & AI', 6, 'How integrated is ESG data in your marketing analytics and performance dashboards?', 'Fully integrated; I use real-time dashboards combining engagement metrics, lifecycle emissions (Scope3.io), and circularity KPIs.', 'Partially integrated; ESG data is tracked in separate reports.', 'Limited integration; only basic ESG data included occasionally.', 'Not integrated; no ESG metrics tracked.', '• Sustainability Storytelling\n• Behavioural Insights\n• Circular Promotion') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Marketing', 'Data & AI', 7, 'How confident are you using data to measure sustainability performance of campaigns?', 'Very confident; I regularly use carbon calculators, WFA Planet Pledge templates, and third-party verification tools to inform decisions.', 'Somewhat confident; I interpret data with occasional support.', 'Limited confidence; I rarely use ESG data in planning.', 'Not confident; I don’t measure sustainability performance.', '• Sustainability Storytelling\n• Behavioural Insights\n• Circular Promotion') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Marketing', 'Data & AI', 8, 'How familiar are you with AI tools to optimize low-carbon marketing (e.g., dynamic targeting, resource allocation)?', 'Very familiar; I apply AI tools to reduce media wastage, optimize delivery emissions, and track impact.', 'Some familiarity; I have explored pilots but haven’t scaled them.', 'Limited awareness; I know basic concepts.', 'No awareness of AI applications in this area.', '• Sustainability Storytelling\n• Behavioural Insights\n• Circular Promotion') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Marketing', 'Data & AI', 9, 'How often do you validate the accuracy of ESG data for campaigns and reporting?', 'Always; I ensure data is verified by internal audit or independent assurance providers.', 'Often; validated for major campaigns only.', 'Occasionally; spot-checked without formal process.', 'Never; no validation conducted.', '• Sustainability Storytelling\n• Behavioural Insights\n• Circular Promotion') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Marketing', 'Data & AI', 10, 'Do you collaborate with analytics and data teams to improve ESG data quality in marketing?', 'Regularly; I co-develop metrics, dashboards, and methodologies for campaign reporting.', 'Occasionally collaborate to align definitions and tools.', 'Rarely collaborate; minimal coordination.', 'Never collaborate.', '• Sustainability Storytelling\n• Behavioural Insights\n• Circular Promotion') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Marketing', 'Decarbonisation', 11, 'How often do you consider and measure the carbon footprint of campaigns and channels?', 'Always; I use tools like AdGreen Carbon Calculator and Scope3.io to quantify emissions in every project.', 'Often; I measure emissions for key campaigns but not systematically.', 'Occasionally; estimates are made without verification.', 'Never considered or measured.', '• Authentic Messaging\n• Honesty in Claims\n• Social Responsibility') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Marketing', 'Decarbonisation', 12, 'How familiar are you with low-carbon event and campaign design practices (e.g., ISO 20121, hybrid events)?', 'Very familiar; I apply ISO 20121 standards and track emissions reductions for each event.', 'Some familiarity; I have used sustainable design guidelines occasionally.', 'Limited awareness; I know some concepts.', 'No awareness.', '• Authentic Messaging\n• Honesty in Claims\n• Social Responsibility') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Marketing', 'Decarbonisation', 13, 'Do you set specific, quantified emissions reduction targets for marketing activities?', 'Always; annual emissions reduction targets are documented and aligned with Ad Net Zero commitments.', 'Often; informal targets set for priority projects.', 'Occasionally; general aspirations stated but no tracking.', 'Never set targets.', '• Authentic Messaging\n• Honesty in Claims\n• Social Responsibility') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Marketing', 'Decarbonisation', 14, 'How confident are you leading low-carbon initiatives (e.g., sustainable media buying, supplier engagement)?', 'Very confident; I lead initiatives to decarbonise media plans, work with suppliers, and embed targets in contracts.', 'Somewhat confident; I contribute to projects led by others.', 'Limited confidence; I rely on sustainability colleagues.', 'Not confident.', '• Authentic Messaging\n• Honesty in Claims\n• Social Responsibility') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Marketing', 'Decarbonisation', 15, 'How often do you measure lifecycle emissions of marketing materials (print, digital, OOH)?', 'Always; cradle-to-grave emissions quantified and reported for all campaigns.', 'Sometimes; measured for major campaigns only.', 'Rarely; estimates used without validation.', 'Never measured or reported.', '• Authentic Messaging\n• Honesty in Claims\n• Social Responsibility') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Marketing', 'Risk', 16, 'How aware are you of reputational risks from inaccurate sustainability claims and greenwashing?', 'Very aware; I conduct detailed reviews of all claims against the CMA Green Claims Code, ISO 14021, and EU Green Claims Directive, and flag risks in campaign plans.', 'Somewhat aware; I consider reputational risks in campaign approvals but rely on compliance colleagues for detailed checks.', 'Limited awareness; I only think about risks when prompted by others.', 'No awareness; I have not assessed these risks.', '• Customer Centricity') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Marketing', 'Risk', 17, 'How confident are you managing compliance with sustainability marketing regulations?', 'Very confident; I lead compliance processes, apply the CMA and ISO standards, and ensure all campaigns are legally reviewed before launch.', 'Somewhat confident; I follow guidelines and templates but occasionally need advice.', 'Limited confidence; I defer most decisions to legal teams.', 'Not confident; I do not manage compliance.', '• Customer Centricity') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Marketing', 'Risk', 18, 'How integrated are ESG risks in your marketing risk assessments and approvals?', 'Fully integrated; ESG risks are documented in risk registers, evaluated during pre-launch reviews, and included in mitigation plans.', 'Partially integrated; ESG risks are considered for high-profile or regulated campaigns.', 'Limited integration; ESG risks are addressed on an ad hoc basis.', 'Not integrated; ESG risks are not part of risk assessments.', '• Customer Centricity') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Marketing', 'Risk', 19, 'How prepared are you for upcoming regulations affecting sustainability communications (e.g., Digital Services Act, EU Green Claims Directive)?', 'Fully prepared; we have documented policies, scenario plans, and training for upcoming regulations.', 'Somewhat prepared; draft plans and guidance are under development.', 'Limited preparation; we are aware of changes but have no plans in place.', 'Not prepared; no action taken.', '• Customer Centricity') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Marketing', 'Risk', 20, 'How often do you review compliance and accuracy of sustainability claims?', 'Every campaign undergoes a documented compliance review with legal and marketing sign-off, using checklists aligned to the CMA Green Claims Code.', 'Often reviewed for campaigns over a certain budget or impact threshold.', 'Occasionally reviewed; no consistent process.', 'Never reviewed or documented.', '• Customer Centricity') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Marketing', 'Circular Practices', 21, 'How familiar are you with circular approaches in marketing (e.g., reusable displays, recycled materials, modular signage)?', 'Very familiar; I embed circular design principles from Ellen MacArthur Foundation and ISO 14021 into all campaigns.', 'Some familiarity; I consider circularity for priority projects but not consistently.', 'Limited awareness; I know general concepts but lack detail.', 'No awareness of circular approaches.', '• Openness to Feedback\n• Learning Orientation') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Marketing', 'Circular Practices', 22, 'Do you prioritize low-impact and circular materials in campaign production and procurement?', 'Always; specifications require use of recycled content, modular assets, and materials with certified end-of-life recovery.', 'Often; we request sustainable options but accept conventional if needed.', 'Occasionally considered; depends on project requirements.', 'Never considered or requested.', '• Openness to Feedback\n• Learning Orientation') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Marketing', 'Circular Practices', 23, 'How confident are you communicating circular economy benefits to customers and stakeholders?', 'Very confident; I develop messaging in compliance with ISO 14021 and use verified claims (e.g., % recycled content, recyclability).', 'Somewhat confident; I include claims when supported by suppliers.', 'Limited confidence; I need help to frame claims accurately.', 'Not confident; I avoid discussing circular benefits.', '• Openness to Feedback\n• Learning Orientation') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Marketing', 'Circular Practices', 24, 'How often do you measure and report the circularity performance of marketing initiatives (e.g., reuse rates, recycling outcomes)?', 'Always; metrics like % reusable materials and post-campaign recovery rates are tracked and reported in ESG disclosures.', 'Sometimes measured for high-profile or large-scale campaigns.', 'Rarely; informal estimates shared when requested.', 'Never measured or reported.', '• Openness to Feedback\n• Learning Orientation') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Marketing', 'Circular Practices', 25, 'Do you collaborate with suppliers and production partners to advance circular solutions in marketing?', 'Regularly; I co-create pilots, set targets for recycled content, and review supplier progress quarterly.', 'Occasionally; I engage suppliers on specific projects.', 'Rarely; ad hoc discussions only.', 'Never; I do not engage suppliers on circular topics.', '• Openness to Feedback\n• Learning Orientation') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('IT', 'Climate Fluency', 1, 'How well do you understand the environmental impact of IT operations (e.g., data centers, device lifecycle)?', 'Deep understanding; I apply GHG Protocol ICT sector guidance, measure emissions across data centers, networks, and end-user devices, and track Scope 2 and Scope 3 impacts.', 'Good understanding of primary impact areas (energy, e-waste) but limited experience quantifying them comprehensively.', 'Limited awareness; I know energy use is significant but lack lifecycle knowledge.', 'No awareness of environmental impacts related to IT.', '• Green Software Design\n• Cloud Efficiency\n• Data Footprint Reduction') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('IT', 'Climate Fluency', 2, 'How confident are you explaining IT’s role in the organization’s decarbonisation strategy?', 'Very confident; I regularly brief leadership on IT’s contributions to SBTi targets, cloud decarbonisation, and renewable procurement.', 'Somewhat confident; I can explain main points but need help with technical detail.', 'Limited confidence; I only discuss when asked.', 'Not confident.', '• Green Software Design\n• Cloud Efficiency\n• Data Footprint Reduction') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('IT', 'Climate Fluency', 3, 'How often do you engage your team on digital sustainability topics (e.g., green cloud, energy-efficient coding)?', 'Regularly; sustainability KPIs, training, and objectives are built into team goals.', 'Occasionally; we discuss in team meetings or projects.', 'Rarely; only when prompted by external teams.', 'Never discussed sustainability topics.', '• Green Software Design\n• Cloud Efficiency\n• Data Footprint Reduction') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('IT', 'Climate Fluency', 4, 'How familiar are you with standards like ISO 50001 (energy), BREEAM (data centers), and Energy Star (hardware)?', 'Very familiar; I use these standards in design, procurement, and reporting decisions.', 'Some familiarity; I reference standards but don’t apply them consistently.', 'Limited awareness; I’ve heard of them but never used them.', 'No awareness.', '• Green Software Design\n• Cloud Efficiency\n• Data Footprint Reduction') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('IT', 'Climate Fluency', 5, 'Do you consider climate impacts when planning IT investments (e.g., hardware refresh, cloud migration)?', 'Always; lifecycle carbon impacts, energy efficiency, and end-of-life considerations are factored into business cases.', 'Often considered in major procurements.', 'Occasionally considered informally.', 'Never considered.', '• Green Software Design\n• Cloud Efficiency\n• Data Footprint Reduction') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('IT', 'Data & AI', 6, 'How advanced are your systems to track emissions and energy use in IT operations?', 'Fully integrated; real-time monitoring with tools like DCIM software, ISO 50001-compliant reporting, and Scope 2/3 dashboards.', 'Partially integrated; some manual tracking and separate spreadsheets.', 'Basic tracking; limited or estimated data.', 'No tracking systems.', '• ESG Data Management\n• AI Ethics Knowledge\n• Cyber-ESG Risk') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('IT', 'Data & AI', 7, 'How confident are you using ESG data to guide IT decisions (e.g., vendor selection, infrastructure optimization)?', 'Very confident; I integrate ESG data into procurement scoring, asset management, and cloud strategies.', 'Somewhat confident; I use ESG criteria in some decisions.', 'Limited confidence; I rely on sustainability teams.', 'Not confident.', '• ESG Data Management\n• AI Ethics Knowledge\n• Cyber-ESG Risk') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('IT', 'Data & AI', 8, 'How familiar are you with AI tools for optimizing energy and emissions (e.g., workload scheduling, predictive cooling)?', 'Very familiar; I lead projects implementing AI-based optimization (e.g., carbon-aware scheduling, dynamic cooling).', 'Some familiarity; I have piloted tools in specific contexts.', 'Limited awareness; I have read about options.', 'No awareness.', '• ESG Data Management\n• AI Ethics Knowledge\n• Cyber-ESG Risk') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('IT', 'Data & AI', 9, 'How often do you validate ESG data accuracy for IT reporting?', 'Regularly; internal audits and third-party assurance validate data before disclosure.', 'Occasionally; validations conducted for large reports.', 'Rarely; data assumed accurate.', 'Never validated ESG data.', '• ESG Data Management\n• AI Ethics Knowledge\n• Cyber-ESG Risk') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('IT', 'Data & AI', 10, 'Do you collaborate with data, finance, and sustainability teams to improve ESG metrics for IT?', 'Regularly; I co-create metrics, dashboards, and data pipelines.', 'Occasionally collaborate on shared reports.', 'Rarely collaborate.', 'Never collaborate.', '• ESG Data Management\n• AI Ethics Knowledge\n• Cyber-ESG Risk') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('IT', 'Decarbonisation', 11, 'How aligned is IT strategy with decarbonisation targets (e.g., renewable energy, Scope 2 and Scope 3 reduction)?', 'Fully aligned; roadmaps include renewable energy procurement, green software design, and carbon-neutral cloud strategies.', 'Partially aligned; initiatives cover priority areas but lack full scope.', 'Limited alignment; efforts are reactive and project-based.', 'Not aligned.', '• Digital Responsibility\n• Transparency Culture\n• Privacy Respect') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('IT', 'Decarbonisation', 12, 'How confident are you implementing low-carbon IT practices (e.g., efficient coding, green hosting)?', 'Very confident; I lead initiatives including energy-efficient architecture reviews, cloud decarbonisation, and hardware reuse programs.', 'Somewhat confident; I contribute to decarbonisation efforts but don’t lead them.', 'Limited confidence; I defer to sustainability teams.', 'Not confident.', '• Digital Responsibility\n• Transparency Culture\n• Privacy Respect') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('IT', 'Decarbonisation', 13, 'Do you set quantified emissions reduction targets for IT operations?', 'Always; annual targets aligned to SBTi tracked via ISO 14064 frameworks.', 'Often; targets set for data centers or cloud contracts.', 'Occasionally; informal goals only.', 'Never set targets.', '• Digital Responsibility\n• Transparency Culture\n• Privacy Respect') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('IT', 'Decarbonisation', 14, 'How familiar are you with renewable sourcing and energy-efficient hardware practices (e.g., Energy Star, TCO Certified)?', 'Very familiar; I specify certified hardware and renewable sourcing in all contracts.', 'Some familiarity; I consider them selectively.', 'Limited awareness.', 'No awareness.', '• Digital Responsibility\n• Transparency Culture\n• Privacy Respect') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('IT', 'Decarbonisation', 15, 'How proactive are you identifying decarbonisation opportunities in IT?', 'Very proactive; I lead audits, carbon hotspot analyses, and supplier engagement.', 'Somewhat proactive; I contribute when opportunities arise.', 'Occasionally proactive.', 'Not proactive.', '• Digital Responsibility\n• Transparency Culture\n• Privacy Respect') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('IT', 'Risk', 16, 'How aware are you of ESG risks in IT (e.g., regulatory non-compliance, reputational damage)?', 'Very aware; I track risks in IT risk registers, referencing CSRD and EU Taxonomy criteria.', 'Somewhat aware; risks are reviewed annually.', 'Limited awareness.', 'No awareness.', '• Innovation Mindset') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('IT', 'Risk', 17, 'How confident are you managing compliance with digital sustainability regulations (e.g., EU Taxonomy, CSRD)?', 'Very confident; I oversee compliance plans and prepare disclosures.', 'Somewhat confident; I participate in compliance reviews.', 'Limited confidence; I defer to legal.', 'Not confident.', '• Innovation Mindset') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('IT', 'Risk', 18, 'How integrated are ESG risks in IT risk registers and governance processes?', 'Fully integrated; risks reviewed quarterly, with mitigation plans documented.', 'Partially integrated in major programs.', 'Limited integration.', 'Not integrated.', '• Innovation Mindset') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('IT', 'Risk', 19, 'How prepared are you for evolving sustainability regulations (e.g., data center disclosures, energy performance)?', 'Fully prepared; documented policies, training, and audit trails in place.', 'Somewhat prepared; draft policies underway.', 'Limited preparation.', 'Not prepared.', '• Innovation Mindset') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('IT', 'Risk', 20, 'How often do you review ESG risk mitigation plans?', 'Regularly; plans reviewed every quarter with cross-functional teams.', 'Occasionally reviewed.', 'Rarely reviewed.', 'Never reviewed.', '• Innovation Mindset') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('IT', 'Circular Practices', 21, 'How familiar are you with circular IT practices (e.g., reuse, refurbishment, recycling)?', 'Very familiar; I apply principles from ISO 20400 and track performance with suppliers.', 'Some familiarity; I integrate them in some projects.', 'Limited awareness.', 'No awareness.', '• Problem Solving\n• Adaptive Thinking') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('IT', 'Circular Practices', 22, 'Do you prioritize refurbished and circular equipment in procurement?', 'Always; policies mandate minimum recycled content and refurb options.', 'Often prioritized where available.', 'Occasionally considered.', 'Never considered.', '• Problem Solving\n• Adaptive Thinking') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('IT', 'Circular Practices', 23, 'How confident are you embedding circularity in IT operations (e.g., take-back programs)?', 'Very confident; I lead circular asset programs and supplier partnerships.', 'Somewhat confident; I participate in initiatives.', 'Limited confidence.', 'Not confident.', '• Problem Solving\n• Adaptive Thinking') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('IT', 'Circular Practices', 24, 'How often do you measure circularity metrics (e.g., reuse, recycling rates)?', 'Always measured and included in ESG reports.', 'Sometimes measured.', 'Rarely measured.', 'Never measured.', '• Problem Solving\n• Adaptive Thinking') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('IT', 'Circular Practices', 25, 'Do you collaborate with suppliers to improve IT circularity?', 'Regularly; I set targets, monitor progress, and co-develop solutions.', 'Occasionally collaborate.', 'Rarely collaborate.', 'Never collaborate.', '• Problem Solving\n• Adaptive Thinking') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Legal', 'Climate Fluency', 1, 'How familiar are you with climate-related legal obligations and regulations (e.g., CSRD, CSDDD, TCFD)?', 'Very familiar; I interpret, apply, and update policies to comply with these regulations.', 'Some familiarity; I reference them in reviews but need support for complex details.', 'Limited awareness; I’ve read about them but don’t use them consistently.', 'No awareness of climate obligations.', '• ESG Contract Clauses\n• Greenwashing Defense\n• Circular Policy Drafting') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Legal', 'Climate Fluency', 2, 'How confident are you advising the business on compliance with climate disclosure and reporting requirements?', 'Very confident; I prepare disclosures, train teams, and review statements.', 'Somewhat confident; I participate in reviews but don’t lead them.', 'Limited confidence; I defer to external advisors.', 'Not confident.', '• ESG Contract Clauses\n• Greenwashing Defense\n• Circular Policy Drafting') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Legal', 'Climate Fluency', 3, 'How often do you monitor emerging climate-related regulations and standards?', 'Always; I maintain horizon-scanning processes and share regular updates.', 'Often; I track updates quarterly.', 'Occasionally; I review when requested.', 'Never monitored.', '• ESG Contract Clauses\n• Greenwashing Defense\n• Circular Policy Drafting') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Legal', 'Climate Fluency', 4, 'How well do you understand the legal risks of failing to meet decarbonisation or ESG targets?', 'Deep understanding; I advise on litigation, penalties, and contractual liabilities.', 'Good understanding; I know major risks but lack detailed expertise.', 'Limited awareness; I rely on compliance teams.', 'No awareness.', '• ESG Contract Clauses\n• Greenwashing Defense\n• Circular Policy Drafting') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Legal', 'Climate Fluency', 5, 'How proactive are you embedding climate considerations into policies, contracts, and disclosures?', 'Very proactive; I draft templates and integrate climate clauses systematically.', 'Somewhat proactive; I contribute when prompted.', 'Occasionally proactive; I react to external requests.', 'Not proactive.', '• ESG Contract Clauses\n• Greenwashing Defense\n• Circular Policy Drafting') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Legal', 'Data & AI', 6, 'How confident are you reviewing ESG data accuracy and integrity in disclosures?', 'Very confident; I validate ESG data, conduct compliance reviews, and ensure audit trails.', 'Somewhat confident; I participate in reviews with guidance.', 'Limited confidence; I rely on sustainability teams.', 'Not confident.', '• Environmental Regulations\n• Climate Disclosure Rules\n• Due Diligence Law') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Legal', 'Data & AI', 7, 'How often do you collaborate with sustainability and finance teams on ESG reporting compliance?', 'Regularly; I co-develop disclosures and review reports.', 'Occasionally collaborate on key disclosures.', 'Rarely collaborate.', 'Never collaborate.', '• Environmental Regulations\n• Climate Disclosure Rules\n• Due Diligence Law') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Legal', 'Data & AI', 8, 'How familiar are you with digital tools for tracking ESG regulations and compliance (e.g., regulatory horizon scanning platforms)?', 'Very familiar; I use tools like LexisNexis, Diligent ESG, and Thomson Reuters for monitoring.', 'Some familiarity; I use tools occasionally.', 'Limited awareness.', 'No awareness.', '• Environmental Regulations\n• Climate Disclosure Rules\n• Due Diligence Law') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Legal', 'Data & AI', 9, 'How integrated is ESG data validation in your legal compliance processes?', 'Fully integrated; data reviews are mandatory for approvals.', 'Partially integrated in high-risk areas.', 'Limited integration; ad hoc checks.', 'Not integrated.', '• Environmental Regulations\n• Climate Disclosure Rules\n• Due Diligence Law') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Legal', 'Data & AI', 10, 'Do you assess AI-related risks in sustainability reporting and compliance?', 'Always; I lead reviews of AI model transparency and auditability.', 'Often; I participate in assessments.', 'Occasionally; I review when flagged.', 'Never assessed AI risks.', '• Environmental Regulations\n• Climate Disclosure Rules\n• Due Diligence Law') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Legal', 'Decarbonisation', 11, 'How often do you review contracts and agreements for decarbonisation obligations (e.g., carbon reduction targets, supplier commitments)?', 'Always; decarbonisation clauses included in all relevant contracts.', 'Often reviewed for priority contracts.', 'Occasionally reviewed.', 'Never reviewed.', '• Fairness Focus\n• Compliance Ethos\n• Justice Orientation') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Legal', 'Decarbonisation', 12, 'How familiar are you with contractual structures supporting low-carbon solutions (e.g., sustainability-linked contracts)?', 'Very familiar; I draft and negotiate low-carbon performance obligations.', 'Some familiarity; I contribute to negotiations.', 'Limited awareness.', 'No awareness.', '• Fairness Focus\n• Compliance Ethos\n• Justice Orientation') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Legal', 'Decarbonisation', 13, 'Do you proactively integrate decarbonisation commitments in legal templates and policies?', 'Always; standard templates include decarbonisation obligations.', 'Often; clauses added where relevant.', 'Occasionally; added upon request.', 'Never integrated.', '• Fairness Focus\n• Compliance Ethos\n• Justice Orientation') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Legal', 'Decarbonisation', 14, 'How confident are you managing legal risks related to decarbonisation failures?', 'Very confident; I develop mitigation plans and advise executives.', 'Somewhat confident; I participate in discussions.', 'Limited confidence.', 'Not confident.', '• Fairness Focus\n• Compliance Ethos\n• Justice Orientation') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Legal', 'Decarbonisation', 15, 'How often do you assess potential liabilities arising from decarbonisation non-compliance?', 'Always; liabilities reviewed and documented in risk registers.', 'Often assessed.', 'Occasionally assessed.', 'Never assessed.', '• Fairness Focus\n• Compliance Ethos\n• Justice Orientation') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Legal', 'Risk', 16, 'How integrated are ESG risks in your legal risk registers and governance frameworks?', 'Fully integrated; ESG risks reviewed quarterly and linked to enterprise governance.', 'Partially integrated in selected areas.', 'Limited integration.', 'Not integrated.', '• Integrity Driven') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Legal', 'Risk', 17, 'How confident are you advising on reputational risks linked to sustainability and greenwashing?', 'Very confident; I lead reviews aligned to ISO 14021 and CMA Green Claims Code.', 'Somewhat confident; I contribute to reviews.', 'Limited confidence.', 'Not confident.', '• Integrity Driven') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Legal', 'Risk', 18, 'How prepared are you for litigation or regulatory action over ESG performance?', 'Fully prepared; response plans and legal strategies in place.', 'Somewhat prepared; draft plans developed.', 'Limited preparation.', 'Not prepared.', '• Integrity Driven') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Legal', 'Risk', 19, 'How often do you review compliance with evolving ESG regulations (e.g., EU Green Claims Directive)?', 'Always; compliance reviewed quarterly and embedded in controls.', 'Often reviewed.', 'Occasionally reviewed.', 'Never reviewed.', '• Integrity Driven') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Legal', 'Risk', 20, 'How aware are you of potential penalties and liabilities for non-compliance with ESG regulations?', 'Very aware; I maintain an updated compliance register.', 'Somewhat aware.', 'Limited awareness.', 'No awareness.', '• Integrity Driven') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Legal', 'Circular Practices', 21, 'How familiar are you with legal considerations in circular economy models (e.g., warranties, liability)?', 'Very familiar; I draft contracts supporting take-back schemes and extended producer responsibility.', 'Some familiarity; I advise when required.', 'Limited awareness.', 'No awareness.', '• Risk Awareness\n• Critical Analysis') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Legal', 'Circular Practices', 22, 'Do you prioritize circular economy requirements in supplier agreements and procurement templates?', 'Always; circular clauses included in all templates.', 'Often; included when relevant.', 'Occasionally; added case by case.', 'Never included.', '• Risk Awareness\n• Critical Analysis') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Legal', 'Circular Practices', 23, 'How confident are you advising on compliance with circular economy regulations (e.g., WEEE Directive)?', 'Very confident; I interpret regulations and train teams.', 'Somewhat confident; I advise with support.', 'Limited confidence.', 'Not confident.', '• Risk Awareness\n• Critical Analysis') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Legal', 'Circular Practices', 24, 'How often do you review contracts for circularity obligations (e.g., reuse, refurbishment)?', 'Always; every contract reviewed for alignment.', 'Often reviewed.', 'Occasionally reviewed.', 'Never reviewed.', '• Risk Awareness\n• Critical Analysis') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Legal', 'Circular Practices', 25, 'Do you collaborate with procurement and operations teams to embed circularity into contracts?', 'Regularly; I co-develop standard clauses and monitor compliance.', 'Occasionally collaborate.', 'Rarely collaborate.', 'Never collaborate.', '• Risk Awareness\n• Critical Analysis') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Supply Chain', 'Climate Fluency', 1, 'How familiar are you with climate-related supply chain risks (e.g., emissions hotspots, resource scarcity)?', 'Very familiar; I conduct Scope 3 hotspot mapping using GHG Protocol, CDP Supply Chain, and engage suppliers to quantify risks.', 'Some familiarity; I understand key emissions drivers but need guidance for detailed analysis.', 'Limited awareness; I rely on sustainability teams for assessments.', 'No awareness of climate-related risks.', '• Carbon Hotspot Mapping\n• Low-Emission Transport\n• Circular Inventory') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Supply Chain', 'Climate Fluency', 2, 'How confident are you explaining climate risks and expectations to suppliers?', 'Very confident; I lead supplier workshops, develop engagement plans, and translate requirements into contractual language.', 'Somewhat confident; I communicate expectations during major procurement cycles.', 'Limited confidence; I defer to colleagues for supplier engagement.', 'Not confident.', '• Carbon Hotspot Mapping\n• Low-Emission Transport\n• Circular Inventory') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Supply Chain', 'Climate Fluency', 3, 'How often do you engage suppliers on decarbonisation and climate targets?', 'Regularly; I co-develop decarbonisation roadmaps and track progress quarterly.', 'Occasionally; engagement occurs during contract renewals or audits.', 'Rarely; only when compliance requires it.', 'Never engage.', '• Carbon Hotspot Mapping\n• Low-Emission Transport\n• Circular Inventory') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Supply Chain', 'Climate Fluency', 4, 'How familiar are you with standards like ISO 20400, SBTi Supplier Engagement Guidance, and GRI 308?', 'Very familiar; I embed these standards in sourcing processes and supplier evaluation.', 'Some familiarity; I reference them as needed.', 'Limited awareness; I’ve read about them but don’t apply them.', 'No awareness.', '• Carbon Hotspot Mapping\n• Low-Emission Transport\n• Circular Inventory') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Supply Chain', 'Climate Fluency', 5, 'Do you integrate climate considerations into sourcing and category strategies?', 'Always; climate impacts and emissions reductions are weighted as core criteria in supplier selection.', 'Often; considered in high-impact categories.', 'Occasionally; evaluated reactively.', 'Never considered.', '• Carbon Hotspot Mapping\n• Low-Emission Transport\n• Circular Inventory') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Supply Chain', 'Data & AI', 6, 'How advanced are your systems to track emissions and supplier sustainability performance?', 'Fully integrated; I use Scope 3 dashboards, lifecycle analysis platforms (e.g., EcoVadis, CDP), and automated data pipelines.', 'Partially integrated; data compiled manually for key suppliers.', 'Basic tracking; limited coverage and accuracy.', 'No tracking in place.', '• Circular Logistics\n• Scope 3 Visibility\n• Climate Risk Planning') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Supply Chain', 'Data & AI', 7, 'How confident are you using ESG data to evaluate and manage supplier risks?', 'Very confident; I integrate ESG metrics into supplier scorecards, risk registers, and sourcing decisions.', 'Somewhat confident; I review data during procurement.', 'Limited confidence; I rely on others for interpretation.', 'Not confident.', '• Circular Logistics\n• Scope 3 Visibility\n• Climate Risk Planning') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Supply Chain', 'Data & AI', 8, 'How familiar are you with AI tools for emissions forecasting and supply chain risk modeling?', 'Very familiar; I pilot AI solutions for predictive emissions modeling and scenario analysis.', 'Some familiarity; I’ve explored tools but not scaled them.', 'Limited awareness.', 'No awareness.', '• Circular Logistics\n• Scope 3 Visibility\n• Climate Risk Planning') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Supply Chain', 'Data & AI', 9, 'How often do you validate supplier ESG data accuracy and completeness?', 'Always; data verified through audits, third-party assurance, and traceability documentation.', 'Often; validations conducted for strategic suppliers.', 'Rarely; spot-checked without formal process.', 'Never validated.', '• Circular Logistics\n• Scope 3 Visibility\n• Climate Risk Planning') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Supply Chain', 'Data & AI', 10, 'Do you collaborate with procurement, sustainability, and finance teams to improve ESG data?', 'Regularly; I co-develop supplier questionnaires and reporting frameworks.', 'Occasionally collaborate.', 'Rarely collaborate.', 'Never collaborate.', '• Circular Logistics\n• Scope 3 Visibility\n• Climate Risk Planning') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Supply Chain', 'Decarbonisation', 11, 'How aligned is your supply chain strategy with decarbonisation targets (e.g., SBTi, net zero commitments)?', 'Fully aligned; decarbonisation targets cascaded to suppliers with contractual KPIs.', 'Partially aligned; commitments documented for priority suppliers.', 'Limited alignment; addressed on an ad hoc basis.', 'Not aligned.', '• Responsible Sourcing\n• Resource Stewardship\n• Fair Trade Values') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Supply Chain', 'Decarbonisation', 12, 'How confident are you supporting suppliers to reduce emissions and implement low-carbon solutions?', 'Very confident; I lead decarbonisation capability-building programs and monitor supplier progress.', 'Somewhat confident; I engage suppliers periodically.', 'Limited confidence; I rely on others to lead.', 'Not confident.', '• Responsible Sourcing\n• Resource Stewardship\n• Fair Trade Values') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Supply Chain', 'Decarbonisation', 13, 'Do you embed emissions reduction requirements in supplier contracts and tenders?', 'Always; decarbonisation obligations and reporting clauses are standard.', 'Often; included for high-value contracts.', 'Occasionally; included case by case.', 'Never included.', '• Responsible Sourcing\n• Resource Stewardship\n• Fair Trade Values') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Supply Chain', 'Decarbonisation', 14, 'How familiar are you with low-carbon sourcing practices (e.g., renewable materials, sustainable logistics)?', 'Very familiar; I incorporate low-carbon sourcing in strategies and contracts.', 'Some familiarity; considered for selected categories.', 'Limited awareness.', 'No awareness.', '• Responsible Sourcing\n• Resource Stewardship\n• Fair Trade Values') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Supply Chain', 'Decarbonisation', 15, 'How proactive are you in identifying decarbonisation opportunities with suppliers?', 'Very proactive; I conduct annual reviews and initiate collaborative pilots.', 'Somewhat proactive; I contribute when opportunities arise.', 'Occasionally proactive.', 'Not proactive.', '• Responsible Sourcing\n• Resource Stewardship\n• Fair Trade Values') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Supply Chain', 'Risk', 16, 'How aware are you of ESG compliance risks (e.g., deforestation, human rights, environmental breaches)?', 'Very aware; I maintain a compliance register aligned with EU Deforestation Regulation, CSDDD, and Modern Slavery Act.', 'Somewhat aware; risks reviewed in annual audits.', 'Limited awareness.', 'No awareness.', '• Resilience Focus') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Supply Chain', 'Risk', 17, 'How confident are you managing supplier breaches and ESG-related non-compliance?', 'Very confident; I lead corrective actions, legal escalations, and remediation plans.', 'Somewhat confident; I support compliance teams.', 'Limited confidence.', 'Not confident.', '• Resilience Focus') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Supply Chain', 'Risk', 18, 'How integrated are ESG risks in supply chain risk registers and governance processes?', 'Fully integrated; reviewed quarterly and linked to business continuity and procurement governance.', 'Partially integrated for high-risk suppliers.', 'Limited integration.', 'Not integrated.', '• Resilience Focus') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Supply Chain', 'Risk', 19, 'How prepared are you for regulatory changes affecting supply chain sustainability (e.g., CSDDD, CBAM)?', 'Fully prepared; documented processes, supplier engagement, and legal reviews in place.', 'Somewhat prepared; policies in development.', 'Limited preparation.', 'Not prepared.', '• Resilience Focus') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Supply Chain', 'Risk', 20, 'How often do you review mitigation plans for supply chain ESG risks?', 'Regularly; reviews occur quarterly with procurement and compliance teams.', 'Occasionally reviewed.', 'Rarely reviewed.', 'Never reviewed.', '• Resilience Focus') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Supply Chain', 'Circular Practices', 21, 'How familiar are you with circular practices in supply chain management (e.g., reverse logistics, closed-loop models)?', 'Very familiar; I apply ISO 20400 principles and track reuse, refurbishment, and recovery rates.', 'Some familiarity; applied selectively.', 'Limited awareness.', 'No awareness.', '• Partnership Mindset\n• Systems Thinking') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Supply Chain', 'Circular Practices', 22, 'Do you prioritize suppliers with strong circular economy capabilities?', 'Always; supplier evaluations include circularity criteria.', 'Often prioritized for relevant categories.', 'Occasionally considered.', 'Never considered.', '• Partnership Mindset\n• Systems Thinking') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Supply Chain', 'Circular Practices', 23, 'How confident are you embedding circularity requirements in contracts and procurement policies?', 'Very confident; I draft contractual obligations for take-back, reuse, and material recovery.', 'Somewhat confident; I contribute to negotiations.', 'Limited confidence.', 'Not confident.', '• Partnership Mindset\n• Systems Thinking') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Supply Chain', 'Circular Practices', 24, 'How often do you measure and report on circularity performance (e.g., % recycled content, reuse rates)?', 'Always; tracked and reported in ESG disclosures and supplier reviews.', 'Sometimes measured.', 'Rarely measured.', 'Never measured.', '• Partnership Mindset\n• Systems Thinking') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Supply Chain', 'Circular Practices', 25, 'Do you collaborate with suppliers to develop circular solutions?', 'Regularly; I co-develop pilots and integrate lessons learned into sourcing strategies.', 'Occasionally collaborate.', 'Rarely collaborate.', 'Never collaborate.', '• Partnership Mindset\n• Systems Thinking') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('HR', 'Climate Fluency', 1, 'How familiar are you with climate-related people risks (e.g., health and safety, workforce transitions)?', 'Very familiar; I assess risks using GRI 401, ILO guidelines, and integrate them into workforce plans.', 'Some familiarity; I understand risks in broad terms.', 'Limited awareness; I rely on sustainability teams.', 'No awareness.', '• Green Workforce Planning\n• Sustainable Benefits\n• Net Zero Onboarding') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('HR', 'Climate Fluency', 2, 'How confident are you supporting leaders and employees to understand climate strategy?', 'Very confident; I develop training, policies, and communications about decarbonisation and adaptation.', 'Somewhat confident; I contribute to materials when asked.', 'Limited confidence.', 'Not confident.', '• Green Workforce Planning\n• Sustainable Benefits\n• Net Zero Onboarding') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('HR', 'Climate Fluency', 3, 'How often do you engage employees on climate and sustainability topics (e.g., green skills, values alignment)?', 'Regularly; sustainability is embedded in onboarding, training, and culture programs.', 'Occasionally discussed in specific initiatives.', 'Rarely discussed.', 'Never discussed.', '• Green Workforce Planning\n• Sustainable Benefits\n• Net Zero Onboarding') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('HR', 'Climate Fluency', 4, 'How familiar are you with standards and regulations influencing workforce sustainability (e.g., ISO 30414, EU Social Taxonomy)?', 'Very familiar; I apply them in policy development and reporting.', 'Some familiarity; referenced occasionally.', 'Limited awareness.', 'No awareness.', '• Green Workforce Planning\n• Sustainable Benefits\n• Net Zero Onboarding') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('HR', 'Climate Fluency', 5, 'Do you integrate climate and sustainability into talent strategies and workforce planning?', 'Always; ESG competencies, learning, and incentives are embedded in talent frameworks.', 'Often considered in priority functions.', 'Occasionally considered.', 'Never considered.', '• Green Workforce Planning\n• Sustainable Benefits\n• Net Zero Onboarding') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('HR', 'Data & AI', 6, 'How advanced are your systems to track sustainability training and workforce metrics?', 'Fully integrated; systems track participation, impact, and ESG competencies using HRIS platforms.', 'Partially integrated; tracked manually in some areas.', 'Limited tracking.', 'No tracking.', '• ESG Training Knowledge\n• Climate Policy Awareness\n• Diversity Integration') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('HR', 'Data & AI', 7, 'How confident are you using workforce ESG data to inform people strategy?', 'Very confident; ESG data is embedded in culture, engagement, and development KPIs.', 'Somewhat confident; I use data selectively.', 'Limited confidence.', 'Not confident.', '• ESG Training Knowledge\n• Climate Policy Awareness\n• Diversity Integration') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('HR', 'Data & AI', 8, 'How familiar are you with AI tools for workforce sustainability (e.g., skill gap mapping, climate scenario planning)?', 'Very familiar; I lead pilots using AI for green skills and transition risk modeling.', 'Some familiarity; I’ve explored tools in limited pilots.', 'Limited awareness.', 'No awareness.', '• ESG Training Knowledge\n• Climate Policy Awareness\n• Diversity Integration') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('HR', 'Data & AI', 9, 'How often do you validate ESG workforce data accuracy?', 'Always; validated through audits and assurance processes.', 'Sometimes validated for annual reports.', 'Rarely validated.', 'Never validated.', '• ESG Training Knowledge\n• Climate Policy Awareness\n• Diversity Integration') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('HR', 'Data & AI', 10, 'Do you collaborate with sustainability and finance teams to improve ESG reporting?', 'Regularly; I co-develop metrics and reporting frameworks.', 'Occasionally collaborate.', 'Rarely collaborate.', 'Never collaborate.', '• ESG Training Knowledge\n• Climate Policy Awareness\n• Diversity Integration') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('HR', 'Decarbonisation', 11, 'How aligned is HR strategy with decarbonisation and Just Transition principles?', 'Fully aligned; reskilling, workforce planning, and incentives reflect net zero commitments.', 'Partially aligned; considered in selected programs.', 'Limited alignment; ad hoc efforts only.', 'Not aligned.', '• Inclusion Commitment\n• Purpose Driven\n• Wellbeing Focus') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('HR', 'Decarbonisation', 12, 'How confident are you designing learning programs for decarbonisation skills?', 'Very confident; I lead design and delivery of green skills and climate literacy programs.', 'Somewhat confident; I contribute to content.', 'Limited confidence.', 'Not confident.', '• Inclusion Commitment\n• Purpose Driven\n• Wellbeing Focus') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('HR', 'Decarbonisation', 13, 'Do you embed decarbonisation goals into reward and recognition systems?', 'Always; ESG targets influence incentives and performance management.', 'Often; applied to senior roles.', 'Occasionally; informal recognition only.', 'Never embedded.', '• Inclusion Commitment\n• Purpose Driven\n• Wellbeing Focus') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('HR', 'Decarbonisation', 14, 'How familiar are you with frameworks for workforce decarbonisation (e.g., Just Transition guidelines, WBCSD principles)?', 'Very familiar; I reference them in workforce strategy.', 'Some familiarity; I’ve reviewed them.', 'Limited awareness.', 'No awareness.', '• Inclusion Commitment\n• Purpose Driven\n• Wellbeing Focus') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('HR', 'Decarbonisation', 15, 'How proactive are you identifying workforce decarbonisation opportunities?', 'Very proactive; I lead gap analyses and planning.', 'Somewhat proactive.', 'Occasionally proactive.', 'Not proactive.', '• Inclusion Commitment\n• Purpose Driven\n• Wellbeing Focus') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('HR', 'Risk', 16, 'How aware are you of climate-related people risks (e.g., mental health, reskilling risks)?', 'Very aware; risks documented in HR risk registers and mitigation plans.', 'Somewhat aware; considered in strategic planning.', 'Limited awareness.', 'No awareness.', '• Culture Building') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('HR', 'Risk', 17, 'How confident are you managing compliance with workforce sustainability regulations?', 'Very confident; I develop policies aligned to EU Social Taxonomy and local labor laws.', 'Somewhat confident.', 'Limited confidence.', 'Not confident.', '• Culture Building') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('HR', 'Risk', 18, 'How integrated are ESG risks in HR governance and risk registers?', 'Fully integrated; reviewed quarterly.', 'Partially integrated in selected areas.', 'Limited integration.', 'Not integrated.', '• Culture Building') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('HR', 'Risk', 19, 'How prepared are you for regulatory changes affecting workforce sustainability?', 'Fully prepared; documented plans and training in place.', 'Somewhat prepared.', 'Limited preparation.', 'Not prepared.', '• Culture Building') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('HR', 'Risk', 20, 'How often do you review ESG risk mitigation plans?', 'Regularly; reviewed with leadership.', 'Occasionally reviewed.', 'Rarely reviewed.', 'Never reviewed.', '• Culture Building') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('HR', 'Circular Practices', 21, 'How familiar are you with circular economy concepts applied to HR (e.g., circular jobs, workforce upskilling)?', 'Very familiar; I embed principles into job design and talent strategy.', 'Some familiarity.', 'Limited awareness.', 'No awareness.', '• Empathy Orientation\n• Open Communication') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('HR', 'Circular Practices', 22, 'Do you prioritize workforce development for circular economy roles?', 'Always; integrated into skills frameworks and training.', 'Often prioritized.', 'Occasionally considered.', 'Never considered.', '• Empathy Orientation\n• Open Communication') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('HR', 'Circular Practices', 23, 'How confident are you enabling workforce transition to circular economy jobs?', 'Very confident; I lead reskilling and mobility programs.', 'Somewhat confident.', 'Limited confidence.', 'Not confident.', '• Empathy Orientation\n• Open Communication') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('HR', 'Circular Practices', 24, 'How often do you measure progress in workforce circularity capabilities?', 'Always; tracked and reported as part of ESG disclosures.', 'Sometimes measured.', 'Rarely measured.', 'Never measured.', '• Empathy Orientation\n• Open Communication') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('HR', 'Circular Practices', 25, 'Do you collaborate with sustainability teams to build circular capabilities?', 'Regularly; I co-develop training and career pathways.', 'Occasionally collaborate.', 'Rarely collaborate.', 'Never collaborate.', '• Empathy Orientation\n• Open Communication') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('CxO / Executive', 'Climate Fluency', 1, 'How familiar are you with climate-related financial and operational risks (e.g., TCFD, ISSB, CSRD)?', 'Very familiar; I oversee disclosures, risk assessments, and align strategy to regulatory frameworks.', 'Some familiarity; I review summaries but rely on experts for detail.', 'Limited awareness; I depend fully on sustainability teams.', 'No awareness.', '• ESG Strategy Design\n• Decarbonisation Roadmapping\n• Sustainable Investment') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('CxO / Executive', 'Climate Fluency', 2, 'How confident are you leading the integration of climate considerations into business strategy?', 'Very confident; I sponsor decarbonisation roadmaps, approve targets, and monitor execution.', 'Somewhat confident; I participate in planning but do not lead.', 'Limited confidence; I engage reactively.', 'Not confident.', '• ESG Strategy Design\n• Decarbonisation Roadmapping\n• Sustainable Investment') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('CxO / Executive', 'Climate Fluency', 3, 'How often do you engage investors and stakeholders on climate-related performance?', 'Regularly; I lead engagements and disclose progress in alignment with TCFD and ISSB.', 'Occasionally engaged when required.', 'Rarely; only involved when escalated.', 'Never engaged.', '• ESG Strategy Design\n• Decarbonisation Roadmapping\n• Sustainable Investment') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('CxO / Executive', 'Climate Fluency', 4, 'How familiar are you with climate scenario planning and risk modeling?', 'Very familiar; I integrate scenarios (e.g., 1.5°C pathways) into strategic decisions.', 'Some familiarity; I review outputs periodically.', 'Limited awareness.', 'No awareness.', '• ESG Strategy Design\n• Decarbonisation Roadmapping\n• Sustainable Investment') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('CxO / Executive', 'Climate Fluency', 5, 'Do you embed climate literacy in board and leadership development?', 'Always; training and climate governance are standard in leadership programs.', 'Often included in select training.', 'Occasionally considered.', 'Never included.', '• ESG Strategy Design\n• Decarbonisation Roadmapping\n• Sustainable Investment') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('CxO / Executive', 'Data & AI', 6, 'How advanced are your systems for tracking and reporting ESG and climate data?', 'Fully integrated; ESG data embedded in executive dashboards and reviewed quarterly.', 'Partially integrated; tracked in separate reports.', 'Limited integration; only high-level summaries.', 'No systems in place.', '• Climate Governance\n• Regulatory Mastery\n• TCFD Familiarity') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('CxO / Executive', 'Data & AI', 7, 'How confident are you using ESG data to guide strategic and financial decisions?', 'Very confident; ESG metrics shape capital allocation, M&A, and risk appetite.', 'Somewhat confident; data considered alongside financials.', 'Limited confidence; ESG seen as compliance-only.', 'Not confident.', '• Climate Governance\n• Regulatory Mastery\n• TCFD Familiarity') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('CxO / Executive', 'Data & AI', 8, 'How familiar are you with AI tools for ESG forecasting and reporting?', 'Very familiar; I oversee pilots using AI to predict climate and regulatory risks.', 'Some familiarity; I am aware but not actively involved.', 'Limited awareness.', 'No awareness.', '• Climate Governance\n• Regulatory Mastery\n• TCFD Familiarity') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('CxO / Executive', 'Data & AI', 9, 'How often do you validate ESG data accuracy before disclosure?', 'Always; internal audits and external assurance are standard.', 'Often validated in major disclosures.', 'Occasionally reviewed.', 'Never validated.', '• Climate Governance\n• Regulatory Mastery\n• TCFD Familiarity') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('CxO / Executive', 'Data & AI', 10, 'Do you collaborate with finance, risk, and sustainability teams on ESG data governance?', 'Regularly; I chair steering committees and review metrics.', 'Occasionally collaborate.', 'Rarely collaborate.', 'Never collaborate.', '• Climate Governance\n• Regulatory Mastery\n• TCFD Familiarity') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('CxO / Executive', 'Decarbonisation', 11, 'How aligned is your corporate strategy with net zero and SBTi targets?', 'Fully aligned; decarbonisation KPIs embedded in business plans and board oversight.', 'Partially aligned; some commitments tracked.', 'Limited alignment; managed reactively.', 'Not aligned.', '• Visionary Leadership\n• Stewardship Values\n• Systemic Responsibility') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('CxO / Executive', 'Decarbonisation', 12, 'How confident are you approving investments in low-carbon technologies and processes?', 'Very confident; I prioritize funding and track ROI on decarbonisation.', 'Somewhat confident; I approve when proposals are justified.', 'Limited confidence; I rely on others for recommendations.', 'Not confident.', '• Visionary Leadership\n• Stewardship Values\n• Systemic Responsibility') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('CxO / Executive', 'Decarbonisation', 13, 'Do you set clear emissions reduction targets with accountability at the executive level?', 'Always; targets linked to incentives and board reporting.', 'Often; targets exist but accountability varies.', 'Occasionally; targets aspirational only.', 'Never set targets.', '• Visionary Leadership\n• Stewardship Values\n• Systemic Responsibility') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('CxO / Executive', 'Decarbonisation', 14, 'How familiar are you with low-carbon transition risks and opportunities in your sector?', 'Very familiar; I assess implications for business models and growth.', 'Some familiarity.', 'Limited awareness.', 'No awareness.', '• Visionary Leadership\n• Stewardship Values\n• Systemic Responsibility') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('CxO / Executive', 'Decarbonisation', 15, 'How proactive are you identifying decarbonisation initiatives and strategic shifts?', 'Very proactive; I sponsor transformation programs and industry collaborations.', 'Somewhat proactive.', 'Occasionally proactive.', 'Not proactive.', '• Visionary Leadership\n• Stewardship Values\n• Systemic Responsibility') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('CxO / Executive', 'Risk', 16, 'How aware are you of ESG-related legal, financial, and reputational risks?', 'Very aware; risks embedded in enterprise risk management aligned with CSRD and TCFD.', 'Somewhat aware; reviewed in annual planning.', 'Limited awareness.', 'No awareness.', '• Bold Commitment') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('CxO / Executive', 'Risk', 17, 'How confident are you overseeing ESG compliance and performance monitoring?', 'Very confident; I lead board discussions and approve controls.', 'Somewhat confident.', 'Limited confidence.', 'Not confident.', '• Bold Commitment') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('CxO / Executive', 'Risk', 18, 'How integrated are ESG risks in board risk registers and controls?', 'Fully integrated; reviewed quarterly and linked to executive performance.', 'Partially integrated in key areas.', 'Limited integration.', 'Not integrated.', '• Bold Commitment') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('CxO / Executive', 'Risk', 19, 'How prepared are you for regulatory changes affecting ESG disclosures and performance (e.g., CSRD, ISSB)?', 'Fully prepared; policies, training, and scenarios in place.', 'Somewhat prepared.', 'Limited preparation.', 'Not prepared.', '• Bold Commitment') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('CxO / Executive', 'Risk', 20, 'How often do you review ESG risk mitigation and progress?', 'Regularly; part of quarterly board reporting.', 'Occasionally reviewed.', 'Rarely reviewed.', 'Never reviewed.', '• Bold Commitment') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('CxO / Executive', 'Circular Practices', 21, 'How familiar are you with circular economy opportunities and risks in your value chain?', 'Very familiar; I sponsor assessments and strategic plans for circular models.', 'Some familiarity.', 'Limited awareness.', 'No awareness.', '• Accountability Driven\n• Adaptive Mindset') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('CxO / Executive', 'Circular Practices', 22, 'Do you prioritize circular business models in corporate strategy?', 'Always; circularity is a strategic pillar with investment targets.', 'Often prioritized in product strategy.', 'Occasionally considered.', 'Never considered.', '• Accountability Driven\n• Adaptive Mindset') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('CxO / Executive', 'Circular Practices', 23, 'How confident are you communicating circular economy progress to stakeholders?', 'Very confident; I approve disclosures aligned to ISO 14021 and EU Green Claims Directive.', 'Somewhat confident.', 'Limited confidence.', 'Not confident.', '• Accountability Driven\n• Adaptive Mindset') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('CxO / Executive', 'Circular Practices', 24, 'How often do you measure and report progress against circularity KPIs?', 'Always; metrics disclosed in ESG reports and investor updates.', 'Sometimes measured.', 'Rarely measured.', 'Never measured.', '• Accountability Driven\n• Adaptive Mindset') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('CxO / Executive', 'Circular Practices', 25, 'Do you collaborate across functions to embed circularity in governance and strategy?', 'Regularly; I chair committees and monitor implementation.', 'Occasionally collaborate.', 'Rarely collaborate.', 'Never collaborate.', '• Accountability Driven\n• Adaptive Mindset') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Operations', 'Climate Fluency', 1, 'How familiar are you with the climate impacts of operational activities (e.g., energy, waste, logistics)?', 'Very familiar; I track impacts using GHG Protocol, ISO 14001, and lifecycle assessments.', 'Some familiarity; I understand main impacts but lack detailed quantification.', 'Limited awareness; I rely on sustainability teams.', 'No awareness.', '• Energy Efficiency\n• Circular Process Design\n• Waste Reduction') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Operations', 'Climate Fluency', 2, 'How confident are you explaining operational decarbonisation priorities to teams?', 'Very confident; I train teams and integrate decarbonisation into SOPs and KPIs.', 'Somewhat confident; I communicate priorities when needed.', 'Limited confidence; I defer to sustainability leads.', 'Not confident.', '• Energy Efficiency\n• Circular Process Design\n• Waste Reduction') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Operations', 'Climate Fluency', 3, 'How often do you engage staff on climate and sustainability topics?', 'Regularly; training, updates, and engagement are built into operations management.', 'Occasionally during project rollouts.', 'Rarely; only when required.', 'Never discussed.', '• Energy Efficiency\n• Circular Process Design\n• Waste Reduction') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Operations', 'Climate Fluency', 4, 'How familiar are you with operational standards (e.g., ISO 50001 energy management, LEAN for sustainability)?', 'Very familiar; I apply standards in continuous improvement and reporting.', 'Some familiarity; I reference them selectively.', 'Limited awareness.', 'No awareness.', '• Energy Efficiency\n• Circular Process Design\n• Waste Reduction') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Operations', 'Climate Fluency', 5, 'Do you integrate climate considerations into operational decision-making and investments?', 'Always; decarbonisation impacts are core to business cases.', 'Often considered.', 'Occasionally considered.', 'Never considered.', '• Energy Efficiency\n• Circular Process Design\n• Waste Reduction') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Operations', 'Data & AI', 6, 'How advanced are your systems to track operational emissions, energy use, and waste?', 'Fully integrated; real-time dashboards monitor Scope 1 and 2 impacts.', 'Partially integrated; data tracked manually.', 'Limited tracking.', 'No tracking systems.', '• Process Footprinting\n• Emissions Tracking\n• ESG Compliance') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Operations', 'Data & AI', 7, 'How confident are you using ESG data to optimize operational performance?', 'Very confident; I use data for performance management and continuous improvement.', 'Somewhat confident; I reference data occasionally.', 'Limited confidence.', 'Not confident.', '• Process Footprinting\n• Emissions Tracking\n• ESG Compliance') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Operations', 'Data & AI', 8, 'How familiar are you with AI tools for optimizing energy use, waste reduction, and emissions?', 'Very familiar; I lead pilots applying AI for predictive maintenance and resource efficiency.', 'Some familiarity; I’ve trialed tools.', 'Limited awareness.', 'No awareness.', '• Process Footprinting\n• Emissions Tracking\n• ESG Compliance') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Operations', 'Data & AI', 9, 'How often do you validate operational ESG data accuracy?', 'Always; subject to internal audits and third-party assurance.', 'Sometimes validated for key reports.', 'Rarely validated.', 'Never validated.', '• Process Footprinting\n• Emissions Tracking\n• ESG Compliance') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Operations', 'Data & AI', 10, 'Do you collaborate with sustainability and finance teams to improve data and reporting?', 'Regularly; I co-create metrics and dashboards.', 'Occasionally collaborate.', 'Rarely collaborate.', 'Never collaborate.', '• Process Footprinting\n• Emissions Tracking\n• ESG Compliance') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Operations', 'Decarbonisation', 11, 'How aligned is operations strategy with decarbonisation targets?', 'Fully aligned; operational KPIs, budgets, and roadmaps support SBTi targets.', 'Partially aligned in major areas.', 'Limited alignment; ad hoc projects.', 'Not aligned.', '• Operational Integrity\n• Resource Responsibility\n• Transparency Ethos') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Operations', 'Decarbonisation', 12, 'How confident are you driving decarbonisation initiatives (e.g., energy efficiency, fuel switching)?', 'Very confident; I lead execution and track ROI.', 'Somewhat confident; I support delivery.', 'Limited confidence.', 'Not confident.', '• Operational Integrity\n• Resource Responsibility\n• Transparency Ethos') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Operations', 'Decarbonisation', 13, 'Do you set emissions reduction targets for operational performance?', 'Always; targets are monitored and reported quarterly.', 'Often; targets set in selected areas.', 'Occasionally; informal goals.', 'Never set targets.', '• Operational Integrity\n• Resource Responsibility\n• Transparency Ethos') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Operations', 'Decarbonisation', 14, 'How familiar are you with low-carbon technologies in operations (e.g., electrification, renewable sourcing)?', 'Very familiar; I integrate options in investment planning.', 'Some familiarity; considered in evaluations.', 'Limited awareness.', 'No awareness.', '• Operational Integrity\n• Resource Responsibility\n• Transparency Ethos') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Operations', 'Decarbonisation', 15, 'How proactive are you identifying decarbonisation opportunities?', 'Very proactive; I lead assessments and improvement plans.', 'Somewhat proactive.', 'Occasionally proactive.', 'Not proactive.', '• Operational Integrity\n• Resource Responsibility\n• Transparency Ethos') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Operations', 'Risk', 16, 'How aware are you of ESG risks in operations (e.g., compliance, environmental incidents)?', 'Very aware; risks mapped, mitigated, and reviewed quarterly.', 'Somewhat aware; considered in annual planning.', 'Limited awareness.', 'No awareness.', '• Improvement Focus') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Operations', 'Risk', 17, 'How confident are you managing compliance with operational ESG requirements?', 'Very confident; I oversee controls and ensure audits are passed.', 'Somewhat confident.', 'Limited confidence.', 'Not confident.', '• Improvement Focus') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Operations', 'Risk', 18, 'How integrated are ESG risks in operational risk registers and governance?', 'Fully integrated; reviewed quarterly with senior leadership.', 'Partially integrated.', 'Limited integration.', 'Not integrated.', '• Improvement Focus') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Operations', 'Risk', 19, 'How prepared are you for regulatory changes affecting operations (e.g., energy efficiency standards)?', 'Fully prepared; policies and training in place.', 'Somewhat prepared.', 'Limited preparation.', 'Not prepared.', '• Improvement Focus') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Operations', 'Risk', 20, 'How often do you review ESG risk mitigation plans?', 'Regularly; reviewed and updated quarterly.', 'Occasionally reviewed.', 'Rarely reviewed.', 'Never reviewed.', '• Improvement Focus') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Operations', 'Circular Practices', 21, 'How familiar are you with circular practices in operations (e.g., closed-loop processes, material recovery)?', 'Very familiar; I integrate ISO 14001 and circular economy principles.', 'Some familiarity; considered selectively.', 'Limited awareness.', 'No awareness.', '• Ownership Culture\n• Results Orientation') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Operations', 'Circular Practices', 22, 'Do you prioritize circularity in operational design and processes?', 'Always; criteria embedded in process design.', 'Often prioritized.', 'Occasionally considered.', 'Never considered.', '• Ownership Culture\n• Results Orientation') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Operations', 'Circular Practices', 23, 'How confident are you embedding circular practices in operations?', 'Very confident; I lead implementation and track metrics.', 'Somewhat confident.', 'Limited confidence.', 'Not confident.', '• Ownership Culture\n• Results Orientation') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Operations', 'Circular Practices', 24, 'How often do you measure and report circularity metrics (e.g., reuse rates, waste diversion)?', 'Always; metrics reported in ESG disclosures.', 'Sometimes measured.', 'Rarely measured.', 'Never measured.', '• Ownership Culture\n• Results Orientation') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Operations', 'Circular Practices', 25, 'Do you collaborate across functions to scale circular initiatives?', 'Regularly; I co-develop programs with other teams.', 'Occasionally collaborate.', 'Rarely collaborate.', 'Never collaborate.', '• Ownership Culture\n• Results Orientation') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Finance', 'Climate Fluency', 1, 'How well do you understand climate-related financial risks and opportunities (e.g., transition, physical, liability risks)?', 'Deep understanding; I apply TCFD guidance to identify and quantify risks in financial planning.', 'Good understanding; I consider major risks but lack detailed quantification experience.', 'Limited awareness; I understand high-level concepts but not specifics.', 'No awareness of climate-related financial risks.', '• ESG Risk Modelling\n• Carbon Costing\n• Impact Investing') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Finance', 'Climate Fluency', 2, 'How confident are you explaining climate risks and decarbonisation impacts to investors and leadership?', 'Very confident; I prepare disclosures, scenario analyses, and respond to investor queries.', 'Somewhat confident; I can explain core concepts but rely on sustainability leads.', 'Limited confidence; I only contribute when prompted.', 'Not confident.', '• ESG Risk Modelling\n• Carbon Costing\n• Impact Investing') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Finance', 'Climate Fluency', 3, 'How familiar are you with sustainability reporting frameworks (e.g., TCFD, ISSB, EU Taxonomy)?', 'Very familiar; I integrate these frameworks into financial statements and investor reports.', 'Some familiarity; I reference them when needed.', 'Limited awareness; I’ve read about them but don’t apply them.', 'No awareness.', '• ESG Risk Modelling\n• Carbon Costing\n• Impact Investing') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Finance', 'Climate Fluency', 4, 'How often do you integrate climate considerations into capital allocation and budgeting?', 'Always; climate risk and decarbonisation potential are included in ROI and investment criteria.', 'Often; considered in major investment decisions.', 'Occasionally; evaluated if flagged by leadership.', 'Never considered.', '• ESG Risk Modelling\n• Carbon Costing\n• Impact Investing') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Finance', 'Climate Fluency', 5, 'How proactive are you in assessing the financial impacts of climate scenarios (e.g., 1.5°C pathways)?', 'Very proactive; I conduct scenario modeling and stress testing annually.', 'Somewhat proactive; I contribute to assessments led by others.', 'Occasionally proactive; I review outputs only.', 'Not proactive.', '• ESG Risk Modelling\n• Carbon Costing\n• Impact Investing') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Finance', 'Data & AI', 6, 'How advanced are your systems to track ESG and climate data for financial reporting?', 'Fully integrated; ESG and climate data embedded in enterprise systems and financial dashboards.', 'Partially integrated; ESG tracked in separate reports.', 'Basic tracking; limited datasets.', 'No tracking.', '• Green Finance Principles\n• Regulatory Compliance\n• TCFD Knowledge') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Finance', 'Data & AI', 7, 'How confident are you using ESG data to inform financial decisions (e.g., risk assessments, valuations)?', 'Very confident; I integrate ESG data into financial modeling and scenario analysis.', 'Somewhat confident; I use ESG data selectively.', 'Limited confidence; I rely on external advisors.', 'Not confident.', '• Green Finance Principles\n• Regulatory Compliance\n• TCFD Knowledge') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Finance', 'Data & AI', 8, 'How familiar are you with AI and advanced analytics tools for ESG risk modeling?', 'Very familiar; I lead pilots using AI-based climate risk assessment tools.', 'Some familiarity; I’ve explored tools but haven’t implemented them fully.', 'Limited awareness.', 'No awareness.', '• Green Finance Principles\n• Regulatory Compliance\n• TCFD Knowledge') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Finance', 'Data & AI', 9, 'How often do you validate ESG data accuracy in financial reporting?', 'Always; ESG metrics are audited internally and externally.', 'Sometimes validated for disclosures.', 'Rarely validated.', 'Never validated.', '• Green Finance Principles\n• Regulatory Compliance\n• TCFD Knowledge') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Finance', 'Data & AI', 10, 'Do you collaborate with sustainability, risk, and data teams to improve ESG financial metrics?', 'Regularly; I co-develop methodologies and reporting frameworks.', 'Occasionally collaborate.', 'Rarely collaborate.', 'Never collaborate.', '• Green Finance Principles\n• Regulatory Compliance\n• TCFD Knowledge') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Finance', 'Decarbonisation', 11, 'How aligned is finance strategy with decarbonisation targets and net zero commitments?', 'Fully aligned; decarbonisation KPIs and funding requirements embedded in financial strategy.', 'Partially aligned; targets reflected in select budgets.', 'Limited alignment; addressed reactively.', 'Not aligned.', '• Stewardship Commitment\n• Integrity Orientation\n• Purpose Driven') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Finance', 'Decarbonisation', 12, 'How confident are you integrating decarbonisation costs and benefits into investment cases?', 'Very confident; I quantify emissions reduction ROI and lifecycle costs.', 'Somewhat confident; I include estimates when available.', 'Limited confidence; I need support from other teams.', 'Not confident.', '• Stewardship Commitment\n• Integrity Orientation\n• Purpose Driven') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Finance', 'Decarbonisation', 13, 'Do you set internal carbon pricing or shadow pricing to guide financial decisions?', 'Always; internal carbon pricing used in investment appraisal and project budgets.', 'Often; considered for high-impact projects.', 'Occasionally; used informally.', 'Never used or considered.', '• Stewardship Commitment\n• Integrity Orientation\n• Purpose Driven') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Finance', 'Decarbonisation', 14, 'How familiar are you with climate finance instruments (e.g., green bonds, sustainability-linked loans)?', 'Very familiar; I structure and monitor green finance instruments.', 'Some familiarity; I have worked on some deals.', 'Limited awareness.', 'No awareness.', '• Stewardship Commitment\n• Integrity Orientation\n• Purpose Driven') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Finance', 'Decarbonisation', 15, 'How proactive are you in identifying decarbonisation funding opportunities and incentives?', 'Very proactive; I regularly source grants, incentives, and investment options.', 'Somewhat proactive; I respond to opportunities when presented.', 'Occasionally proactive.', 'Not proactive.', '• Stewardship Commitment\n• Integrity Orientation\n• Purpose Driven') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Finance', 'Risk', 16, 'How aware are you of climate-related risks in financial planning (e.g., stranded assets, regulatory fines)?', 'Very aware; risks mapped and integrated into enterprise risk management.', 'Somewhat aware; considered in scenario analysis.', 'Limited awareness.', 'No awareness.', '• Long-Term Thinking') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Finance', 'Risk', 17, 'How confident are you managing compliance with climate disclosure regulations (e.g., TCFD, CSRD)?', 'Very confident; I lead compliance processes and reporting.', 'Somewhat confident; I contribute to compliance reviews.', 'Limited confidence; I rely on legal.', 'Not confident.', '• Long-Term Thinking') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Finance', 'Risk', 18, 'How integrated are ESG risks in finance risk registers and controls?', 'Fully integrated; reviewed quarterly and linked to operational and strategic risks.', 'Partially integrated for key areas.', 'Limited integration.', 'Not integrated.', '• Long-Term Thinking') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Finance', 'Risk', 19, 'How prepared are you for evolving climate and ESG regulations affecting finance (e.g., ISSB standards)?', 'Fully prepared; documented plans and training in place.', 'Somewhat prepared; policies in development.', 'Limited preparation.', 'Not prepared.', '• Long-Term Thinking') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Finance', 'Risk', 20, 'How often do you review mitigation plans for climate and ESG risks?', 'Regularly; reviews part of quarterly governance.', 'Occasionally reviewed.', 'Rarely reviewed.', 'Never reviewed.', '• Long-Term Thinking') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Finance', 'Circular Practices', 21, 'How familiar are you with financial considerations of circular business models (e.g., leasing, reuse)?', 'Very familiar; I assess ROI, risks, and tax implications of circular strategies.', 'Some familiarity; I support assessments when needed.', 'Limited awareness.', 'No awareness.', '• Accountability Culture\n• Results Focused') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Finance', 'Circular Practices', 22, 'Do you prioritize funding or incentives for circular economy initiatives?', 'Always; budgets and incentives allocated to circular projects.', 'Often prioritized when feasible.', 'Occasionally considered.', 'Never considered.', '• Accountability Culture\n• Results Focused') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Finance', 'Circular Practices', 23, 'How confident are you assessing the financial impact of circular strategies (e.g., asset recovery, material reuse)?', 'Very confident; I model scenarios and track performance.', 'Somewhat confident; I contribute to evaluations.', 'Limited confidence.', 'Not confident.', '• Accountability Culture\n• Results Focused') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Finance', 'Circular Practices', 24, 'How often do you track and report financial KPIs related to circularity?', 'Always; metrics reported in ESG and financial disclosures.', 'Sometimes tracked for major initiatives.', 'Rarely tracked.', 'Never tracked.', '• Accountability Culture\n• Results Focused') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Finance', 'Circular Practices', 25, 'Do you collaborate with sustainability and operations teams on funding circular projects?', 'Regularly; I co-develop business cases and secure funding.', 'Occasionally collaborate.', 'Rarely collaborate.', 'Never collaborate.', '• Accountability Culture\n• Results Focused') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Procurement', 'Climate Fluency', 1, 'How familiar are you with climate-related procurement risks (e.g., Scope 3 emissions, raw material scarcity)?', 'Very familiar; I conduct supplier risk mapping and integrate Scope 3 considerations into sourcing strategy using ISO 20400.', 'Some familiarity; I understand major risks but rely on sustainability teams for details.', 'Limited awareness; I have high-level knowledge only.', 'No awareness.', '• Sustainable Sourcing\n• Life Cycle Analysis\n• Low-Carbon Contracting') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Procurement', 'Climate Fluency', 2, 'How confident are you explaining decarbonisation expectations to suppliers?', 'Very confident; I develop training, embed requirements in RFQs, and lead supplier engagements.', 'Somewhat confident; I communicate expectations during negotiations.', 'Limited confidence; I defer to sustainability colleagues.', 'Not confident.', '• Sustainable Sourcing\n• Life Cycle Analysis\n• Low-Carbon Contracting') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Procurement', 'Climate Fluency', 3, 'How often do you engage suppliers about emissions reduction targets and performance?', 'Regularly; I co-create roadmaps and track progress quarterly.', 'Occasionally; engagement during contract renewals.', 'Rarely; only when required by regulation.', 'Never engage.', '• Sustainable Sourcing\n• Life Cycle Analysis\n• Low-Carbon Contracting') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Procurement', 'Climate Fluency', 4, 'How familiar are you with standards (e.g., SBTi Supplier Engagement, GRI 308)?', 'Very familiar; I apply standards to sourcing processes and supplier assessments.', 'Some familiarity; I reference them selectively.', 'Limited awareness.', 'No awareness.', '• Sustainable Sourcing\n• Life Cycle Analysis\n• Low-Carbon Contracting') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Procurement', 'Climate Fluency', 5, 'Do you integrate climate impacts into procurement decisions and supplier selection?', 'Always; decarbonisation and climate risk criteria weighted in all tenders.', 'Often; considered for critical suppliers.', 'Occasionally considered.', 'Never considered.', '• Sustainable Sourcing\n• Life Cycle Analysis\n• Low-Carbon Contracting') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Procurement', 'Data & AI', 6, 'How advanced are your systems to track supplier ESG data and emissions?', 'Fully integrated; real-time dashboards, third-party platforms (e.g., EcoVadis, CDP Supply Chain), and automated reporting.', 'Partially integrated; some manual data collection.', 'Basic tracking; limited accuracy.', 'No systems in place.', '• Supplier Emissions Data\n• Circular Procurement\n• Scope 3 Reporting') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Procurement', 'Data & AI', 7, 'How confident are you using ESG data to assess and manage supplier risks?', 'Very confident; I embed ESG metrics in supplier scorecards and performance evaluations.', 'Somewhat confident; I reference data periodically.', 'Limited confidence.', 'Not confident.', '• Supplier Emissions Data\n• Circular Procurement\n• Scope 3 Reporting') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Procurement', 'Data & AI', 8, 'How familiar are you with AI tools for supply chain emissions forecasting?', 'Very familiar; I pilot AI solutions to model Scope 3 risks and predict supplier performance.', 'Some familiarity; I have explored tools in pilot projects.', 'Limited awareness.', 'No awareness.', '• Supplier Emissions Data\n• Circular Procurement\n• Scope 3 Reporting') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Procurement', 'Data & AI', 9, 'How often do you validate ESG supplier data accuracy?', 'Always; verified via audits, certifications, and third-party assurance.', 'Often validated for strategic suppliers.', 'Rarely validated.', 'Never validated.', '• Supplier Emissions Data\n• Circular Procurement\n• Scope 3 Reporting') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Procurement', 'Data & AI', 10, 'Do you collaborate with sustainability and finance teams to improve ESG data?', 'Regularly; I co-create supplier reporting frameworks.', 'Occasionally collaborate.', 'Rarely collaborate.', 'Never collaborate.', '• Supplier Emissions Data\n• Circular Procurement\n• Scope 3 Reporting') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Procurement', 'Decarbonisation', 11, 'How aligned is procurement strategy with corporate decarbonisation targets?', 'Fully aligned; decarbonisation KPIs cascaded into procurement objectives and contracts.', 'Partially aligned in priority categories.', 'Limited alignment; addressed ad hoc.', 'Not aligned.', '• Ethical Purchasing\n• Transparency Focus\n• Responsibility Mindset') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Procurement', 'Decarbonisation', 12, 'How confident are you embedding emissions reduction commitments in contracts?', 'Very confident; I lead negotiations and enforce contractual obligations.', 'Somewhat confident; I include clauses when requested.', 'Limited confidence.', 'Not confident.', '• Ethical Purchasing\n• Transparency Focus\n• Responsibility Mindset') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Procurement', 'Decarbonisation', 13, 'Do you set supplier emissions reduction targets in sourcing agreements?', 'Always; targets and reporting requirements standard in all contracts.', 'Often included for high-impact categories.', 'Occasionally included.', 'Never included.', '• Ethical Purchasing\n• Transparency Focus\n• Responsibility Mindset') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Procurement', 'Decarbonisation', 14, 'How familiar are you with low-carbon procurement practices (e.g., renewable materials, local sourcing)?', 'Very familiar; I embed practices in sourcing strategy and criteria.', 'Some familiarity; considered in some tenders.', 'Limited awareness.', 'No awareness.', '• Ethical Purchasing\n• Transparency Focus\n• Responsibility Mindset') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Procurement', 'Decarbonisation', 15, 'How proactive are you identifying decarbonisation opportunities with suppliers?', 'Very proactive; I lead assessments, co-develop plans, and monitor outcomes.', 'Somewhat proactive.', 'Occasionally proactive.', 'Not proactive.', '• Ethical Purchasing\n• Transparency Focus\n• Responsibility Mindset') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Procurement', 'Risk', 16, 'How aware are you of ESG compliance risks (e.g., human rights violations, deforestation, non-compliance with regulations)?', 'Very aware; I maintain compliance registers aligned to EU Deforestation Regulation and CSDDD.', 'Somewhat aware; risks reviewed annually.', 'Limited awareness.', 'No awareness.', '• Proactive Engagement') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Procurement', 'Risk', 17, 'How confident are you managing supplier ESG breaches?', 'Very confident; I oversee corrective actions, legal escalations, and terminations.', 'Somewhat confident; I support compliance teams.', 'Limited confidence.', 'Not confident.', '• Proactive Engagement') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Procurement', 'Risk', 18, 'How integrated are ESG risks in procurement risk registers and controls?', 'Fully integrated; reviewed quarterly with legal and sustainability.', 'Partially integrated in critical categories.', 'Limited integration.', 'Not integrated.', '• Proactive Engagement') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Procurement', 'Risk', 19, 'How prepared are you for regulatory changes (e.g., CSDDD, EU Green Claims Directive)?', 'Fully prepared; policies, training, and supplier guidance in place.', 'Somewhat prepared.', 'Limited preparation.', 'Not prepared.', '• Proactive Engagement') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Procurement', 'Risk', 20, 'How often do you review mitigation plans for supplier ESG risks?', 'Regularly; reviewed and updated quarterly.', 'Occasionally reviewed.', 'Rarely reviewed.', 'Never reviewed.', '• Proactive Engagement') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Procurement', 'Circular Practices', 21, 'How familiar are you with circular procurement practices (e.g., design for reuse, end-of-life recovery)?', 'Very familiar; I integrate ISO 20400 and Ellen MacArthur Foundation principles into processes.', 'Some familiarity; considered in select categories.', 'Limited awareness.', 'No awareness.', '• Continuous Improvement\n• Collaboration Driven') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Procurement', 'Circular Practices', 22, 'Do you prioritize suppliers with strong circular economy capabilities?', 'Always; criteria embedded in supplier selection and evaluations.', 'Often prioritized.', 'Occasionally considered.', 'Never considered.', '• Continuous Improvement\n• Collaboration Driven') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Procurement', 'Circular Practices', 23, 'How confident are you embedding circularity requirements in contracts?', 'Very confident; I draft obligations and monitor compliance.', 'Somewhat confident.', 'Limited confidence.', 'Not confident.', '• Continuous Improvement\n• Collaboration Driven') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Procurement', 'Circular Practices', 24, 'How often do you measure circularity performance in the supply base?', 'Always; metrics tracked and reported annually.', 'Sometimes measured.', 'Rarely measured.', 'Never measured.', '• Continuous Improvement\n• Collaboration Driven') ON CONFLICT (department, question_number) DO NOTHING;

INSERT INTO assessment_questions (department, theme, question_number, question, best_practice, developing, emerging, beginner, linked_skills) VALUES
('Procurement', 'Circular Practices', 25, 'Do you collaborate with suppliers to develop circular solutions?', 'Regularly; I co-create pilots and share learnings.', 'Occasionally collaborate.', 'Rarely collaborate.', 'Never collaborate.', '• Continuous Improvement\n• Collaboration Driven') ON CONFLICT (department, question_number) DO NOTHING;



CREATE INDEX IF NOT EXISTS idx_aq_department ON assessment_questions(department);
CREATE INDEX IF NOT EXISTS idx_aq_theme ON assessment_questions(theme);
CREATE INDEX IF NOT EXISTS idx_ar_company ON assessment_responses(company_id);
CREATE INDEX IF NOT EXISTS idx_ar_question ON assessment_responses(question_id);
CREATE INDEX IF NOT EXISTS idx_cp_user ON company_profiles(user_id);

-- ============================================================
-- FUNCTION 2: fn_calculate_company_gaps
-- ============================================================
-- Prerequisite tables for per-company results
-- ============================================================

-- Per-company skill gap results
CREATE TABLE IF NOT EXISTS company_skill_gaps (
  id                UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  company_id        UUID NOT NULL REFERENCES company_profiles(id) ON DELETE CASCADE,
  department        TEXT NOT NULL,
  skill_family      TEXT NOT NULL,
  green_skill       TEXT NOT NULL,
  theme             TEXT,
  required_level    INT,
  current_level     INT,
  gap               INT,
  severity          TEXT,
  -- optimization factors copied from green_skills for easy querying
  opt_carbon_footprint     NUMERIC(5,2),
  opt_renewable_energy     NUMERIC(5,2),
  opt_hvac                 NUMERIC(5,2),
  opt_office_space         NUMERIC(5,2),
  opt_remote_work          NUMERIC(5,2),
  opt_work_schedule        NUMERIC(5,2),
  opt_water_use            NUMERIC(5,2),
  opt_digital_footprint    NUMERIC(5,2),
  opt_ai_compute           NUMERIC(5,2),
  opt_iot_telemetry        NUMERIC(5,2),
  opt_hardware_circularity NUMERIC(5,2),
  opt_supply_chain_emissions NUMERIC(5,2),
  opt_logistics_shipping   NUMERIC(5,2),
  opt_fleet_electrification NUMERIC(5,2),
  opt_employee_commuting   NUMERIC(5,2),
  opt_material_waste       NUMERIC(5,2),
  -- weighted risk score (gap × avg optimization relevance)
  risk_score        NUMERIC(5,2),
  calculated_at     TIMESTAMPTZ DEFAULT now(),
  UNIQUE(company_id, department, green_skill)
);

-- Per-company department-level summary
CREATE TABLE IF NOT EXISTS company_department_scores (
  id                UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  company_id        UUID NOT NULL REFERENCES company_profiles(id) ON DELETE CASCADE,
  department        TEXT NOT NULL,
  avg_current_level NUMERIC(3,2),
  avg_required_level NUMERIC(3,2),
  avg_gap           NUMERIC(3,2),
  critical_count    INT DEFAULT 0,
  moderate_count    INT DEFAULT 0,
  no_gap_count      INT DEFAULT 0,
  readiness_pct     NUMERIC(5,1),
  risk_score        NUMERIC(5,2),
  priority_level    TEXT,
  calculated_at     TIMESTAMPTZ DEFAULT now(),
  UNIQUE(company_id, department)
);

CREATE INDEX IF NOT EXISTS idx_csg_company ON company_skill_gaps(company_id);
CREATE INDEX IF NOT EXISTS idx_csg_dept ON company_skill_gaps(department);
CREATE INDEX IF NOT EXISTS idx_csg_severity ON company_skill_gaps(severity);
CREATE INDEX IF NOT EXISTS idx_cds_company ON company_department_scores(company_id);

-- ============================================================
-- CORE FUNCTION: fn_calculate_company_gaps
-- ============================================================
-- Reads assessment responses for a company, maps theme averages
-- to skill current_levels, computes gaps/severity, stores results.
--
-- Theme → Skill mapping:
--   Climate Fluency   → Technical skills (3 per dept)
--   Data & AI         → Knowledgeable skills (3 per dept)
--   Decarbonisation   → Values skills (3 per dept)
--   Risk              → 1st Attitudes skill
--   Circular Practices → 2nd + 3rd Attitudes skills
--
-- Usage:
--   const { data } = await supabase.rpc('fn_calculate_company_gaps', {
--     p_company_id: 'uuid-here'
--   });
-- ============================================================

CREATE OR REPLACE FUNCTION fn_calculate_company_gaps(
  p_company_id UUID
)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_dept          RECORD;
  v_theme_avg     RECORD;
  v_skill         RECORD;
  v_current       INT;
  v_gap           INT;
  v_severity      TEXT;
  v_risk          NUMERIC(5,2);
  v_opt_avg       NUMERIC(5,2);
  v_total_skills  INT := 0;
  v_total_gaps    INT := 0;
  v_depts_scored  INT := 0;
  v_attitudes_rank INT;
BEGIN
  -- Validate company
  IF NOT EXISTS (SELECT 1 FROM company_profiles WHERE id = p_company_id) THEN
    RETURN jsonb_build_object('success', false, 'error', 'Company not found');
  END IF;

  -- Check they have responses
  IF NOT EXISTS (SELECT 1 FROM assessment_responses WHERE company_id = p_company_id) THEN
    RETURN jsonb_build_object('success', false, 'error', 'No assessment responses found');
  END IF;

  -- Clear previous results for this company
  DELETE FROM company_skill_gaps WHERE company_id = p_company_id;
  DELETE FROM company_department_scores WHERE company_id = p_company_id;

  -- For each department that has assessment responses...
  FOR v_dept IN
    SELECT DISTINCT aq.department
    FROM assessment_responses ar
    JOIN assessment_questions aq ON aq.id = ar.question_id
    WHERE ar.company_id = p_company_id
  LOOP
    v_depts_scored := v_depts_scored + 1;

    -- For each skill in this department, calculate current_level from theme average
    -- Reset attitudes counter per department
    v_attitudes_rank := 0;

    FOR v_skill IN
      SELECT gs.department, gs.skill_family, gs.green_skill, gs.theme,
             gs.required_level, gs.description,
             gs.opt_carbon_footprint, gs.opt_renewable_energy, gs.opt_hvac,
             gs.opt_office_space, gs.opt_remote_work, gs.opt_work_schedule,
             gs.opt_water_use, gs.opt_digital_footprint, gs.opt_ai_compute,
             gs.opt_iot_telemetry, gs.opt_hardware_circularity,
             gs.opt_supply_chain_emissions, gs.opt_logistics_shipping,
             gs.opt_fleet_electrification, gs.opt_employee_commuting,
             gs.opt_material_waste
      FROM green_skills gs
      WHERE gs.department = v_dept.department
      ORDER BY
        CASE gs.skill_family
          WHEN 'Technical' THEN 1
          WHEN 'Knowledgeable' THEN 2
          WHEN 'Values' THEN 3
          WHEN 'Attitudes' THEN 4
        END,
        gs.id
    LOOP
      -- Map skill_family to assessment theme for lookup
      -- Technical → Climate Fluency
      -- Knowledgeable → Data & AI
      -- Values → Decarbonisation
      -- Attitudes → Risk (1st) or Circular Practices (2nd, 3rd)
      IF v_skill.skill_family = 'Attitudes' THEN
        v_attitudes_rank := v_attitudes_rank + 1;
      END IF;

      -- Get the average score for the mapped theme
      SELECT ROUND(AVG(ar.score))::INT INTO v_current
      FROM assessment_responses ar
      JOIN assessment_questions aq ON aq.id = ar.question_id
      WHERE ar.company_id = p_company_id
        AND aq.department = v_dept.department
        AND aq.theme = CASE
          WHEN v_skill.skill_family = 'Technical'     THEN 'Climate Fluency'
          WHEN v_skill.skill_family = 'Knowledgeable'  THEN 'Data & AI'
          WHEN v_skill.skill_family = 'Values'         THEN 'Decarbonisation'
          WHEN v_skill.skill_family = 'Attitudes' AND v_attitudes_rank = 1 THEN 'Risk'
          WHEN v_skill.skill_family = 'Attitudes' AND v_attitudes_rank > 1 THEN 'Circular Practices'
        END;

      -- Default to 1 if no responses for this theme
      v_current := COALESCE(v_current, 1);
      -- Clamp to 1-4
      v_current := GREATEST(1, LEAST(4, v_current));

      -- Calculate gap
      v_gap := v_skill.required_level - v_current;

      -- Determine severity
      v_severity := CASE
        WHEN v_gap >= 2 THEN 'Critical'
        WHEN v_gap = 1  THEN 'Moderate'
        ELSE 'No Gap'
      END;

      -- Calculate risk_score = gap × average optimization factor relevance
      v_opt_avg := (
        COALESCE(v_skill.opt_carbon_footprint, 0) +
        COALESCE(v_skill.opt_renewable_energy, 0) +
        COALESCE(v_skill.opt_hvac, 0) +
        COALESCE(v_skill.opt_office_space, 0) +
        COALESCE(v_skill.opt_remote_work, 0) +
        COALESCE(v_skill.opt_work_schedule, 0) +
        COALESCE(v_skill.opt_water_use, 0) +
        COALESCE(v_skill.opt_digital_footprint, 0) +
        COALESCE(v_skill.opt_ai_compute, 0) +
        COALESCE(v_skill.opt_iot_telemetry, 0) +
        COALESCE(v_skill.opt_hardware_circularity, 0) +
        COALESCE(v_skill.opt_supply_chain_emissions, 0) +
        COALESCE(v_skill.opt_logistics_shipping, 0) +
        COALESCE(v_skill.opt_fleet_electrification, 0) +
        COALESCE(v_skill.opt_employee_commuting, 0) +
        COALESCE(v_skill.opt_material_waste, 0)
      ) / 16.0;

      v_risk := ROUND(GREATEST(v_gap, 0) * v_opt_avg, 2);

      -- Insert skill gap result
      INSERT INTO company_skill_gaps (
        company_id, department, skill_family, green_skill, theme,
        required_level, current_level, gap, severity,
        opt_carbon_footprint, opt_renewable_energy, opt_hvac,
        opt_office_space, opt_remote_work, opt_work_schedule,
        opt_water_use, opt_digital_footprint, opt_ai_compute,
        opt_iot_telemetry, opt_hardware_circularity,
        opt_supply_chain_emissions, opt_logistics_shipping,
        opt_fleet_electrification, opt_employee_commuting,
        opt_material_waste, risk_score
      ) VALUES (
        p_company_id, v_skill.department, v_skill.skill_family,
        v_skill.green_skill, v_skill.theme,
        v_skill.required_level, v_current, v_gap, v_severity,
        v_skill.opt_carbon_footprint, v_skill.opt_renewable_energy, v_skill.opt_hvac,
        v_skill.opt_office_space, v_skill.opt_remote_work, v_skill.opt_work_schedule,
        v_skill.opt_water_use, v_skill.opt_digital_footprint, v_skill.opt_ai_compute,
        v_skill.opt_iot_telemetry, v_skill.opt_hardware_circularity,
        v_skill.opt_supply_chain_emissions, v_skill.opt_logistics_shipping,
        v_skill.opt_fleet_electrification, v_skill.opt_employee_commuting,
        v_skill.opt_material_waste, v_risk
      )
      ON CONFLICT (company_id, department, green_skill)
      DO UPDATE SET
        current_level = v_current,
        gap = v_gap,
        severity = v_severity,
        risk_score = v_risk,
        calculated_at = now();

      v_total_skills := v_total_skills + 1;
      IF v_gap > 0 THEN v_total_gaps := v_total_gaps + 1; END IF;
    END LOOP; -- end skills loop

    -- Now compute department-level summary for this dept
    INSERT INTO company_department_scores (
      company_id, department,
      avg_current_level, avg_required_level, avg_gap,
      critical_count, moderate_count, no_gap_count,
      readiness_pct, risk_score, priority_level
    )
    SELECT
      p_company_id,
      csg.department,
      ROUND(AVG(csg.current_level)::numeric, 2),
      ROUND(AVG(csg.required_level)::numeric, 2),
      ROUND(AVG(GREATEST(csg.gap, 0))::numeric, 2),
      COUNT(*) FILTER (WHERE csg.severity = 'Critical'),
      COUNT(*) FILTER (WHERE csg.severity = 'Moderate'),
      COUNT(*) FILTER (WHERE csg.severity = 'No Gap'),
      ROUND(
        (COUNT(*) FILTER (WHERE csg.severity = 'No Gap'))::numeric
        / NULLIF(COUNT(*), 0) * 100, 1
      ),
      ROUND(AVG(csg.risk_score), 2),
      CASE
        WHEN COUNT(*) FILTER (WHERE csg.severity = 'Critical') >= 4 THEN 'Critical'
        WHEN COUNT(*) FILTER (WHERE csg.severity = 'Critical') >= 2 THEN 'High'
        WHEN COUNT(*) FILTER (WHERE csg.severity = 'Moderate') >= 3 THEN 'Medium'
        ELSE 'Low'
      END
    FROM company_skill_gaps csg
    WHERE csg.company_id = p_company_id
      AND csg.department = v_dept.department
    GROUP BY csg.department
    ON CONFLICT (company_id, department)
    DO UPDATE SET
      avg_current_level = EXCLUDED.avg_current_level,
      avg_required_level = EXCLUDED.avg_required_level,
      avg_gap = EXCLUDED.avg_gap,
      critical_count = EXCLUDED.critical_count,
      moderate_count = EXCLUDED.moderate_count,
      no_gap_count = EXCLUDED.no_gap_count,
      readiness_pct = EXCLUDED.readiness_pct,
      risk_score = EXCLUDED.risk_score,
      priority_level = EXCLUDED.priority_level,
      calculated_at = now();

  END LOOP; -- end dept loop

  RETURN jsonb_build_object(
    'success', true,
    'company_id', p_company_id,
    'departments_scored', v_depts_scored,
    'total_skills_scored', v_total_skills,
    'total_gaps_found', v_total_gaps
  );
END;
$$;


-- ============================================================
-- FUNCTION 1: fn_submit_assessment
-- ============================================================
-- Called when a user submits assessment answers.
-- Accepts a company_id and a JSON array of {question_id, score} pairs.
-- Upserts into assessment_responses (idempotent — safe to call multiple times).
--
-- Frontend usage:
--   const { data, error } = await supabase.rpc('fn_submit_assessment', {
--     p_company_id: 'uuid-here',
--     p_responses: [
--       { question_id: 1, score: 3 },
--       { question_id: 2, score: 2 },
--       ...
--     ]
--   });
-- ============================================================

CREATE OR REPLACE FUNCTION fn_submit_assessment(
  p_company_id UUID,
  p_responses  JSONB  -- array of { "question_id": int, "score": int }
)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_item       JSONB;
  v_qid        INT;
  v_score      INT;
  v_count      INT := 0;
  v_errors     INT := 0;
BEGIN
  -- Validate company exists
  IF NOT EXISTS (SELECT 1 FROM company_profiles WHERE id = p_company_id) THEN
    RETURN jsonb_build_object(
      'success', false,
      'error', 'Company not found: ' || p_company_id::text
    );
  END IF;

  -- Loop through each response and upsert
  FOR v_item IN SELECT * FROM jsonb_array_elements(p_responses)
  LOOP
    v_qid   := (v_item ->> 'question_id')::INT;
    v_score := (v_item ->> 'score')::INT;

    -- Validate score range
    IF v_score < 1 OR v_score > 4 THEN
      v_errors := v_errors + 1;
      CONTINUE;
    END IF;

    -- Validate question exists
    IF NOT EXISTS (SELECT 1 FROM assessment_questions WHERE id = v_qid) THEN
      v_errors := v_errors + 1;
      CONTINUE;
    END IF;

    -- Upsert response
    INSERT INTO assessment_responses (company_id, question_id, score, answered_at)
    VALUES (p_company_id, v_qid, v_score, now())
    ON CONFLICT (company_id, question_id)
    DO UPDATE SET score = v_score, answered_at = now();

    v_count := v_count + 1;
  END LOOP;

  RETURN jsonb_build_object(
    'success', true,
    'responses_saved', v_count,
    'errors_skipped', v_errors,
    'company_id', p_company_id
  );
END;
$$;

-- ============================================================
-- HELPER: fn_create_company
-- ============================================================
-- Creates a company profile and returns the ID.
-- Frontend calls this first during onboarding.
--
-- Usage:
--   const { data } = await supabase.rpc('fn_create_company', {
--     p_user_id: session.user.id,
--     p_company_name: 'Acme Corp',
--     p_industry: 'Manufacturing',
--     p_company_size: '500-1000',
--     p_location: 'London, UK'
--   });
-- ============================================================

CREATE OR REPLACE FUNCTION fn_create_company(
  p_user_id      UUID,
  p_company_name TEXT,
  p_industry     TEXT DEFAULT NULL,
  p_company_size TEXT DEFAULT NULL,
  p_location     TEXT DEFAULT NULL
)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_company_id UUID;
BEGIN
  INSERT INTO company_profiles (user_id, company_name, industry, company_size, location)
  VALUES (p_user_id, p_company_name, p_industry, p_company_size, p_location)
  RETURNING id INTO v_company_id;

  RETURN jsonb_build_object(
    'success', true,
    'company_id', v_company_id,
    'company_name', p_company_name
  );
END;
$$;

-- ============================================================
-- HELPER: fn_get_assessment_questions
-- ============================================================
-- Returns questions for a specific department (or all).
-- Frontend calls this to render the assessment form.
--
-- Usage:
--   const { data } = await supabase.rpc('fn_get_assessment_questions', {
--     p_department: 'Operations'
--   });
-- ============================================================

CREATE OR REPLACE FUNCTION fn_get_assessment_questions(
  p_department TEXT DEFAULT NULL
)
RETURNS JSONB
LANGUAGE plpgsql
STABLE
AS $$
BEGIN
  RETURN (
    SELECT jsonb_agg(
      jsonb_build_object(
        'id', aq.id,
        'department', aq.department,
        'theme', aq.theme,
        'question_number', aq.question_number,
        'question', aq.question,
        'options', jsonb_build_object(
          '4', aq.best_practice,
          '3', aq.developing,
          '2', aq.emerging,
          '1', aq.beginner
        ),
        'linked_skills', aq.linked_skills
      )
      ORDER BY aq.department, aq.question_number
    )
    FROM assessment_questions aq
    WHERE (p_department IS NULL OR aq.department = p_department)
  );
END;
$$;


-- ============================================================
-- FUNCTION 3: fn_get_risk_priority
-- ============================================================
-- Returns a ranked list of skill gaps for a company, ordered by
-- risk_score (gap × optimization impact). This answers:
-- "Which gaps should we close FIRST for maximum impact?"
--
-- Usage:
--   const { data } = await supabase.rpc('fn_get_risk_priority', {
--     p_company_id: 'uuid-here'
--   });
--
-- Optional filters:
--   p_department: filter to one department
--   p_severity: 'Critical', 'Moderate', or NULL for all
--   p_limit: how many to return (default 20)
-- ============================================================

CREATE OR REPLACE FUNCTION fn_get_risk_priority(
  p_company_id UUID,
  p_department TEXT DEFAULT NULL,
  p_severity   TEXT DEFAULT NULL,
  p_limit      INT  DEFAULT 20
)
RETURNS JSONB
LANGUAGE plpgsql
STABLE
AS $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM company_skill_gaps WHERE company_id = p_company_id) THEN
    RETURN jsonb_build_object(
      'success', false,
      'error', 'No gap data found. Run fn_calculate_company_gaps first.'
    );
  END IF;

  RETURN (
    SELECT jsonb_build_object(
      'success', true,
      'company_id', p_company_id,
      'total_results', COUNT(*),
      'priorities', jsonb_agg(row_data ORDER BY rank_num)
    )
    FROM (
      SELECT
        ROW_NUMBER() OVER (ORDER BY csg.risk_score DESC, csg.gap DESC) AS rank_num,
        jsonb_build_object(
          'rank', ROW_NUMBER() OVER (ORDER BY csg.risk_score DESC, csg.gap DESC),
          'department', csg.department,
          'green_skill', csg.green_skill,
          'skill_family', csg.skill_family,
          'theme', csg.theme,
          'required_level', csg.required_level,
          'current_level', csg.current_level,
          'gap', csg.gap,
          'severity', csg.severity,
          'risk_score', csg.risk_score,
          -- Top 3 optimization factors for this skill (what closing this gap improves)
          'top_impact_factors', (
            SELECT jsonb_agg(factor_pair ORDER BY factor_score DESC)
            FROM (
              SELECT jsonb_build_object('factor', f.factor_name, 'score', f.factor_score) AS factor_pair,
                     f.factor_score
              FROM (VALUES
                ('carbon_footprint', csg.opt_carbon_footprint),
                ('renewable_energy', csg.opt_renewable_energy),
                ('hvac', csg.opt_hvac),
                ('office_space', csg.opt_office_space),
                ('remote_work', csg.opt_remote_work),
                ('work_schedule', csg.opt_work_schedule),
                ('water_use', csg.opt_water_use),
                ('digital_footprint', csg.opt_digital_footprint),
                ('ai_compute', csg.opt_ai_compute),
                ('iot_telemetry', csg.opt_iot_telemetry),
                ('hardware_circularity', csg.opt_hardware_circularity),
                ('supply_chain_emissions', csg.opt_supply_chain_emissions),
                ('logistics_shipping', csg.opt_logistics_shipping),
                ('fleet_electrification', csg.opt_fleet_electrification),
                ('employee_commuting', csg.opt_employee_commuting),
                ('material_waste', csg.opt_material_waste)
              ) AS f(factor_name, factor_score)
              WHERE f.factor_score > 0.3
              ORDER BY f.factor_score DESC
              LIMIT 3
            ) top3
          )
        ) AS row_data
      FROM company_skill_gaps csg
      WHERE csg.company_id = p_company_id
        AND csg.gap > 0
        AND (p_department IS NULL OR csg.department = p_department)
        AND (p_severity IS NULL OR csg.severity = p_severity)
      ORDER BY csg.risk_score DESC, csg.gap DESC
      LIMIT p_limit
    ) ranked
  );
END;
$$;

-- ============================================================
-- FUNCTION 3b: fn_get_department_risk_summary
-- ============================================================
-- Returns department-level risk rankings for a company.
-- Used for the executive overview / heatmap.
--
-- Usage:
--   const { data } = await supabase.rpc('fn_get_department_risk_summary', {
--     p_company_id: 'uuid-here'
--   });
-- ============================================================

CREATE OR REPLACE FUNCTION fn_get_department_risk_summary(
  p_company_id UUID
)
RETURNS JSONB
LANGUAGE plpgsql
STABLE
AS $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM company_department_scores WHERE company_id = p_company_id) THEN
    RETURN jsonb_build_object(
      'success', false,
      'error', 'No department scores found. Run fn_calculate_company_gaps first.'
    );
  END IF;

  RETURN (
    SELECT jsonb_build_object(
      'success', true,
      'company_id', p_company_id,
      'departments', jsonb_agg(
        jsonb_build_object(
          'rank', ROW_NUMBER() OVER (ORDER BY cds.risk_score DESC),
          'department', cds.department,
          'priority_level', cds.priority_level,
          'readiness_pct', cds.readiness_pct,
          'avg_gap', cds.avg_gap,
          'risk_score', cds.risk_score,
          'critical_count', cds.critical_count,
          'moderate_count', cds.moderate_count,
          'no_gap_count', cds.no_gap_count,
          -- Top critical skills in this dept
          'top_critical_skills', (
            SELECT COALESCE(jsonb_agg(
              jsonb_build_object(
                'skill', csg.green_skill,
                'gap', csg.gap,
                'risk_score', csg.risk_score
              ) ORDER BY csg.risk_score DESC
            ), '[]'::jsonb)
            FROM company_skill_gaps csg
            WHERE csg.company_id = p_company_id
              AND csg.department = cds.department
              AND csg.severity = 'Critical'
            LIMIT 5
          ),
          -- Optimization heatmap: which factors this dept impacts most
          'optimization_profile', (
            SELECT jsonb_build_object(
              'carbon_footprint', ROUND(AVG(csg.opt_carbon_footprint), 2),
              'renewable_energy', ROUND(AVG(csg.opt_renewable_energy), 2),
              'digital_footprint', ROUND(AVG(csg.opt_digital_footprint), 2),
              'supply_chain_emissions', ROUND(AVG(csg.opt_supply_chain_emissions), 2),
              'material_waste', ROUND(AVG(csg.opt_material_waste), 2),
              'employee_commuting', ROUND(AVG(csg.opt_employee_commuting), 2)
            )
            FROM company_skill_gaps csg
            WHERE csg.company_id = p_company_id
              AND csg.department = cds.department
          )
        ) ORDER BY cds.risk_score DESC
      )
    )
    FROM company_department_scores cds
    WHERE cds.company_id = p_company_id
  );
END;
$$;

-- ============================================================
-- FUNCTION 3c: fn_get_optimization_impact
-- ============================================================
-- Answers: "Across ALL gaps, which optimization factors are
-- most impacted?" Used for the optimization priority chart.
--
-- Usage:
--   const { data } = await supabase.rpc('fn_get_optimization_impact', {
--     p_company_id: 'uuid-here'
--   });
-- ============================================================

CREATE OR REPLACE FUNCTION fn_get_optimization_impact(
  p_company_id UUID
)
RETURNS JSONB
LANGUAGE plpgsql
STABLE
AS $$
BEGIN
  RETURN (
    SELECT jsonb_build_object(
      'success', true,
      'company_id', p_company_id,
      'factors', jsonb_agg(
        jsonb_build_object(
          'factor', f.factor_name,
          'weighted_impact', f.weighted_impact,
          'avg_relevance', f.avg_relevance,
          'skills_affected', f.skills_affected
        ) ORDER BY f.weighted_impact DESC
      )
    )
    FROM (
      -- For each factor, sum (gap × factor_score) across all gapped skills
      SELECT
        u.factor_name,
        ROUND(SUM(u.gap_val * u.factor_score), 2) AS weighted_impact,
        ROUND(AVG(u.factor_score), 2) AS avg_relevance,
        COUNT(*) AS skills_affected
      FROM (
        SELECT csg.gap AS gap_val, 'carbon_footprint' AS factor_name, csg.opt_carbon_footprint AS factor_score FROM company_skill_gaps csg WHERE csg.company_id = p_company_id AND csg.gap > 0
        UNION ALL
        SELECT csg.gap, 'renewable_energy', csg.opt_renewable_energy FROM company_skill_gaps csg WHERE csg.company_id = p_company_id AND csg.gap > 0
        UNION ALL
        SELECT csg.gap, 'hvac', csg.opt_hvac FROM company_skill_gaps csg WHERE csg.company_id = p_company_id AND csg.gap > 0
        UNION ALL
        SELECT csg.gap, 'office_space', csg.opt_office_space FROM company_skill_gaps csg WHERE csg.company_id = p_company_id AND csg.gap > 0
        UNION ALL
        SELECT csg.gap, 'remote_work', csg.opt_remote_work FROM company_skill_gaps csg WHERE csg.company_id = p_company_id AND csg.gap > 0
        UNION ALL
        SELECT csg.gap, 'work_schedule', csg.opt_work_schedule FROM company_skill_gaps csg WHERE csg.company_id = p_company_id AND csg.gap > 0
        UNION ALL
        SELECT csg.gap, 'water_use', csg.opt_water_use FROM company_skill_gaps csg WHERE csg.company_id = p_company_id AND csg.gap > 0
        UNION ALL
        SELECT csg.gap, 'digital_footprint', csg.opt_digital_footprint FROM company_skill_gaps csg WHERE csg.company_id = p_company_id AND csg.gap > 0
        UNION ALL
        SELECT csg.gap, 'ai_compute', csg.opt_ai_compute FROM company_skill_gaps csg WHERE csg.company_id = p_company_id AND csg.gap > 0
        UNION ALL
        SELECT csg.gap, 'iot_telemetry', csg.opt_iot_telemetry FROM company_skill_gaps csg WHERE csg.company_id = p_company_id AND csg.gap > 0
        UNION ALL
        SELECT csg.gap, 'hardware_circularity', csg.opt_hardware_circularity FROM company_skill_gaps csg WHERE csg.company_id = p_company_id AND csg.gap > 0
        UNION ALL
        SELECT csg.gap, 'supply_chain_emissions', csg.opt_supply_chain_emissions FROM company_skill_gaps csg WHERE csg.company_id = p_company_id AND csg.gap > 0
        UNION ALL
        SELECT csg.gap, 'logistics_shipping', csg.opt_logistics_shipping FROM company_skill_gaps csg WHERE csg.company_id = p_company_id AND csg.gap > 0
        UNION ALL
        SELECT csg.gap, 'fleet_electrification', csg.opt_fleet_electrification FROM company_skill_gaps csg WHERE csg.company_id = p_company_id AND csg.gap > 0
        UNION ALL
        SELECT csg.gap, 'employee_commuting', csg.opt_employee_commuting FROM company_skill_gaps csg WHERE csg.company_id = p_company_id AND csg.gap > 0
        UNION ALL
        SELECT csg.gap, 'material_waste', csg.opt_material_waste FROM company_skill_gaps csg WHERE csg.company_id = p_company_id AND csg.gap > 0
      ) u
      WHERE u.factor_score > 0
      GROUP BY u.factor_name
    ) f
  );
END;
$$;


-- ============================================================
-- FUNCTION 4: fn_dashboard_kpis
-- ============================================================
-- Single call that returns ALL dashboard data in one response.
-- Your teammate calls this once on page load to hydrate the
-- entire dashboard: KPI cards, charts, tables, heatmap.
--
-- Usage:
--   const { data } = await supabase.rpc('fn_dashboard_kpis', {
--     p_company_id: 'uuid-here'
--   });
-- ============================================================

CREATE OR REPLACE FUNCTION fn_dashboard_kpis(
  p_company_id UUID
)
RETURNS JSONB
LANGUAGE plpgsql
STABLE
AS $$
DECLARE
  v_result JSONB;
BEGIN
  IF NOT EXISTS (SELECT 1 FROM company_skill_gaps WHERE company_id = p_company_id) THEN
    RETURN jsonb_build_object(
      'success', false,
      'error', 'No gap data found. Run fn_calculate_company_gaps first.'
    );
  END IF;

  SELECT jsonb_build_object(
    'success', true,
    'company_id', p_company_id,

    -- ================================
    -- KPI CARDS (top-level numbers)
    -- ================================
    'kpis', (
      SELECT jsonb_build_object(
        'overall_readiness_pct', ROUND(
          (COUNT(*) FILTER (WHERE severity = 'No Gap'))::numeric
          / NULLIF(COUNT(*), 0) * 100, 1
        ),
        'total_skills', COUNT(*),
        'critical_gaps', COUNT(*) FILTER (WHERE severity = 'Critical'),
        'moderate_gaps', COUNT(*) FILTER (WHERE severity = 'Moderate'),
        'no_gaps', COUNT(*) FILTER (WHERE severity = 'No Gap'),
        'avg_gap', ROUND(AVG(GREATEST(gap, 0))::numeric, 2),
        'avg_risk_score', ROUND(AVG(risk_score)::numeric, 2),
        'departments_assessed', (
          SELECT COUNT(DISTINCT department)
          FROM company_department_scores
          WHERE company_id = p_company_id
        ),
        'highest_risk_department', (
          SELECT department FROM company_department_scores
          WHERE company_id = p_company_id
          ORDER BY risk_score DESC LIMIT 1
        ),
        'most_ready_department', (
          SELECT department FROM company_department_scores
          WHERE company_id = p_company_id
          ORDER BY readiness_pct DESC LIMIT 1
        )
      )
      FROM company_skill_gaps
      WHERE company_id = p_company_id
    ),

    -- ================================
    -- GAP DISTRIBUTION BY SEVERITY
    -- (for pie/donut chart)
    -- ================================
    'gap_distribution', (
      SELECT jsonb_agg(
        jsonb_build_object(
          'severity', severity,
          'count', cnt,
          'pct', ROUND(cnt::numeric / NULLIF(total, 0) * 100, 1)
        )
      )
      FROM (
        SELECT severity, COUNT(*) AS cnt,
               SUM(COUNT(*)) OVER () AS total
        FROM company_skill_gaps
        WHERE company_id = p_company_id
        GROUP BY severity
      ) d
    ),

    -- ================================
    -- GAP DISTRIBUTION BY THEME
    -- (for bar chart)
    -- ================================
    'gaps_by_theme', (
      SELECT jsonb_agg(
        jsonb_build_object(
          'theme', theme,
          'critical', COUNT(*) FILTER (WHERE severity = 'Critical'),
          'moderate', COUNT(*) FILTER (WHERE severity = 'Moderate'),
          'no_gap', COUNT(*) FILTER (WHERE severity = 'No Gap'),
          'avg_gap', ROUND(AVG(GREATEST(gap, 0))::numeric, 2)
        ) ORDER BY AVG(GREATEST(gap, 0)) DESC
      )
      FROM company_skill_gaps
      WHERE company_id = p_company_id
      GROUP BY theme
    ),

    -- ================================
    -- DEPARTMENT HEATMAP DATA
    -- (role-by-theme matrix)
    -- ================================
    'department_heatmap', (
      SELECT jsonb_agg(
        jsonb_build_object(
          'department', department,
          'themes', themes
        ) ORDER BY dept_risk DESC
      )
      FROM (
        SELECT
          csg.department,
          AVG(csg.risk_score) AS dept_risk,
          jsonb_agg(
            jsonb_build_object(
              'theme', csg.theme,
              'avg_gap', ROUND(AVG(GREATEST(csg.gap, 0))::numeric, 2),
              'severity_mode', (
                SELECT s.severity
                FROM company_skill_gaps s
                WHERE s.company_id = p_company_id
                  AND s.department = csg.department
                  AND s.theme = csg.theme
                GROUP BY s.severity
                ORDER BY COUNT(*) DESC
                LIMIT 1
              )
            )
          ) AS themes
        FROM company_skill_gaps csg
        WHERE csg.company_id = p_company_id
        GROUP BY csg.department
      ) hm
    ),

    -- ================================
    -- HIGH-RISK ROLES TABLE
    -- (departments sorted by risk)
    -- ================================
    'high_risk_departments', (
      SELECT jsonb_agg(
        jsonb_build_object(
          'department', cds.department,
          'priority_level', cds.priority_level,
          'readiness_pct', cds.readiness_pct,
          'critical_count', cds.critical_count,
          'moderate_count', cds.moderate_count,
          'avg_gap', cds.avg_gap,
          'risk_score', cds.risk_score
        ) ORDER BY cds.risk_score DESC
      )
      FROM company_department_scores cds
      WHERE cds.company_id = p_company_id
    ),

    -- ================================
    -- TOP 10 PRIORITY GAPS
    -- (action items table)
    -- ================================
    'top_priority_gaps', (
      SELECT jsonb_agg(
        jsonb_build_object(
          'rank', rn,
          'department', department,
          'green_skill', green_skill,
          'skill_family', skill_family,
          'gap', gap,
          'severity', severity,
          'risk_score', risk_score
        )
      )
      FROM (
        SELECT *,
          ROW_NUMBER() OVER (ORDER BY risk_score DESC, gap DESC) AS rn
        FROM company_skill_gaps
        WHERE company_id = p_company_id AND gap > 0
        LIMIT 10
      ) t
    ),

    -- ================================
    -- GAPS BY SKILL FAMILY
    -- (for stacked bar / breakdown)
    -- ================================
    'gaps_by_family', (
      SELECT jsonb_agg(
        jsonb_build_object(
          'skill_family', skill_family,
          'critical', COUNT(*) FILTER (WHERE severity = 'Critical'),
          'moderate', COUNT(*) FILTER (WHERE severity = 'Moderate'),
          'no_gap', COUNT(*) FILTER (WHERE severity = 'No Gap'),
          'avg_risk', ROUND(AVG(risk_score)::numeric, 2)
        ) ORDER BY AVG(risk_score) DESC
      )
      FROM company_skill_gaps
      WHERE company_id = p_company_id
      GROUP BY skill_family
    ),

    -- ================================
    -- OPTIMIZATION FACTOR SUMMARY
    -- (top 5 most impacted factors)
    -- ================================
    'top_optimization_factors', (
      SELECT jsonb_agg(factor_row ORDER BY weighted_impact DESC)
      FROM (
        SELECT jsonb_build_object(
          'factor', factor_name,
          'weighted_impact', weighted_impact
        ) AS factor_row, weighted_impact
        FROM (
          SELECT 'carbon_footprint' AS factor_name, ROUND(SUM(GREATEST(gap,0) * opt_carbon_footprint)::numeric, 2) AS weighted_impact FROM company_skill_gaps WHERE company_id = p_company_id AND gap > 0
          UNION ALL
          SELECT 'supply_chain_emissions', ROUND(SUM(GREATEST(gap,0) * opt_supply_chain_emissions)::numeric, 2) FROM company_skill_gaps WHERE company_id = p_company_id AND gap > 0
          UNION ALL
          SELECT 'material_waste', ROUND(SUM(GREATEST(gap,0) * opt_material_waste)::numeric, 2) FROM company_skill_gaps WHERE company_id = p_company_id AND gap > 0
          UNION ALL
          SELECT 'digital_footprint', ROUND(SUM(GREATEST(gap,0) * opt_digital_footprint)::numeric, 2) FROM company_skill_gaps WHERE company_id = p_company_id AND gap > 0
          UNION ALL
          SELECT 'renewable_energy', ROUND(SUM(GREATEST(gap,0) * opt_renewable_energy)::numeric, 2) FROM company_skill_gaps WHERE company_id = p_company_id AND gap > 0
          UNION ALL
          SELECT 'employee_commuting', ROUND(SUM(GREATEST(gap,0) * opt_employee_commuting)::numeric, 2) FROM company_skill_gaps WHERE company_id = p_company_id AND gap > 0
          UNION ALL
          SELECT 'logistics_shipping', ROUND(SUM(GREATEST(gap,0) * opt_logistics_shipping)::numeric, 2) FROM company_skill_gaps WHERE company_id = p_company_id AND gap > 0
          UNION ALL
          SELECT 'hardware_circularity', ROUND(SUM(GREATEST(gap,0) * opt_hardware_circularity)::numeric, 2) FROM company_skill_gaps WHERE company_id = p_company_id AND gap > 0
          UNION ALL
          SELECT 'fleet_electrification', ROUND(SUM(GREATEST(gap,0) * opt_fleet_electrification)::numeric, 2) FROM company_skill_gaps WHERE company_id = p_company_id AND gap > 0
          UNION ALL
          SELECT 'ai_compute', ROUND(SUM(GREATEST(gap,0) * opt_ai_compute)::numeric, 2) FROM company_skill_gaps WHERE company_id = p_company_id AND gap > 0
          UNION ALL
          SELECT 'hvac', ROUND(SUM(GREATEST(gap,0) * opt_hvac)::numeric, 2) FROM company_skill_gaps WHERE company_id = p_company_id AND gap > 0
          UNION ALL
          SELECT 'water_use', ROUND(SUM(GREATEST(gap,0) * opt_water_use)::numeric, 2) FROM company_skill_gaps WHERE company_id = p_company_id AND gap > 0
          UNION ALL
          SELECT 'remote_work', ROUND(SUM(GREATEST(gap,0) * opt_remote_work)::numeric, 2) FROM company_skill_gaps WHERE company_id = p_company_id AND gap > 0
          UNION ALL
          SELECT 'office_space', ROUND(SUM(GREATEST(gap,0) * opt_office_space)::numeric, 2) FROM company_skill_gaps WHERE company_id = p_company_id AND gap > 0
          UNION ALL
          SELECT 'work_schedule', ROUND(SUM(GREATEST(gap,0) * opt_work_schedule)::numeric, 2) FROM company_skill_gaps WHERE company_id = p_company_id AND gap > 0
          UNION ALL
          SELECT 'iot_telemetry', ROUND(SUM(GREATEST(gap,0) * opt_iot_telemetry)::numeric, 2) FROM company_skill_gaps WHERE company_id = p_company_id AND gap > 0
        ) all_factors
        ORDER BY weighted_impact DESC
        LIMIT 5
      ) top5
    )

  ) INTO v_result;

  RETURN v_result;
END;
$$;

-- ======================== RLS POLICIES (allow public read) ========================
ALTER TABLE departments ENABLE ROW LEVEL SECURITY;
ALTER TABLE department_edges ENABLE ROW LEVEL SECURITY;
ALTER TABLE green_skills ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "departments_public_read" ON departments;
DROP POLICY IF EXISTS "department_edges_public_read" ON department_edges;
DROP POLICY IF EXISTS "green_skills_public_read" ON green_skills;
CREATE POLICY "departments_public_read" ON departments FOR SELECT USING (true);
CREATE POLICY "department_edges_public_read" ON department_edges FOR SELECT USING (true);
CREATE POLICY "green_skills_public_read" ON green_skills FOR SELECT USING (true);
