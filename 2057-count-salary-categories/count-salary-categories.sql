# Write your MySQL query statement below
WITH CATEGORIZED AS(
SELECT CASE WHEN
income < 20000 THEN "Low Salary"
WHEN income >= 20000 and income <= 50000 THEN "Average Salary"
ELSE "High Salary" END AS category
FROM Accounts),

SALARIES AS(
SELECT 
"Low Salary" AS category
UNION
SELECT "Average Salary"
UNION
SELECT "High Salary"
)

SELECT s.category, COUNT(c.category) AS accounts_count
FROM SALARIES s
LEFT JOIN CATEGORIZED c
ON s.category = c.category
GROUP BY s.category