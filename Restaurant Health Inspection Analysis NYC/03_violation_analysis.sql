-- ========================================
-- 03. VIOLATION ANALYSIS
-- ========================================

-- Top 10 most frequent violations by violation code
SELECT TOP 10 violation_code, COUNT(*) AS violation_count
FROM inspection_results
WHERE violation_code IS NOT NULL AND violation_code <> ''
GROUP BY violation_code
ORDER BY violation_count DESC;

-- Top 10 most frequent violations by violation description

SELECT TOP 10 violation_description, COUNT(*) AS violation_count
FROM inspection_results
WHERE violation_description IS NOT NULL AND violation_description <> ''
GROUP BY violation_description
ORDER BY violation_count DESC;


-- Critical vs Non-Critical violations
SELECT critical_flag, COUNT(*) AS violation_count
FROM inspection_results
WHERE critical_flag IS NOT NULL AND critical_flag <> '' AND critical_flag <> 'Not Applicable'
GROUP BY critical_flag; 

-- Boroughs with highest rate of critical violations
SELECT boro, COUNT(*) AS critical_violation_count
FROM inspection_results
WHERE critical_flag = 'Critical' and boro <> 'Not Specified'
GROUP BY boro
ORDER BY critical_violation_count DESC;
