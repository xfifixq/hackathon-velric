import { clsx, type ClassValue } from "clsx";
import { twMerge } from "tailwind-merge";
import { ARSENAL_GSIP_PILLARS } from "@/data/arsenalPillars";

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs));
}

/** Arsenal GSIP sustainability pillars (from Arsenal's public framework) — used as sub-nodes */
export const GSIP_PILLARS = ARSENAL_GSIP_PILLARS;

/** Baseline sustainability impact for risk scoring (replaces removed optimisation factors) */
// eslint-disable-next-line @typescript-eslint/no-explicit-any
export function computeAvgOpt(_row?: any): number {
  return 0.5;
}

/** Color based on gap_severity from the DB — this is the source of truth */
export function getSeverityGlowColor(severity: string): string {
  switch (severity?.toLowerCase()) {
    case "critical":
      return "#ef4444";
    case "moderate":
      return "#f59e0b";
    case "healthy":
    case "no gap":
    case "none":
      return "#22c55e";
    default:
      return "#6b7280";
  }
}

/** Color by readiness % — 0–25% red, 25–75% orange, 75–100% green. Every node follows this. */
export function readinessColor(pct: number): string {
  if (pct >= 75) return "#22c55e";
  if (pct >= 25) return "#f59e0b";
  return "#ef4444";
}

/** Color for skill-level severity (legacy — prefer readinessColor with skillReadiness for consistency) */
export function getSkillSeverityColor(severity: string): string {
  switch (severity?.toLowerCase()) {
    case "critical":
      return "#ef4444";
    case "moderate":
      return "#f59e0b";
    case "no gap":
    case "none":
      return "#22c55e";
    default:
      return "#6b7280";
  }
}

/** For backwards compat — maps opt avg to color (used in radar/detail views) */
export function getOptColor(avgOpt: number): string {
  if (avgOpt < 0.2) return "#6b7280";
  if (avgOpt < 0.4) return "#f59e0b";
  return "#22c55e";
}

/** Format pillar id to display label */
export function formatPillarLabel(pillarId: string): string {
  const p = GSIP_PILLARS.find((x) => x.id === pillarId);
  return p?.label || pillarId.replace(/_/g, " ");
}

export function formatScore(val: number | null | undefined): string {
  if (val === null || val === undefined) return "—";
  return (val * 100).toFixed(0) + "%";
}

/** Single source of truth: map a 0-1 opt score to a red/amber/green color */
export function optScoreColor(val: number): string {
  if (val >= 0.4) return "#22c55e";
  if (val >= 0.2) return "#f59e0b";
  return "#ef4444";
}

/** Match skills to a department — tries both dept.id and dept.department */
export function skillsForDept<T extends { department: string }>(
  allSkills: T[],
  dept: { id: string; department: string }
): T[] {
  const byId = allSkills.filter(s => s.department === dept.id);
  if (byId.length > 0) return byId;
  return allSkills.filter(s => s.department === dept.department);
}
