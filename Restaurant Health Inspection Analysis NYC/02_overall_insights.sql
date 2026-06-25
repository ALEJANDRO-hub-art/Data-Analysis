-- ========================================
-- 02. OVERALL INSIGHTS
-- ========================================

-- Inspections by Borough
SELECT boro, COUNT(*) AS total_inspections
FROM inspection_results
WHERE boro <> 'Not Specified'
GROUP BY boro
ORDER BY total_inspections DESC;

-- Grade distribution across NYC
SELECT grade, COUNT(*) AS grade_distribution
FROM inspection_results
WHERE grade <> 'Inspection pending'
GROUP BY grade
ORDER BY grade_distribution DESC;

-- Most common inspection types
SELECT inspection_type, COUNT(*) AS inspection_type_count
FROM inspection_results
WHERE inspection_type <> 'Inspection pending'
GROUP BY inspection_type
ORDER BY inspection_type_count DESC;
