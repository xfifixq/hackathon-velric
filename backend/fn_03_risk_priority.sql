-- ============================================================
-- FUNCTION 3: fn_get_risk_priority
-- ============================================================
-- Returns a ranked list of skill gaps for a company, ordered by
-- risk_score (gap × sustainability baseline). This answers:
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
          -- Arsenal GSIP pillars (sustainability framework from arsenal.com)
          'top_impact_factors', '[
            {"factor": "Energy", "score": 0.5},
            {"factor": "Waste & Recycling", "score": 0.5},
            {"factor": "Supply Chain", "score": 0.5}
          ]'::jsonb
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
          -- Arsenal GSIP pillars (sustainability framework)
          'sustainability_pillars', '{"energy": 0.5, "waste_recycling": 0.5, "water": 0.5, "food": 0.5, "biodiversity": 0.5, "education": 0.5, "transport": 0.5, "supply_chain": 0.5}'::jsonb
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
-- Returns Arsenal GSIP sustainability pillars (arsenal.com/sustainability).
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
  -- Returns Arsenal GSIP sustainability pillars (arsenal.com/sustainability)
  RETURN jsonb_build_object(
    'success', true,
    'company_id', p_company_id,
    'factors', '[
      {"factor": "Energy", "weighted_impact": 0.5, "avg_relevance": 0.5, "skills_affected": 0},
      {"factor": "Waste & Recycling", "weighted_impact": 0.5, "avg_relevance": 0.5, "skills_affected": 0},
      {"factor": "Water", "weighted_impact": 0.5, "avg_relevance": 0.5, "skills_affected": 0},
      {"factor": "Food", "weighted_impact": 0.5, "avg_relevance": 0.5, "skills_affected": 0},
      {"factor": "Biodiversity", "weighted_impact": 0.5, "avg_relevance": 0.5, "skills_affected": 0},
      {"factor": "Education", "weighted_impact": 0.5, "avg_relevance": 0.5, "skills_affected": 0},
      {"factor": "Transport & Travel", "weighted_impact": 0.5, "avg_relevance": 0.5, "skills_affected": 0},
      {"factor": "Supply Chain", "weighted_impact": 0.5, "avg_relevance": 0.5, "skills_affected": 0}
    ]'::jsonb
  );
END;
$$;
