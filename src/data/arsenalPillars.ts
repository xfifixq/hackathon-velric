import { readinessColor } from "@/lib/utils";

/**
 * Arsenal FC Sustainability Pillars
 * Sourced from Arsenal's public sustainability framework (arsenal.com/sustainability)
 * and their published commitments: Energy, Food, Water, Waste & Recycling,
 * Biodiversity, Education, Transport & Travel, Supply Chain.
 */

export interface ArsenalPillar {
  id: string;
  label: string;
  description: string;
  source: string;
}

export const ARSENAL_GSIP_PILLARS: ArsenalPillar[] = [
  {
    id: "energy",
    label: "Energy",
    description: "Renewable electricity, LED lighting, net zero targets, EV chargers. Emirates Stadium, academy and training facilities powered by renewable electricity.",
    source: "arsenal.com/sustainability-energy",
  },
  {
    id: "waste_recycling",
    label: "Waste & Recycling",
    description: "Matchday waste sorting, IT equipment recycling, kit redistribution, reusable cups. ~12 tonnes of matchday waste sorted for reuse, recycling or energy.",
    source: "arsenal.com/sustainability-waste-recycling",
  },
  {
    id: "water",
    label: "Water",
    description: "Water saving, reuse and irrigation. Recycled water for pitches, underground reservoir at London Colney, water fountains to reduce plastic.",
    source: "arsenal.com/sustainability-water",
  },
  {
    id: "food",
    label: "Food",
    description: "Sustainable catering, food waste reduction, emissions on menus. Food bank collections, food redistribution after postponed games.",
    source: "arsenal.com/sustainability-food",
  },
  {
    id: "biodiversity",
    label: "Biodiversity",
    description: "Wildflower meadows, bees, Arsenal Forest in Kenya, Emirates Garden. Tree planting, habitat creation at training centres.",
    source: "arsenal.com/sustainability-biodiversity",
  },
  {
    id: "education",
    label: "Education",
    description: "Staff sustainability training, school programmes, Green Gooners Cup, Football For Future workshops. Lifelong Learner programme for Academy players.",
    source: "arsenal.com/sustainability-education",
  },
  {
    id: "transport",
    label: "Transport & Travel",
    description: "Fan travel incentives, rail discounts, cycling promotion. Transport and travel emissions reduction as part of SBTi-verified targets.",
    source: "arsenal.com/sustainability",
  },
  {
    id: "supply_chain",
    label: "Supply Chain",
    description: "Supply chain decarbonisation, Scope 3 emissions. Ball Corporation partnership for aluminium cups, sustainable procurement.",
    source: "arsenal.com/sustainability",
  },
];

/** Map skill theme to relevant Arsenal pillars (for sub-node assignment).
 * Order matters when counts are tied: earlier pillars get filled first. */
export const THEME_TO_PILLARS: Record<string, string[]> = {
  Decarbonisation: ["energy", "food", "transport", "supply_chain"],
  "Circular Practices": ["waste_recycling", "water", "supply_chain"],
  "Climate Fluency": ["education", "biodiversity"],
  "Data & AI": ["energy", "supply_chain"],
  Risk: ["education", "supply_chain"],
};

export function getPillarsForTheme(theme: string): string[] {
  return THEME_TO_PILLARS[theme] || ["energy", "education"];
}

export function getPillarById(id: string): ArsenalPillar | undefined {
  return ARSENAL_GSIP_PILLARS.find((p) => p.id === id);
}

/** Arsenal GSIP Blueprint targets (from spreadsheet Executive Summary) */
export const ARSENAL_PILLAR_TARGETS: Record<string, { tco2eImpact?: string; priority: string }> = {
  energy: { tco2eImpact: "~2,100 tCO2e (35% of S1&S2 gap)", priority: "CRITICAL" },
  supply_chain: { tco2eImpact: "~5,200 tCO2e (largest S3 lever)", priority: "CRITICAL" },
  transport: { tco2eImpact: "~1,800 tCO2e", priority: "HIGH" },
  waste_recycling: { tco2eImpact: "~400 tCO2e", priority: "MEDIUM" },
  education: { tco2eImpact: "Reputational + influence lever", priority: "MEDIUM" },
  food: { tco2eImpact: "Part of Supply Chain & Logistics", priority: "MEDIUM" },
  water: { tco2eImpact: "Part of Waste & Circular Economy", priority: "MEDIUM" },
  biodiversity: { tco2eImpact: "Part of Community engagement", priority: "MEDIUM" },
};

/**
 * READINESS CALCULATION (repeatable)
 * ─────────────────────────────────
 * Data: Each skill has current_level, required_level, gap (where gap = required - current).
 *
 * 1. LEAF (skill) % = (current_level / required_level) × 100
 *    If required_level is 0, use 4. current_level = required_level - gap.
 *
 * 2. PILLAR % = average of leaf % under that pillar. PILLAR color = worst leaf (green => all children green).
 *
 * 3. HUB (department) % = average of pillar %. HUB color = worst pillar (green => all children green).
 *
 * Rule: Parent % = avg(children). Parent color = worst child color. A green node cannot have orange children.
 */

/** Returns { pct, color }. Parent % = avg of children, color = worst child (green parent => all children green). */
export function departmentReadinessFromPillars(
  skills: { current_level?: number; required_level?: number; gap?: number; theme?: string }[],
  pillarIds: string[]
): { pct: number; color: string } {
  const assigned = assignSkillsToPillars(skills, pillarIds);
  const pillarPcts: number[] = [];
  pillarIds.forEach((pid) => {
    const pillarSkills = assigned[pid] || [];
    if (pillarSkills.length === 0) return;
    const avg = pillarSkills.reduce((sum, s) => sum + skillReadiness(s), 0) / pillarSkills.length;
    pillarPcts.push(avg);
  });
  if (pillarPcts.length === 0) return { pct: 0, color: readinessColor(0) };
  const avg = pillarPcts.reduce((a, b) => a + b, 0) / pillarPcts.length;
  const minPct = Math.min(...pillarPcts);
  return { pct: Math.round(avg), color: readinessColor(minPct) };
}

/** Compute readiness % for a skill: (current/required)*100 */
export function skillReadiness(s: { current_level?: number; required_level?: number; gap?: number }): number {
  const req = s.required_level ?? 4;
  const curr = req - (s.gap ?? 0);
  return req > 0 ? (curr / req) * 100 : 0;
}

/** Assign skills to pillars (same logic as SkillFamilyGraph) - returns pillarId -> skills */
export function assignSkillsToPillars<T extends { theme?: string }>(
  skills: T[],
  pillarIds: string[]
): Record<string, T[]> {
  const result: Record<string, T[]> = {};
  pillarIds.forEach((id) => { result[id] = []; });
  const counts: Record<string, number> = {};
  pillarIds.forEach((id) => { counts[id] = 0; });

  skills.forEach((s) => {
    const options = getPillarsForTheme(s.theme || "").filter((id) => pillarIds.includes(id));
    const validOptions = options.length > 0 ? options : pillarIds;
    let best = validOptions[0];
    let minCount = counts[best] ?? 0;
    for (const pid of validOptions) {
      const c = counts[pid] ?? 0;
      if (c < minCount) {
        minCount = c;
        best = pid;
      }
    }
    result[best].push(s);
    counts[best] = (counts[best] ?? 0) + 1;
  });

  // Backfill empty pillars
  pillarIds.forEach((emptyId) => {
    if (result[emptyId].length > 0) return;
    for (const s of skills) {
      const options = getPillarsForTheme(s.theme || "").filter((id) => pillarIds.includes(id));
      if (!options.includes(emptyId)) continue;
      const currentPillar = pillarIds.find((pid) => result[pid].includes(s));
      if (!currentPillar || result[currentPillar].length < 2) continue;
      result[currentPillar] = result[currentPillar].filter((x) => x !== s);
      result[emptyId].push(s);
      break;
    }
  });

  return result;
}
