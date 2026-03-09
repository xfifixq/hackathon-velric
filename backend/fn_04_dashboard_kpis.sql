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

    -- Arsenal GSIP sustainability pillars (arsenal.com/sustainability)
    'top_sustainability_pillars', '[
      {"factor": "Energy", "weighted_impact": 0.5},
      {"factor": "Waste & Recycling", "weighted_impact": 0.5},
      {"factor": "Water", "weighted_impact": 0.5},
      {"factor": "Supply Chain", "weighted_impact": 0.5},
      {"factor": "Education", "weighted_impact": 0.5}
    ]'::jsonb

  ) INTO v_result;

  RETURN v_result;
END;
$$;
