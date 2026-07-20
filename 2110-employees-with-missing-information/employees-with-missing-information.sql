# Write your MySQL query statement below
WITH all_id AS(
    SELECT employee_id 
    FROM Employees
    UNION 
    SELECT employee_id
    FROM Salaries
)
SELECT a.employee_id
FROM all_id a

LEFT JOIN Employees e
ON a.employee_id = e.employee_id
LEFT JOIN Salaries s
ON a.employee_id = s.employee_id
WHERE name IS NULL OR salary IS NULL
ORDER BY a.employee_id