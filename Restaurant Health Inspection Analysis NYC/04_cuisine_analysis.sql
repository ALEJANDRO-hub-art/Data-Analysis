-- ========================================
-- 04. CUISINE ANALYSIS
-- ========================================

-- Compare grades by cuisine
SELECT cuisine_description, grade, COUNT(*) AS grade_count
FROM inspection_results
WHERE cuisine_description IS NOT NULL AND grade <> 'Inspection Pending'
GROUP BY cuisine_description, grade;

-- Top 5 cuisines with lowest average score
SELECT TOP 5 cuisine_description, AVG(score) AS average_score
FROM inspection_results
WHERE cuisine_description IS NOT NULL AND cuisine_description <> ''
GROUP BY cuisine_description
ORDER BY average_score ASC;

-- Cuisines with highest proportion of critical violations
SELECT cuisine_description, COUNT(*) AS critical_violation_count
FROM inspection_results
WHERE critical_flag = 'Critical'
GROUP BY cuisine_description
ORDER BY critical_violation_count DESC;
