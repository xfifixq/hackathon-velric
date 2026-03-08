"use client";

import React, { useState, useEffect, Suspense } from "react";
import { useSearchParams } from "next/navigation";
import { Department, GreenSkill } from "@/lib/types";
import {
  fetchDepartments, fetchEdges, fetchAllSkills,
  fetchCompanyDepartmentScores, fetchCompanySkillGaps,
} from "@/lib/queries";
import { computeAvgOpt, OPT_COLUMNS, formatOptLabel, skillsForDept } from "@/lib/utils";
import {
  getTopPrioritySkills, getQuickWins, getComplianceRiskSkills,
  computeSkillRiskScore, computeDeptRiskScore, getMaturityLabel,
} from "@/lib/gapAnalysis";
import gsipData from "@/data/gsipData.json";

export default function ReportPage() {
  return (
    <Suspense fallback={<div className="p-8 text-center">Loading report...</div>}>
      <ReportContent />
    </Suspense>
  );
}

function ReportContent() {
  const searchParams = useSearchParams();
  const companyId = searchParams.get("company_id");
  const companyName = searchParams.get("company") || "Arsenal FC";

  const [departments, setDepartments] = useState<Department[]>([]);
  const [allSkills, setAllSkills] = useState<GreenSkill[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    async function load() {
      try {
        let depts: Department[];
        let skills: GreenSkill[];
        if (companyId) {
          [depts, , skills] = await Promise.all([
            fetchCompanyDepartmentScores(companyId), fetchEdges(), fetchCompanySkillGaps(companyId),
          ]);
        } else {
          [depts, , skills] = await Promise.all([
            fetchDepartments(), fetchEdges(), fetchAllSkills(),
          ]);
        }
        // Enrich dept opt from skills
        const optCols = OPT_COLUMNS;
        const enriched = depts.map(dept => {
          const ds = skills.filter(s => s.department === dept.id || s.department === dept.department);
          if (ds.length === 0) return dept;
          const hasOpt = optCols.some(c => { const v = Number((dept as any)[c]); return !isNaN(v) && v > 0; });
          if (hasOpt) return dept;
          const e = { ...dept };
          for (const col of optCols) {
            const vals = ds.map(s => Number((s as any)[col])).filter(v => !isNaN(v));
            (e as any)[col] = vals.length > 0 ? vals.reduce((a, b) => a + b, 0) / vals.length : 0;
          }
          e.critical_gap_count = ds.filter(s => s.severity?.toLowerCase() === "critical").length;
          e.moderate_gap_count = ds.filter(s => s.severity?.toLowerCase() === "moderate").length;
          e.no_gap_count = ds.filter(s => { const sv = s.severity?.toLowerCase(); return sv === "no gap" || sv === "none" || sv === "healthy"; }).length;
          e.overall_score = ds.length > 0 ? Math.round((e.no_gap_count / ds.length) * 100) : 0;
          return e;
        });
        setDepartments(enriched);
        setAllSkills(skills);
      } catch (err) {
        console.error(err);
      } finally {
        setLoading(false);
      }
    }
    load();
  }, [companyId]);

  if (loading) return <div className="p-12 text-center text-lg">Generating report...</div>;

  // Compute metrics
  const totalSkills = allSkills.length;
  const totalCritical = allSkills.filter(s => s.severity?.toLowerCase() === "critical").length;
  const totalModerate = allSkills.filter(s => s.severity?.toLowerCase() === "moderate").length;
  const totalNoGap = allSkills.filter(s => { const sv = s.severity?.toLowerCase(); return sv === "no gap" || sv === "none" || sv === "healthy"; }).length;
  const readiness = totalSkills > 0 ? Math.round((totalNoGap / totalSkills) * 100) : 0;

  const topPriority = getTopPrioritySkills(allSkills, 10, departments);
  const quickWins = getQuickWins(allSkills, departments);
  const complianceRisks = getComplianceRiskSkills(allSkills);

  // Org-wide opt averages
  const orgOpts = OPT_COLUMNS.map(col => {
    const avg = allSkills.reduce((s, sk) => s + (Number((sk as any)[col]) || 0), 0) / (totalSkills || 1);
    return { col, label: formatOptLabel(col), avg };
  }).sort((a, b) => b.avg - a.avg);

  // Department summaries
  const deptSummaries = departments.map(dept => {
    const ds = skillsForDept(allSkills, dept);
    const critical = ds.filter(s => s.severity?.toLowerCase() === "critical").length;
    const moderate = ds.filter(s => s.severity?.toLowerCase() === "moderate").length;
    const noGap = ds.filter(s => { const sv = s.severity?.toLowerCase(); return sv === "no gap" || sv === "none" || sv === "healthy"; }).length;
    const total = ds.length;
    const r = total > 0 ? Math.round((noGap / total) * 100) : 0;
    const risk = computeDeptRiskScore(dept, allSkills);
    const overview = (gsipData.overview as Record<string, any>)[dept.department] || {};
    return { dept, skills: ds, critical, moderate, noGap, total, readiness: r, risk, overview };
  }).sort((a, b) => b.risk - a.risk);

  // Themes breakdown
  const themes = allSkills.reduce((acc, s) => {
    const t = s.theme || "Other";
    if (!acc[t]) acc[t] = { critical: 0, moderate: 0, noGap: 0 };
    if (s.severity?.toLowerCase() === "critical") acc[t].critical++;
    else if (s.severity?.toLowerCase() === "moderate") acc[t].moderate++;
    else acc[t].noGap++;
    return acc;
  }, {} as Record<string, { critical: number; moderate: number; noGap: number }>);

  const sevColor = (sev: string) => {
    switch (sev?.toLowerCase()) {
      case "critical": return "#ef4444";
      case "moderate": return "#f59e0b";
      default: return "#22c55e";
    }
  };

  const deptColor = (critical: number, moderate: number) =>
    critical > 0 ? "#ef4444" : moderate > 0 ? "#f59e0b" : "#22c55e";

  return (
    <div className="bg-white text-gray-900 min-h-screen print:bg-white">
      {/* Print button */}
      <div className="print:hidden fixed top-4 right-4 z-50 flex gap-2">
        <button
          onClick={() => window.print()}
          className="px-4 py-2 bg-green-600 text-white rounded-lg shadow-lg hover:bg-green-700 transition-colors font-medium"
        >
          Export PDF
        </button>
        <button
          onClick={() => window.history.back()}
          className="px-4 py-2 bg-gray-200 text-gray-700 rounded-lg shadow hover:bg-gray-300 transition-colors"
        >
          Back to Dashboard
        </button>
      </div>

      {/* Cover / Header */}
      <div className="bg-gradient-to-br from-[#0a0a1a] to-[#1a1a3e] text-white px-12 py-16 print:py-12">
        <div className="max-w-4xl mx-auto">
          <div className="flex items-center gap-3 mb-2">
            <div className="w-3 h-3 rounded-full bg-green-500" style={{ boxShadow: "0 0 12px #22c55e" }} />
            <span className="text-sm font-medium text-green-400 tracking-wider uppercase">GreenPulse Audit Report</span>
          </div>
          <h1 className="text-4xl font-bold mb-2 print:text-3xl">{companyName}</h1>
          <p className="text-lg text-white/60">Green Skills Gap Intelligence Report</p>
          <p className="text-sm text-white/40 mt-1">Generated {new Date().toLocaleDateString("en-GB", { day: "numeric", month: "long", year: "numeric" })}</p>

          {/* Hero KPIs */}
          <div className="grid grid-cols-4 gap-4 mt-8">
            <div className="bg-white/10 rounded-xl p-4 text-center backdrop-blur-sm">
              <div className="text-3xl font-bold">{readiness}%</div>
              <div className="text-xs text-white/50 mt-1">Readiness Score</div>
            </div>
            <div className="bg-white/10 rounded-xl p-4 text-center backdrop-blur-sm">
              <div className="text-3xl font-bold text-red-400">{totalCritical}</div>
              <div className="text-xs text-white/50 mt-1">Critical Gaps</div>
            </div>
            <div className="bg-white/10 rounded-xl p-4 text-center backdrop-blur-sm">
              <div className="text-3xl font-bold text-amber-400">{totalModerate}</div>
              <div className="text-xs text-white/50 mt-1">Moderate Gaps</div>
            </div>
            <div className="bg-white/10 rounded-xl p-4 text-center backdrop-blur-sm">
              <div className="text-3xl font-bold text-green-400">{totalNoGap}</div>
              <div className="text-xs text-white/50 mt-1">Skills Ready</div>
            </div>
          </div>
        </div>
      </div>

      <div className="max-w-4xl mx-auto px-12 py-10 space-y-10">

        {/* Executive Summary */}
        <section>
          <h2 className="text-2xl font-bold mb-4 text-gray-900">Executive Summary</h2>
          <div className="bg-gray-50 rounded-xl p-6 border border-gray-200">
            <p className="text-gray-700 leading-relaxed">
              Based on a comprehensive assessment of <strong>{totalSkills} green skills</strong> across{" "}
              <strong>{departments.length} departments</strong>, {companyName} has an overall green skills
              readiness of <strong>{readiness}%</strong>. The audit identified{" "}
              <strong style={{ color: "#ef4444" }}>{totalCritical} critical gaps</strong> requiring immediate
              attention, <strong style={{ color: "#f59e0b" }}>{totalModerate} moderate gaps</strong> with
              development pathways, and <strong style={{ color: "#22c55e" }}>{totalNoGap} skills</strong> at
              or above target maturity.
            </p>
            {totalCritical > totalSkills * 0.3 && (
              <p className="text-red-700 mt-3 font-medium text-sm">
                With {Math.round((totalCritical / totalSkills) * 100)}% of skills at critical gap level,
                urgent intervention is recommended to mitigate regulatory, reputational, and operational risks.
              </p>
            )}
          </div>
        </section>

        {/* Department Network Overview — Static nodes */}
        <section className="break-before-page">
          <h2 className="text-2xl font-bold mb-4">Department Overview</h2>
          <p className="text-gray-500 text-sm mb-6">Each department assessed across 12 green skills. Color indicates gap severity status.</p>

          {/* Static node visualization */}
          <div className="grid grid-cols-5 gap-4 mb-8">
            {deptSummaries.map(({ dept, critical, moderate, noGap, total, readiness: r }) => {
              const color = deptColor(critical, moderate);
              return (
                <div key={dept.id} className="text-center">
                  <div
                    className="w-16 h-16 mx-auto rounded-full flex items-center justify-center text-white font-bold text-sm shadow-lg"
                    style={{ backgroundColor: color, boxShadow: `0 0 20px ${color}44` }}
                  >
                    {r}%
                  </div>
                  <div className="text-xs font-semibold mt-2 text-gray-800">{dept.label}</div>
                  <div className="flex justify-center gap-0.5 mt-1">
                    {total > 0 && (
                      <>
                        {critical > 0 && <div className="h-1 rounded-full bg-red-500" style={{ width: `${(critical / total) * 48}px` }} />}
                        {moderate > 0 && <div className="h-1 rounded-full bg-amber-500" style={{ width: `${(moderate / total) * 48}px` }} />}
                        {noGap > 0 && <div className="h-1 rounded-full bg-green-500" style={{ width: `${(noGap / total) * 48}px` }} />}
                      </>
                    )}
                  </div>
                  <div className="text-[10px] text-gray-400 mt-0.5">
                    {critical > 0 && <span className="text-red-500">{critical}C </span>}
                    {moderate > 0 && <span className="text-amber-500">{moderate}M </span>}
                    {noGap > 0 && <span className="text-green-500">{noGap}R</span>}
                  </div>
                </div>
              );
            })}
          </div>
        </section>

        {/* Department Detail Cards */}
        <section>
          <h2 className="text-2xl font-bold mb-4">Department Analysis</h2>
          <div className="space-y-4">
            {deptSummaries.map(({ dept, skills, critical, moderate, noGap, total, readiness: r, risk, overview }) => (
              <div key={dept.id} className="border border-gray-200 rounded-xl p-5 break-inside-avoid">
                <div className="flex items-start justify-between mb-3">
                  <div className="flex items-center gap-3">
                    <div className="w-10 h-10 rounded-full flex items-center justify-center text-white text-xs font-bold"
                      style={{ backgroundColor: deptColor(critical, moderate) }}>
                      {r}%
                    </div>
                    <div>
                      <h3 className="font-bold text-lg">{dept.label}</h3>
                      {overview.definition && (
                        <p className="text-xs text-gray-500">{overview.definition}</p>
                      )}
                    </div>
                  </div>
                  <div className="text-right">
                    <span className="text-xs px-2 py-1 rounded-full font-medium"
                      style={{ backgroundColor: deptColor(critical, moderate) + "15", color: deptColor(critical, moderate) }}>
                      Risk: {(risk * 100).toFixed(0)}%
                    </span>
                  </div>
                </div>

                {overview.risk_of_not_upskilling && (
                  <div className="bg-red-50 border border-red-100 rounded-lg px-3 py-2 mb-3">
                    <span className="text-xs font-semibold text-red-700">Risk of not upskilling: </span>
                    <span className="text-xs text-red-600">{overview.risk_of_not_upskilling}</span>
                  </div>
                )}

                {/* Skills table */}
                <table className="w-full text-xs border-collapse">
                  <thead>
                    <tr className="border-b border-gray-200">
                      <th className="text-left py-1 text-gray-500 font-medium">Skill</th>
                      <th className="text-left py-1 text-gray-500 font-medium">Family</th>
                      <th className="text-center py-1 text-gray-500 font-medium">Current</th>
                      <th className="text-center py-1 text-gray-500 font-medium">Target</th>
                      <th className="text-center py-1 text-gray-500 font-medium">Gap</th>
                      <th className="text-right py-1 text-gray-500 font-medium">Status</th>
                    </tr>
                  </thead>
                  <tbody>
                    {skills.map(s => (
                      <tr key={s.id} className="border-b border-gray-50">
                        <td className="py-1.5 font-medium text-gray-800">{s.green_skill}</td>
                        <td className="py-1.5 text-gray-500">{s.skill_family}</td>
                        <td className="py-1.5 text-center text-gray-600">{s.current_level}</td>
                        <td className="py-1.5 text-center text-gray-600">{s.required_level}</td>
                        <td className="py-1.5 text-center font-mono font-medium" style={{ color: sevColor(s.severity) }}>
                          {s.gap > 0 ? `-${s.gap}` : "0"}
                        </td>
                        <td className="py-1.5 text-right">
                          <span className="px-1.5 py-0.5 rounded text-[10px] font-medium"
                            style={{ backgroundColor: sevColor(s.severity) + "15", color: sevColor(s.severity) }}>
                            {s.severity}
                          </span>
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            ))}
          </div>
        </section>

        {/* Optimization Factors */}
        <section className="break-before-page">
          <h2 className="text-2xl font-bold mb-4">Sustainability Optimization Factors</h2>
          <p className="text-gray-500 text-sm mb-4">Organisation-wide impact scores showing which sustainability levers are most significant.</p>
          <div className="grid grid-cols-2 gap-3">
            {orgOpts.map(({ label, avg }) => (
              <div key={label} className="flex items-center gap-3 px-3 py-2 bg-gray-50 rounded-lg">
                <div className="flex-1 min-w-0">
                  <div className="text-xs font-medium text-gray-700">{label}</div>
                  <div className="h-2 bg-gray-200 rounded-full mt-1 overflow-hidden">
                    <div className="h-full rounded-full transition-all"
                      style={{ width: `${avg * 100}%`, backgroundColor: avg >= 0.4 ? "#22c55e" : avg >= 0.2 ? "#f59e0b" : "#ef4444" }} />
                  </div>
                </div>
                <span className="text-sm font-bold font-mono" style={{ color: avg >= 0.4 ? "#22c55e" : avg >= 0.2 ? "#f59e0b" : "#ef4444" }}>
                  {(avg * 100).toFixed(0)}%
                </span>
              </div>
            ))}
          </div>
        </section>

        {/* Priority Actions */}
        <section className="break-before-page">
          <h2 className="text-2xl font-bold mb-4">Top Priority Actions</h2>
          <p className="text-gray-500 text-sm mb-4">Ranked by risk score — combining gap severity, sustainability impact, and priority level.</p>
          <div className="space-y-2">
            {topPriority.map(({ skill, riskScore }, i) => (
              <div key={skill.id} className="flex items-center gap-3 px-4 py-3 bg-gray-50 rounded-lg border border-gray-100">
                <span className="text-lg font-bold text-gray-300 w-6">#{i + 1}</span>
                <div className="w-2 h-2 rounded-full flex-shrink-0" style={{ backgroundColor: sevColor(skill.severity) }} />
                <div className="flex-1 min-w-0">
                  <div className="font-medium text-sm text-gray-800">{skill.green_skill}</div>
                  <div className="flex gap-2 text-[10px] text-gray-500 mt-0.5">
                    <span>{skill.department}</span>
                    <span>{skill.skill_family}</span>
                    <span>{getMaturityLabel(skill.current_level)} &rarr; {getMaturityLabel(skill.required_level)}</span>
                  </div>
                </div>
                <span className="text-sm font-bold font-mono" style={{ color: riskScore >= 0.5 ? "#ef4444" : "#f59e0b" }}>
                  {(riskScore * 100).toFixed(0)}%
                </span>
              </div>
            ))}
          </div>
        </section>

        {/* Quick Wins */}
        {quickWins.length > 0 && (
          <section>
            <h2 className="text-2xl font-bold mb-4">Quick Wins</h2>
            <p className="text-gray-500 text-sm mb-4">Moderate gaps with high optimization impact — easiest to close with significant sustainability benefit.</p>
            <div className="grid grid-cols-1 gap-2">
              {quickWins.map((skill) => (
                <div key={skill.id} className="flex items-center gap-3 px-4 py-3 bg-amber-50 rounded-lg border border-amber-100">
                  <div className="w-2 h-2 rounded-full bg-amber-500 flex-shrink-0" />
                  <div className="flex-1 min-w-0">
                    <div className="font-medium text-sm text-gray-800">{skill.green_skill}</div>
                    <div className="text-[10px] text-gray-500">{skill.department} / {skill.theme}</div>
                  </div>
                  <span className="text-xs text-amber-600 font-medium">Gap: {skill.gap}</span>
                </div>
              ))}
            </div>
          </section>
        )}

        {/* Compliance Risks */}
        {complianceRisks.length > 0 && (
          <section>
            <h2 className="text-2xl font-bold mb-4">Compliance Risk Flags</h2>
            <p className="text-gray-500 text-sm mb-4">Critical gaps in regulatory-linked themes requiring urgent attention.</p>
            <div className="grid grid-cols-1 gap-2">
              {complianceRisks.map((skill) => (
                <div key={skill.id} className="flex items-center gap-3 px-4 py-3 bg-red-50 rounded-lg border border-red-100">
                  <div className="w-2 h-2 rounded-full bg-red-500 flex-shrink-0" />
                  <div className="flex-1 min-w-0">
                    <div className="font-medium text-sm text-gray-800">{skill.green_skill}</div>
                    <div className="text-[10px] text-gray-500">{skill.department} / {skill.theme}</div>
                  </div>
                  <span className="text-xs text-red-600 font-medium">Risk: {(computeSkillRiskScore(skill) * 100).toFixed(0)}%</span>
                </div>
              ))}
            </div>
          </section>
        )}

        {/* Theme Breakdown */}
        <section>
          <h2 className="text-2xl font-bold mb-4">Gap Analysis by Theme</h2>
          <div className="grid grid-cols-1 gap-3">
            {Object.entries(themes).map(([theme, counts]) => {
              const total = counts.critical + counts.moderate + counts.noGap;
              return (
                <div key={theme} className="bg-gray-50 rounded-lg p-4 border border-gray-100">
                  <div className="flex items-center justify-between mb-2">
                    <span className="font-semibold text-sm">{theme}</span>
                    <div className="flex gap-3 text-xs">
                      {counts.critical > 0 && <span className="text-red-500 font-medium">{counts.critical} Critical</span>}
                      {counts.moderate > 0 && <span className="text-amber-500 font-medium">{counts.moderate} Moderate</span>}
                      <span className="text-green-500 font-medium">{counts.noGap} Ready</span>
                    </div>
                  </div>
                  <div className="flex h-3 rounded-full overflow-hidden">
                    {total > 0 && (
                      <>
                        <div className="bg-red-500" style={{ width: `${(counts.critical / total) * 100}%` }} />
                        <div className="bg-amber-500" style={{ width: `${(counts.moderate / total) * 100}%` }} />
                        <div className="bg-green-500" style={{ width: `${(counts.noGap / total) * 100}%` }} />
                      </>
                    )}
                  </div>
                </div>
              );
            })}
          </div>
        </section>

        {/* CTA / Next Steps */}
        <section className="break-before-page">
          <div className="bg-gradient-to-br from-[#0a0a1a] to-[#1a1a3e] text-white rounded-2xl p-8">
            <h2 className="text-2xl font-bold mb-3">Recommended Next Steps</h2>
            <div className="space-y-3 text-white/80 text-sm">
              <div className="flex gap-3">
                <span className="w-6 h-6 rounded-full bg-red-500/20 text-red-400 flex items-center justify-center text-xs font-bold flex-shrink-0">1</span>
                <div><strong>Address Critical Gaps</strong> — {totalCritical} skills require immediate upskilling intervention. Focus on departments with highest risk scores first.</div>
              </div>
              <div className="flex gap-3">
                <span className="w-6 h-6 rounded-full bg-amber-500/20 text-amber-400 flex items-center justify-center text-xs font-bold flex-shrink-0">2</span>
                <div><strong>Capture Quick Wins</strong> — {quickWins.length} moderate gaps with high sustainability impact can be closed with targeted learning programmes.</div>
              </div>
              <div className="flex gap-3">
                <span className="w-6 h-6 rounded-full bg-green-500/20 text-green-400 flex items-center justify-center text-xs font-bold flex-shrink-0">3</span>
                <div><strong>Full Assessment</strong> — Deploy the complete GreenPulse assessment across all {departments.length} departments to validate and refine these findings with your teams.</div>
              </div>
              <div className="flex gap-3">
                <span className="w-6 h-6 rounded-full bg-blue-500/20 text-blue-400 flex items-center justify-center text-xs font-bold flex-shrink-0">4</span>
                <div><strong>Build Learning Pathways</strong> — Map each critical skill to structured training programmes using the maturity model framework.</div>
              </div>
            </div>
            <div className="mt-6 pt-4 border-t border-white/10 text-xs text-white/40">
              This report was generated using GreenPulse — Green Skills Gap Intelligence Platform.
              Data sourced from publicly available information and the GSIP Green Skills Framework.
            </div>
          </div>
        </section>

      </div>

      {/* Print styles */}
      <style jsx global>{`
        @media print {
          body { -webkit-print-color-adjust: exact; print-color-adjust: exact; }
          .break-before-page { break-before: page; }
          .break-inside-avoid { break-inside: avoid; }
          @page { margin: 0.5in; size: A4; }
        }
      `}</style>
    </div>
  );
}
