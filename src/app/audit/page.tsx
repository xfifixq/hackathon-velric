"use client";

import React, { useState, useEffect, useMemo, useRef, useCallback, Suspense } from "react";
import { useSearchParams, useRouter } from "next/navigation";
import { motion, AnimatePresence } from "framer-motion";
import { Department, DepartmentEdge, GreenSkill } from "@/lib/types";
import {
  fetchDepartments, fetchAllSkills, fetchEdges,
  fetchCompanyDepartmentScores, fetchCompanySkillGaps,
} from "@/lib/queries";
import { skillsForDept, OPT_COLUMNS, formatOptLabel, computeAvgOpt } from "@/lib/utils";
import {
  getDeptDirectoryData, getDeptAssessments, getAllSectors,
  getDeptSectorPriorities, getDeptSkillsMap, getDeptActions,
  getTopPrioritySkills, getComplianceRiskSkills,
  computeSkillRiskScore, computeDeptRiskScore, getMaturityLabel,
  MATURITY_LEVELS, getPriorityActions,
  type DeptDirectoryData, type ActionEntry, type AssessmentQuestion,
} from "@/lib/gapAnalysis";
import NetworkGraph from "@/components/NetworkGraph";

export default function AuditPage() {
  return (
    <Suspense fallback={
      <div className="min-h-screen flex items-center justify-center bg-[#0a0a1a]">
        <div className="text-white/60 text-sm animate-pulse">Loading audit...</div>
      </div>
    }>
      <AuditContent />
    </Suspense>
  );
}

/* ─── Severity color helper ─── */
function sevColor(sev?: string): string {
  const s = sev?.toLowerCase();
  if (s === "critical") return "#ef4444";
  if (s === "moderate") return "#f59e0b";
  return "#22c55e";
}
function sevBg(sev?: string): string {
  const s = sev?.toLowerCase();
  if (s === "critical") return "bg-red-500/15 border-red-500/20 text-red-400";
  if (s === "moderate") return "bg-amber-500/15 border-amber-500/20 text-amber-400";
  return "bg-green-500/15 border-green-500/20 text-green-400";
}

function AuditContent() {
  const searchParams = useSearchParams();
  const router = useRouter();
  const companyId = searchParams.get("company_id");
  const companyName = searchParams.get("company") || "Arsenal FC";

  const [departments, setDepartments] = useState<Department[]>([]);
  const [edges, setEdges] = useState<DepartmentEdge[]>([]);
  const [allSkills, setAllSkills] = useState<GreenSkill[]>([]);
  const [loading, setLoading] = useState(true);
  const [selectedDept, setSelectedDept] = useState<Department | null>(null);
  const [selectedSkill, setSelectedSkill] = useState<GreenSkill | null>(null);
  const [expandedActions, setExpandedActions] = useState<Set<number>>(new Set());

  const detailRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    async function load() {
      try {
        let depts: Department[];
        let edgesData: DepartmentEdge[];
        let skills: GreenSkill[];
        if (companyId) {
          [depts, edgesData, skills] = await Promise.all([
            fetchCompanyDepartmentScores(companyId), fetchEdges(), fetchCompanySkillGaps(companyId),
          ]);
        } else {
          [depts, edgesData, skills] = await Promise.all([
            fetchDepartments(), fetchEdges(), fetchAllSkills(),
          ]);
        }
        // Enrich dept opt from skills
        const enriched = depts.map(dept => {
          const ds = skills.filter(s => s.department === dept.id || s.department === dept.department);
          if (ds.length === 0) return dept;
          const hasOpt = OPT_COLUMNS.some(c => { const v = Number((dept as any)[c]); return !isNaN(v) && v > 0; });
          if (hasOpt) return dept;
          const e = { ...dept };
          for (const col of OPT_COLUMNS) {
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
        setEdges(edgesData);
        setAllSkills(skills);
      } catch {
        setDepartments([]);
        setEdges([]);
        setAllSkills([]);
      } finally {
        setLoading(false);
      }
    }
    load();
  }, [companyId]);

  // Org-wide stats
  const orgStats = useMemo(() => {
    const total = allSkills.length;
    const crit = allSkills.filter(s => s.severity?.toLowerCase() === "critical").length;
    const mod = allSkills.filter(s => s.severity?.toLowerCase() === "moderate").length;
    const ready = allSkills.filter(s => { const sv = s.severity?.toLowerCase(); return sv === "no gap" || sv === "none" || sv === "healthy"; }).length;
    const readiness = total > 0 ? Math.round((ready / total) * 100) : 0;
    return { total, crit, mod, ready, readiness };
  }, [allSkills]);

  // Current dept skills
  const deptSkills = useMemo(() => {
    if (!selectedDept) return [];
    return skillsForDept(allSkills, selectedDept);
  }, [selectedDept, allSkills]);

  // Dept directory data
  const deptDir = useMemo(() => {
    if (!selectedDept) return null;
    return getDeptDirectoryData(selectedDept.label || selectedDept.department);
  }, [selectedDept]);

  // Dept actions
  const deptActions = useMemo(() => {
    if (!selectedDept) return [];
    return getDeptActions(selectedDept.label || selectedDept.department);
  }, [selectedDept]);

  // Dept assessments
  const deptAssessments = useMemo(() => {
    if (!selectedDept) return [];
    return getDeptAssessments(selectedDept.label || selectedDept.department);
  }, [selectedDept]);

  // Priority actions
  const priorityActions = useMemo(() => {
    if (!selectedDept) return [];
    return getPriorityActions(selectedDept, deptSkills);
  }, [selectedDept, deptSkills]);

  // Sector priorities for dept
  const sectorPriorities = useMemo(() => {
    if (!selectedDept) return {};
    return getDeptSectorPriorities(selectedDept.label || selectedDept.department);
  }, [selectedDept]);

  // Org-wide data
  const topRisks = useMemo(() => getTopPrioritySkills(allSkills, 5, departments), [allSkills, departments]);
  const complianceRisks = useMemo(() => getComplianceRiskSkills(allSkills), [allSkills]);

  // Handle dept click from NetworkGraph
  const handleNodeClick = useCallback((dept: Department) => {
    setSelectedDept(dept);
    setSelectedSkill(null);
    setExpandedActions(new Set());
    // Scroll to detail after a tick
    setTimeout(() => {
      detailRef.current?.scrollIntoView({ behavior: "smooth", block: "start" });
    }, 100);
  }, []);

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-[#0a0a1a]">
        <div className="text-center">
          <div className="w-12 h-12 border-2 border-white/20 border-t-white/80 rounded-full animate-spin mx-auto mb-4" />
          <p className="text-white/40 text-sm">Preparing your audit...</p>
        </div>
      </div>
    );
  }

  return (
    <div className="h-screen flex flex-col bg-[#0a0a1a] text-white overflow-hidden">
      {/* ─── Header ─── */}
      <header className="flex-shrink-0 z-50 bg-[#0a0a1a]/95 backdrop-blur-md border-b border-white/5">
        <div className="max-w-7xl mx-auto px-6 py-4 flex items-center justify-between">
          <div className="flex items-center gap-4">
            {/* Back to dashboard */}
            <button onClick={() => router.push("/")} className="flex items-center gap-1.5 text-white/40 hover:text-white/70 transition-colors text-sm" title="Back to Dashboard">
              <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 19l-7-7 7-7" /></svg>
              Dashboard
            </button>
            <div className="h-6 w-px bg-white/10" />
            <span className="text-white/80 font-semibold text-lg tracking-tight">GreenPulse</span>
            <h1 className="text-white font-bold text-lg">{companyName}</h1>
            <span className="text-[10px] px-2 py-0.5 rounded bg-white/5 text-white/40 uppercase tracking-wider">Green Skills Audit</span>
          </div>
          <div className="flex items-center gap-4 text-sm">
            <div className="flex items-center gap-2">
              <div className="w-2 h-2 rounded-full" style={{ backgroundColor: orgStats.readiness >= 50 ? "#22c55e" : orgStats.readiness >= 25 ? "#f59e0b" : "#ef4444" }} />
              <span className="text-white/60">{orgStats.readiness}% Ready</span>
            </div>
            <span className="text-white/20">|</span>
            <span className="text-white/40">{departments.length} departments</span>
            <span className="text-white/20">|</span>
            <span className="text-white/40">{orgStats.total} skills assessed</span>
          </div>
        </div>
      </header>

      <div className="flex-1 min-h-0 overflow-y-auto">
      {/* ─── Hero + KPIs ─── */}
      <div className="max-w-7xl mx-auto px-6 pt-8 pb-4">
        <h2 className="text-3xl font-bold mb-2 bg-gradient-to-r from-white to-white/60 bg-clip-text text-transparent">
          Green Skills Gap Audit
        </h2>
        <p className="text-white/40 text-sm max-w-2xl mb-6">
          Comprehensive assessment of {companyName}&apos;s green skills readiness across {departments.length} departments
          and {orgStats.total} individual skill competencies. Click any department node to explore.
        </p>

        <div className="grid grid-cols-4 gap-4 mb-6">
          <KPICard label="Readiness Score" value={`${orgStats.readiness}%`} color={orgStats.readiness >= 50 ? "#22c55e" : orgStats.readiness >= 25 ? "#f59e0b" : "#ef4444"} />
          <KPICard label="Critical Gaps" value={`${orgStats.crit}`} color="#ef4444" sub={`${orgStats.total > 0 ? Math.round((orgStats.crit / orgStats.total) * 100) : 0}% of skills`} />
          <KPICard label="Moderate Gaps" value={`${orgStats.mod}`} color="#f59e0b" sub={`${orgStats.total > 0 ? Math.round((orgStats.mod / orgStats.total) * 100) : 0}% of skills`} />
          <KPICard label="Skills Ready" value={`${orgStats.ready}`} color="#22c55e" sub={`${orgStats.total > 0 ? Math.round((orgStats.ready / orgStats.total) * 100) : 0}% of skills`} />
        </div>

        {/* Gap Distribution Bar */}
        <div className="mb-2">
          <div className="flex items-center gap-3 mb-1.5 text-xs text-white/40">
            <span>Organisation Gap Distribution</span>
          </div>
          <div className="flex h-3 rounded-full overflow-hidden bg-white/5">
            {orgStats.total > 0 && (
              <>
                <div className="bg-red-500 transition-all" style={{ width: `${(orgStats.crit / orgStats.total) * 100}%` }} />
                <div className="bg-amber-500 transition-all" style={{ width: `${(orgStats.mod / orgStats.total) * 100}%` }} />
                <div className="bg-green-500 transition-all" style={{ width: `${(orgStats.ready / orgStats.total) * 100}%` }} />
              </>
            )}
          </div>
        </div>
      </div>

      {/* ─── Interactive Network Graph ─── */}
      <div className="relative bg-[#0a0a1a] border-y border-white/5" style={{ height: "60vh", minHeight: 450 }}>
        {/* Selected dept indicator */}
        {selectedDept && (
          <div className="absolute top-4 left-6 z-10 flex items-center gap-2 bg-[#0a0a1a]/90 backdrop-blur-sm px-3 py-2 rounded-lg border border-white/10">
            <div className="w-3 h-3 rounded-full" style={{ backgroundColor: sevColor(selectedDept.gap_severity) }} />
            <span className="text-white text-sm font-medium">{selectedDept.label || selectedDept.department}</span>
            <button onClick={() => { setSelectedDept(null); setSelectedSkill(null); }} className="text-white/30 hover:text-white/70 ml-2 text-xs">Clear</button>
          </div>
        )}
        <NetworkGraph
          departments={departments}
          edges={edges}
          allSkills={allSkills}
          onNodeClick={handleNodeClick}
        />
      </div>

      {/* ─── Detail section (appears below graph on dept select) ─── */}
      <div ref={detailRef}>
        <AnimatePresence mode="wait">
          {selectedDept && !selectedSkill && (
            <motion.div key={`dept-${selectedDept.id}`} initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} exit={{ opacity: 0, y: -20 }} transition={{ duration: 0.3 }}>
              <DeptView
                dept={selectedDept}
                skills={deptSkills}
                deptDir={deptDir}
                deptActions={deptActions}
                deptAssessments={deptAssessments}
                priorityActions={priorityActions}
                sectorPriorities={sectorPriorities}
                expandedActions={expandedActions}
                setExpandedActions={setExpandedActions}
                onSelectSkill={(s) => {
                  setSelectedSkill(s);
                  setTimeout(() => detailRef.current?.scrollIntoView({ behavior: "smooth", block: "start" }), 100);
                }}
              />
            </motion.div>
          )}
          {selectedSkill && (
            <motion.div key={`skill-${selectedSkill.id}`} initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} exit={{ opacity: 0, y: -20 }} transition={{ duration: 0.3 }}>
              <SkillView
                skill={selectedSkill}
                dept={selectedDept}
                onBack={() => setSelectedSkill(null)}
              />
            </motion.div>
          )}
        </AnimatePresence>

        {/* Show org-level content when no dept selected */}
        {!selectedDept && (
          <div className="max-w-7xl mx-auto px-6 py-8">
            {/* Top Priority Risks */}
            {topRisks.length > 0 && (
              <div className="mb-10">
                <h3 className="text-lg font-semibold mb-4 text-white/80">Top Priority Risks</h3>
                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-3">
                  {topRisks.map(({ skill, riskScore }, i) => (
                    <div key={i} className="bg-white/[0.03] border border-white/5 rounded-lg p-4">
                      <div className="flex items-start gap-2 mb-2">
                        <div className="w-2 h-2 rounded-full mt-1.5 flex-shrink-0" style={{ backgroundColor: sevColor(skill.severity) }} />
                        <div>
                          <div className="text-white text-sm font-medium">{skill.green_skill}</div>
                          <div className="text-white/30 text-[10px]">{skill.department} &middot; {skill.skill_family}</div>
                        </div>
                      </div>
                      <div className="flex items-center gap-3 text-[10px] mt-2">
                        <span className={`px-1.5 py-0.5 rounded border ${sevBg(skill.severity)}`}>{skill.severity}</span>
                        <span className="text-white/30">Gap: {skill.gap}</span>
                        <span className="text-white/30">Risk: {riskScore.toFixed(2)}</span>
                      </div>
                    </div>
                  ))}
                </div>
              </div>
            )}

            {/* Compliance Risks */}
            {complianceRisks.length > 0 && (
              <div className="mb-10">
                <h3 className="text-lg font-semibold mb-4 text-red-400/80">Compliance Risk Flags</h3>
                <div className="bg-red-500/[0.05] border border-red-500/10 rounded-xl p-5">
                  <div className="grid grid-cols-1 md:grid-cols-2 gap-3">
                    {complianceRisks.slice(0, 8).map((skill, i) => (
                      <div key={i} className="flex items-center gap-2 text-sm">
                        <div className="w-1.5 h-1.5 rounded-full bg-red-500" />
                        <span className="text-red-400/80 font-medium">{skill.green_skill}</span>
                        <span className="text-white/20 text-[10px]">{skill.department}</span>
                      </div>
                    ))}
                  </div>
                </div>
              </div>
            )}

          </div>
        )}
      </div>

      {/* ─── Footer ─── */}
      <footer className="border-t border-white/5 py-6 text-center text-[10px] text-white/20">
        Powered by GreenPulse &middot; Green Skills Intelligence Platform
      </footer>
      </div>
    </div>
  );
}

/* ─── Sector Card ─── */
function SectorCard({ sector }: { sector: ReturnType<typeof getAllSectors>[0] }) {
  const [expanded, setExpanded] = useState(false);
  return (
    <div className="bg-white/[0.03] border border-white/5 rounded-xl overflow-hidden">
      <button onClick={() => setExpanded(!expanded)} className="w-full p-4 text-left hover:bg-white/[0.02] transition-colors">
        <div className="flex items-center gap-2 mb-1">
          <span className="text-lg">{sector.icon}</span>
          <span className="text-white font-semibold text-sm">{sector.sector}</span>
          <span className="ml-auto text-white/20 text-xs">{expanded ? "−" : "+"}</span>
        </div>
        <p className="text-white/30 text-[10px] line-clamp-2">{sector.overview}</p>
      </button>
      <AnimatePresence>
        {expanded && (
          <motion.div initial={{ height: 0, opacity: 0 }} animate={{ height: "auto", opacity: 1 }} exit={{ height: 0, opacity: 0 }} className="overflow-hidden">
            <div className="px-4 pb-4 space-y-3 text-[11px]">
              {sector.stats && <div className="text-blue-400/70 italic">{sector.stats}</div>}
              <div><span className="text-white/30 uppercase text-[9px]">Pain Points</span><p className="text-white/50 mt-0.5">{sector.painPoints}</p></div>
              <div><span className="text-white/30 uppercase text-[9px]">Why Green Skills Matter</span><p className="text-white/50 mt-0.5">{sector.whyGreenSkillsMatter}</p></div>
              <div><span className="text-white/30 uppercase text-[9px]">Key Emerging Roles</span><p className="text-white/50 mt-0.5">{sector.keyRoles}</p></div>
              <div><span className="text-white/30 uppercase text-[9px]">Priority Green Skills</span><p className="text-white/50 mt-0.5">{sector.prioritySkills}</p></div>
              {sector.quickWins && <div><span className="text-white/30 uppercase text-[9px]">Quick Wins</span><p className="text-white/50 mt-0.5">{sector.quickWins}</p></div>}
              {sector.regulatoryHorizon && <div><span className="text-white/30 uppercase text-[9px]">Regulatory Horizon</span><p className="text-white/50 mt-0.5">{sector.regulatoryHorizon}</p></div>}
            </div>
          </motion.div>
        )}
      </AnimatePresence>
    </div>
  );
}

/* ═══════════════════════════════════════════════════════════════════════════
   DEPARTMENT VIEW — Skills as clickable nodes + context
   ═══════════════════════════════════════════════════════════════════════════ */

function DeptView({ dept, skills, deptDir, deptActions, deptAssessments, priorityActions, sectorPriorities, expandedActions, setExpandedActions, onSelectSkill }: {
  dept: Department;
  skills: GreenSkill[];
  deptDir: DeptDirectoryData | null;
  deptActions: ActionEntry[];
  deptAssessments: AssessmentQuestion[];
  priorityActions: ReturnType<typeof getPriorityActions>;
  sectorPriorities: Record<string, string>;
  expandedActions: Set<number>;
  setExpandedActions: (s: Set<number>) => void;
  onSelectSkill: (s: GreenSkill) => void;
}) {
  const label = dept.label || dept.department;
  const crit = skills.filter(s => s.severity?.toLowerCase() === "critical").length;
  const mod = skills.filter(s => s.severity?.toLowerCase() === "moderate").length;
  const noGap = skills.filter(s => { const sv = s.severity?.toLowerCase(); return sv === "no gap" || sv === "none" || sv === "healthy"; }).length;
  const readiness = skills.length > 0 ? Math.round((noGap / skills.length) * 100) : 0;
  const nodeColor = crit > 0 ? "#ef4444" : mod > 0 ? "#f59e0b" : "#22c55e";

  // Group by family
  const families = useMemo(() => {
    const map: Record<string, GreenSkill[]> = {};
    skills.forEach(s => {
      const f = s.skill_family || "Other";
      if (!map[f]) map[f] = [];
      map[f].push(s);
    });
    return Object.entries(map).sort(([a], [b]) => a.localeCompare(b));
  }, [skills]);

  const [activeSection, setActiveSection] = useState<string>("skills");

  return (
    <div className="max-w-7xl mx-auto px-6 py-8 border-t border-white/5">
      {/* Dept header */}
      <div className="flex items-start gap-6 mb-8">
        {/* Node */}
        <div className="relative flex items-center justify-center w-24 h-24 flex-shrink-0">
          <div className="absolute inset-0 rounded-full opacity-25" style={{ backgroundColor: nodeColor, filter: "blur(12px)" }} />
          <div className="relative w-20 h-20 rounded-full flex items-center justify-center border-2" style={{ backgroundColor: nodeColor + "20", borderColor: nodeColor + "60" }}>
            <div className="text-center">
              <span className="text-white font-bold text-2xl block">{readiness}%</span>
              <span className="text-white/40 text-[8px] uppercase">ready</span>
            </div>
          </div>
        </div>

        <div className="flex-1">
          <h2 className="text-2xl font-bold text-white mb-1">{label}</h2>
          {deptDir && <p className="text-white/40 text-sm mb-3 max-w-2xl">{deptDir.definition}</p>}

          <div className="flex items-center gap-4 text-sm mb-3">
            <span className="text-red-400">{crit} Critical</span>
            <span className="text-amber-400">{mod} Moderate</span>
            <span className="text-green-400">{noGap} Ready</span>
            <span className="text-white/30">{skills.length} total</span>
          </div>

          {/* Gap bar */}
          <div className="flex h-2.5 rounded-full overflow-hidden bg-white/5 max-w-md">
            {skills.length > 0 && (
              <>
                <div className="bg-red-500" style={{ width: `${(crit / skills.length) * 100}%` }} />
                <div className="bg-amber-500" style={{ width: `${(mod / skills.length) * 100}%` }} />
                <div className="bg-green-500" style={{ width: `${(noGap / skills.length) * 100}%` }} />
              </>
            )}
          </div>
        </div>

        {/* Scorecard */}
        {deptDir?.scorecard && (
          <div className="flex gap-3 flex-shrink-0">
            <MiniStat label="Target" value={`${(deptDir.scorecard.desiredKnowledge * 100).toFixed(0)}%`} color="white" />
            <MiniStat label="Current" value={`${(deptDir.scorecard.currentCapability * 100).toFixed(0)}%`} color="white" />
            <MiniStat label="Gap" value={`${(deptDir.scorecard.gap * 100).toFixed(0)}%`} color="#ef4444" />
          </div>
        )}
      </div>

      {/* Risk warning */}
      {deptDir?.riskOfNotUpskilling && (
        <div className="bg-red-500/[0.05] border border-red-500/10 rounded-lg p-4 mb-6">
          <div className="text-[9px] uppercase tracking-wider text-red-400/50 mb-1">Risk of Not Upskilling</div>
          <p className="text-red-400/70 text-sm">{deptDir.riskOfNotUpskilling}</p>
        </div>
      )}

      {/* Scorecard themes */}
      {deptDir?.scorecard?.themes && (
        <div className="flex flex-wrap gap-2 mb-6">
          {deptDir.scorecard.themes.split("|").map((theme, i) => (
            <span key={i} className="text-[10px] px-2 py-1 rounded bg-white/5 text-white/40 border border-white/5">{theme.trim()}</span>
          ))}
        </div>
      )}

      {/* Section tabs */}
      <div className="flex gap-1 mb-6 border-b border-white/5 pb-0">
        {[
          { key: "skills", label: "Skills" },
          { key: "actions", label: "Actions" },
          { key: "assessments", label: "Assessment" },
          { key: "sectors", label: "Sector Context" },
        ].map(tab => (
          <button key={tab.key} onClick={() => setActiveSection(tab.key)}
            className={`px-4 py-2.5 text-xs uppercase tracking-wider transition-colors rounded-t-lg ${activeSection === tab.key ? "text-white bg-white/[0.06] border border-white/10 border-b-0" : "text-white/30 hover:text-white/60"}`}>
            {tab.label}
          </button>
        ))}
      </div>

      {/* Skills section */}
      {activeSection === "skills" && (
        <div className="space-y-6">
          {deptDir?.greenSkillsFocus && (
            <div className="bg-white/[0.02] border border-white/5 rounded-lg p-4 mb-4">
              <div className="text-[9px] uppercase tracking-wider text-white/30 mb-1">Green Skills Focus</div>
              <p className="text-white/50 text-sm">{deptDir.greenSkillsFocus}</p>
            </div>
          )}

          {families.map(([family, fSkills]) => (
            <div key={family}>
              <h4 className="text-xs uppercase tracking-wider text-white/30 mb-3 flex items-center gap-2">
                {family}
                <span className="text-white/15">{fSkills.length} skills</span>
              </h4>
              <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-3">
                {fSkills.map(skill => (
                  <button
                    key={skill.id}
                    onClick={() => onSelectSkill(skill)}
                    className="group bg-white/[0.03] hover:bg-white/[0.06] border border-white/5 hover:border-white/15 rounded-xl p-4 text-left transition-all"
                  >
                    <div className="flex items-start gap-3">
                      {/* Mini node */}
                      <div className="relative w-10 h-10 flex-shrink-0">
                        <div className="absolute inset-0 rounded-full opacity-30" style={{ backgroundColor: sevColor(skill.severity), filter: "blur(4px)" }} />
                        <div className="relative w-10 h-10 rounded-full flex items-center justify-center border" style={{ backgroundColor: sevColor(skill.severity) + "20", borderColor: sevColor(skill.severity) + "50" }}>
                          <span className="text-white font-bold text-xs">{skill.gap > 0 ? `-${skill.gap}` : "OK"}</span>
                        </div>
                      </div>
                      <div className="flex-1 min-w-0">
                        <div className="text-white text-sm font-medium truncate">{skill.green_skill}</div>
                        <div className="flex items-center gap-2 mt-1 text-[10px]">
                          <span className={`px-1.5 py-0.5 rounded border ${sevBg(skill.severity)}`}>{skill.severity || "Unknown"}</span>
                          <span className="text-white/25">Lvl {skill.current_level}/{skill.required_level}</span>
                        </div>
                      </div>
                      <svg className="w-4 h-4 text-white/15 group-hover:text-white/40 mt-1 transition-colors" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" /></svg>
                    </div>
                  </button>
                ))}
              </div>
            </div>
          ))}
        </div>
      )}

      {/* Actions section */}
      {activeSection === "actions" && (
        <div className="space-y-3">
          {priorityActions.length > 0 && (
            <div className="mb-6">
              <h4 className="text-xs uppercase tracking-wider text-white/30 mb-3">Priority Actions (by risk score)</h4>
              {priorityActions.slice(0, 8).map((pa, i) => (
                <div key={i} className="bg-white/[0.03] border border-white/5 rounded-lg p-4 mb-2">
                  <div className="flex items-center gap-2 mb-1">
                    <div className="w-2 h-2 rounded-full" style={{ backgroundColor: sevColor(pa.skill.severity) }} />
                    <span className="text-white text-sm font-medium">{pa.skill.green_skill}</span>
                    <span className="ml-auto text-[10px] text-white/25">Risk: {pa.riskScore.toFixed(2)}</span>
                  </div>
                  <p className="text-white/40 text-xs ml-4">{pa.action}</p>
                  {pa.learningPathway.length > 0 && <p className="text-blue-400/50 text-[10px] ml-4 mt-1">{pa.learningPathway.join(" → ")}</p>}
                </div>
              ))}
            </div>
          )}

          <h4 className="text-xs uppercase tracking-wider text-white/30 mb-3">Development Actions (from GSIP)</h4>
          {deptActions.map((action, i) => (
            <div key={i} className="bg-white/[0.03] border border-white/5 rounded-lg overflow-hidden">
              <button onClick={() => {
                const next = new Set(expandedActions);
                if (next.has(i)) next.delete(i); else next.add(i);
                setExpandedActions(next);
              }} className="w-full p-4 text-left hover:bg-white/[0.02] transition-colors flex items-center gap-3">
                <div className="w-2 h-2 rounded-full" style={{ backgroundColor: action.priority === "H" ? "#ef4444" : action.priority === "M" ? "#f59e0b" : "#22c55e" }} />
                <span className="text-white text-sm font-medium flex-1">{action.greenSkill}</span>
                <span className="text-[10px] text-white/20">{action.skillFamily}</span>
                <span className="text-white/20 text-xs">{expandedActions.has(i) ? "−" : "+"}</span>
              </button>
              <AnimatePresence>
                {expandedActions.has(i) && (
                  <motion.div initial={{ height: 0, opacity: 0 }} animate={{ height: "auto", opacity: 1 }} exit={{ height: 0, opacity: 0 }} className="overflow-hidden">
                    <div className="px-4 pb-4 space-y-2 text-[11px] border-t border-white/5 pt-3">
                      <div><span className="text-white/30">Action: </span><span className="text-white/60">{action.action}</span></div>
                      <div><span className="text-white/30">Contribution: </span><span className="text-white/60">{action.contribution}</span></div>
                      <div><span className="text-white/30">Target Maturity: </span><span className="text-white/60">{action.targetMaturity}</span></div>
                      <div><span className="text-white/30">Theme: </span><span className="text-white/60">{action.linkedTheme}</span></div>
                      <div><span className="text-white/30">Priority: </span>
                        <span className={action.priority === "H" ? "text-red-400" : action.priority === "M" ? "text-amber-400" : "text-green-400"}>{action.priority === "H" ? "High" : action.priority === "M" ? "Medium" : "Foundation"}</span>
                      </div>
                    </div>
                  </motion.div>
                )}
              </AnimatePresence>
            </div>
          ))}
        </div>
      )}

      {/* Assessments section */}
      {activeSection === "assessments" && (
        <div className="space-y-3">
          <p className="text-white/30 text-xs mb-4">Self-assessment questions to evaluate green skills maturity. Each scored 1-4 across key sustainability themes.</p>
          {deptAssessments.map((q, i) => (
            <AssessmentCard key={i} question={q} />
          ))}
        </div>
      )}

      {/* Sector context */}
      {activeSection === "sectors" && (
        <div className="space-y-4">
          {Object.keys(sectorPriorities).length > 0 && (
            <div className="bg-white/[0.03] border border-white/5 rounded-xl p-5 mb-4">
              <h4 className="text-xs uppercase tracking-wider text-white/30 mb-3">Sector Priority for {label}</h4>
              <div className="flex flex-wrap gap-3">
                {Object.entries(sectorPriorities).map(([sector, level]) => (
                  <div key={sector} className="flex items-center gap-2 text-sm">
                    <div className="w-2 h-2 rounded-full" style={{ backgroundColor: level === "H" ? "#ef4444" : level === "M" ? "#f59e0b" : "#22c55e" }} />
                    <span className="text-white/60">{sector}</span>
                    <span className="text-[10px] text-white/30">{level === "H" ? "High" : level === "M" ? "Medium" : "Foundation"}</span>
                  </div>
                ))}
              </div>
            </div>
          )}
          {getAllSectors().map((sector, i) => <SectorCard key={i} sector={sector} />)}
        </div>
      )}
    </div>
  );
}

/* ═══════════════════════════════════════════════════════════════════════════
   SKILL VIEW — Full skill detail
   ═══════════════════════════════════════════════════════════════════════════ */

function SkillView({ skill, dept, onBack }: {
  skill: GreenSkill;
  dept: Department | null;
  onBack: () => void;
}) {
  const color = sevColor(skill.severity);
  const optFactors = OPT_COLUMNS.map(col => ({
    label: formatOptLabel(col),
    value: Number((skill as any)[col]) || 0,
  })).filter(f => f.value > 0).sort((a, b) => b.value - a.value);

  const deptLabel = dept?.label || dept?.department || skill.department;
  const actions = getDeptActions(deptLabel).filter(a =>
    a.greenSkill.toLowerCase().includes(skill.green_skill.toLowerCase()) ||
    skill.green_skill.toLowerCase().includes(a.greenSkill.toLowerCase())
  );
  const skillMap = getDeptSkillsMap(deptLabel).find(s =>
    s.greenSkill.toLowerCase() === skill.green_skill.toLowerCase()
  );

  return (
    <div className="max-w-4xl mx-auto px-6 py-8 border-t border-white/5">
      {/* Back */}
      <button onClick={onBack} className="flex items-center gap-2 text-white/40 hover:text-white/70 text-sm mb-6 transition-colors">
        <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 19l-7-7 7-7" /></svg>
        Back to {deptLabel}
      </button>

      {/* Skill header */}
      <div className="flex items-start gap-6 mb-8">
        <div className="relative w-20 h-20 flex-shrink-0">
          <div className="absolute inset-0 rounded-full opacity-30" style={{ backgroundColor: color, filter: "blur(10px)" }} />
          <div className="relative w-20 h-20 rounded-full flex items-center justify-center border-2" style={{ backgroundColor: color + "20", borderColor: color + "50" }}>
            <span className="text-white font-bold text-xl">{skill.gap > 0 ? `-${skill.gap}` : "OK"}</span>
          </div>
        </div>
        <div>
          <h2 className="text-2xl font-bold text-white mb-2">{skill.green_skill}</h2>
          <div className="flex flex-wrap items-center gap-3 text-sm">
            <span className={`px-2 py-0.5 rounded border ${sevBg(skill.severity)}`}>{skill.severity}</span>
            <span className="text-white/30">{skill.skill_family}</span>
            {skill.theme && <span className="text-white/30">{skill.theme}</span>}
            {skill.priority_level && <span className="text-white/30">Priority: {skill.priority_level}</span>}
          </div>
        </div>
      </div>

      {/* Level progress */}
      <div className="bg-white/[0.03] border border-white/5 rounded-xl p-5 mb-6">
        <div className="flex items-center justify-between mb-3">
          <span className="text-white/40 text-xs uppercase tracking-wider">Proficiency Level</span>
          <span className="text-white/60 text-sm">
            {getMaturityLabel(skill.current_level)} &rarr; {getMaturityLabel(skill.required_level)}
          </span>
        </div>
        <div className="flex items-center gap-2">
          {MATURITY_LEVELS.map(ml => {
            const isCurrent = ml.level === skill.current_level;
            const isRequired = ml.level === skill.required_level;
            const isGap = ml.level > skill.current_level && ml.level <= skill.required_level;
            return (
              <div key={ml.level} className="flex-1">
                <div className={`h-3 rounded-full ${isCurrent ? "bg-blue-500" : isGap ? "bg-red-500/40" : isRequired ? "bg-green-500" : "bg-white/10"}`} />
                <div className={`text-[9px] mt-1 text-center ${isCurrent ? "text-blue-400" : isRequired ? "text-green-400" : "text-white/20"}`}>
                  {ml.short}
                </div>
              </div>
            );
          })}
        </div>
        <div className="flex items-center gap-4 mt-2 text-[10px]">
          <span className="text-blue-400">Current: Level {skill.current_level}</span>
          <span className="text-green-400">Required: Level {skill.required_level}</span>
          <span className="text-red-400">Gap: {skill.gap}</span>
        </div>
      </div>

      {/* Description */}
      {skill.description && (
        <div className="mb-6">
          <h4 className="text-xs uppercase tracking-wider text-white/30 mb-2">Description</h4>
          <p className="text-white/60 text-sm leading-relaxed">{skill.description}</p>
        </div>
      )}

      {/* Why it matters */}
      {skill.why_it_matters && (
        <div className="mb-6">
          <h4 className="text-xs uppercase tracking-wider text-white/30 mb-2">Why It Matters</h4>
          <p className="text-white/60 text-sm leading-relaxed">{skill.why_it_matters}</p>
        </div>
      )}

      {/* Example behaviours */}
      {skill.example_behaviours && (
        <div className="mb-6">
          <h4 className="text-xs uppercase tracking-wider text-white/30 mb-2">Example Behaviours</h4>
          <p className="text-white/60 text-sm leading-relaxed">{skill.example_behaviours}</p>
        </div>
      )}

      {/* GSIP enriched info */}
      {skillMap && (
        <div className="bg-white/[0.03] border border-white/5 rounded-xl p-5 mb-6">
          <h4 className="text-xs uppercase tracking-wider text-white/30 mb-3">GSIP Skills Map Context</h4>
          {skillMap.description && <p className="text-white/50 text-sm mb-2">{skillMap.description}</p>}
          {skillMap.whyItMatters && <p className="text-white/40 text-xs mb-2"><span className="text-white/25">Why: </span>{skillMap.whyItMatters}</p>}
          {skillMap.exampleBehaviours && <p className="text-white/40 text-xs"><span className="text-white/25">Examples: </span>{skillMap.exampleBehaviours}</p>}
        </div>
      )}

      {/* Actions */}
      {actions.length > 0 && (
        <div className="mb-6">
          <h4 className="text-xs uppercase tracking-wider text-white/30 mb-3">Recommended Actions</h4>
          {actions.map((a, i) => (
            <div key={i} className="bg-white/[0.03] border border-white/5 rounded-lg p-4 mb-2">
              <p className="text-white/60 text-sm mb-1">{a.action}</p>
              <p className="text-white/30 text-xs">{a.contribution}</p>
              <div className="flex gap-3 mt-2 text-[10px] text-white/25">
                <span>Target: {a.targetMaturity}</span>
                <span>Theme: {a.linkedTheme}</span>
                <span className={a.priority === "H" ? "text-red-400" : a.priority === "M" ? "text-amber-400" : "text-green-400"}>
                  Priority: {a.priority === "H" ? "High" : a.priority === "M" ? "Medium" : "Foundation"}
                </span>
              </div>
            </div>
          ))}
        </div>
      )}

      {/* Sustainability Impact */}
      {optFactors.length > 0 && (
        <div className="mb-6">
          <h4 className="text-xs uppercase tracking-wider text-white/30 mb-3">Sustainability Impact Factors</h4>
          <div className="space-y-2">
            {optFactors.slice(0, 8).map((f, i) => (
              <div key={i} className="flex items-center gap-3">
                <span className="text-white/40 text-xs w-40 truncate">{f.label}</span>
                <div className="flex-1 h-2 bg-white/5 rounded-full overflow-hidden">
                  <div className="h-full rounded-full bg-blue-500/60" style={{ width: `${f.value * 100}%` }} />
                </div>
                <span className="text-white/30 text-[10px] font-mono w-10 text-right">{(f.value * 100).toFixed(0)}%</span>
              </div>
            ))}
          </div>
        </div>
      )}
    </div>
  );
}

/* ─── Small components ─── */

function KPICard({ label, value, color, sub }: { label: string; value: string; color: string; sub?: string }) {
  return (
    <div className="bg-white/[0.03] border border-white/5 rounded-xl p-4">
      <div className="text-[10px] uppercase tracking-wider text-white/30 mb-1">{label}</div>
      <div className="text-2xl font-bold" style={{ color }}>{value}</div>
      {sub && <div className="text-[10px] text-white/25 mt-0.5">{sub}</div>}
    </div>
  );
}

function MiniStat({ label, value, color }: { label: string; value: string; color: string }) {
  return (
    <div className="text-center bg-white/[0.03] border border-white/5 rounded-lg px-4 py-3">
      <div className="text-lg font-bold" style={{ color }}>{value}</div>
      <div className="text-[9px] text-white/30 uppercase">{label}</div>
    </div>
  );
}

function AssessmentCard({ question }: { question: AssessmentQuestion }) {
  const [expanded, setExpanded] = useState(false);
  const scoreColor = question.score >= 4 ? "#22c55e" : question.score >= 3 ? "#3b82f6" : question.score >= 2 ? "#f59e0b" : "#ef4444";
  return (
    <div className="bg-white/[0.03] border border-white/5 rounded-lg overflow-hidden">
      <button onClick={() => setExpanded(!expanded)} className="w-full p-4 text-left hover:bg-white/[0.02] transition-colors">
        <div className="flex items-start gap-3">
          <div className="w-7 h-7 rounded-full flex items-center justify-center flex-shrink-0 text-xs font-bold" style={{ backgroundColor: scoreColor + "20", color: scoreColor }}>
            {question.score}
          </div>
          <div className="flex-1">
            <div className="text-white text-sm">{question.question}</div>
            <div className="text-white/25 text-[10px] mt-0.5">{question.theme}</div>
          </div>
          <span className="text-white/20 text-xs flex-shrink-0">{expanded ? "−" : "+"}</span>
        </div>
      </button>
      <AnimatePresence>
        {expanded && (
          <motion.div initial={{ height: 0, opacity: 0 }} animate={{ height: "auto", opacity: 1 }} exit={{ height: 0, opacity: 0 }} className="overflow-hidden">
            <div className="px-4 pb-4 text-[11px] space-y-1.5 border-t border-white/5 pt-3 ml-10">
              <div className="flex gap-2"><span className="text-green-400/60 w-24 flex-shrink-0">4 — Best</span><span className="text-white/50">{question.bestPractice}</span></div>
              <div className="flex gap-2"><span className="text-blue-400/60 w-24 flex-shrink-0">3 — Developing</span><span className="text-white/50">{question.developing}</span></div>
              <div className="flex gap-2"><span className="text-amber-400/60 w-24 flex-shrink-0">2 — Emerging</span><span className="text-white/50">{question.emerging}</span></div>
              <div className="flex gap-2"><span className="text-red-400/60 w-24 flex-shrink-0">1 — Beginner</span><span className="text-white/50">{question.beginner}</span></div>
              {question.linkedSkills && (
                <div className="text-white/25 mt-1">Linked: {question.linkedSkills}</div>
              )}
            </div>
          </motion.div>
        )}
      </AnimatePresence>
    </div>
  );
}
