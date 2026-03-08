/**
 * Generates green_skills INSERT from gsipData.json
 * Run: node scripts/generate-green-skills-seed.js
 * Output: Copy the SQL into supabase-setup.sql or run in Supabase SQL Editor
 */
const fs = require('fs');
const path = require('path');

const data = JSON.parse(
  fs.readFileSync(path.join(__dirname, '../src/data/gsipData.json'), 'utf8')
);

const themeMap = {
  Technical: 'Climate Fluency',
  Knowledgeable: 'Data & AI',
  Values: 'Decarbonisation',
  Attitudes: null, // First = Risk, 2nd+ = Circular Practices
};

const deptMap = { CxO: 'CxO / Executive' };
const skillsMap = data.skills_map || {};

const rows = [];
let attitudesCount = 0;

for (const [dept, skills] of Object.entries(skillsMap)) {
  const dbDept = deptMap[dept] || dept;
  attitudesCount = 0;

  for (const s of skills) {
    const skillFamily = s.green_skill; // Technical, Knowledgeable, Values, Attitudes
    let greenSkill = s.skill_family;
    if (greenSkill === 'Values') {
      if (dept === 'Supply Chain') greenSkill = 'Fair Trade Values';
      else if (dept === 'CxO') greenSkill = 'Stewardship Values';
    }

    let theme = themeMap[skillFamily];
    if (skillFamily === 'Attitudes') {
      attitudesCount++;
      theme = attitudesCount === 1 ? 'Risk' : 'Circular Practices';
    }

    const desc = (s.description || '').replace(/'/g, "''");
    const why = (s.why_it_matters || '').replace(/'/g, "''");
    const ex = (s.example_behaviours || '').replace(/'/g, "''");

    rows.push(
      `('${dbDept}', '${skillFamily}', '${greenSkill.replace(/'/g, "''")}', '${theme}', '${desc}', '${why}', '${ex}', 3)`
    );
  }
}

const sql = `-- Generated green_skills seed (run after table creation)
INSERT INTO green_skills (department, skill_family, green_skill, theme, description, why_it_matters, example_behaviours, required_level) VALUES
${rows.join(',\n')}
ON CONFLICT DO NOTHING;`;

console.log(sql);
fs.writeFileSync(path.join(__dirname, 'green_skills_seed.sql'), sql);
console.log('\n-- Also saved to scripts/green_skills_seed.sql');
