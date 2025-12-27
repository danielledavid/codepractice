# Write your MySQL query statement below
SELECT a.employee_id
FROM employees a
LEFT JOIN Employees b
ON a.manager_id = b.employee_id
WHERE a.salary < 30000 
and b.employee_id IS NULL  AND a.manager_ID IS NOT NULL
order by a.employee_Id