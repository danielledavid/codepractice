# Write your MySQL query statement below
SELECT A.employee_id, A.name, count(B.reports_to) AS reports_count,
ROUND(AVG(B.age),0) AS average_age
FROM Employees A, Employees B
WHERE a.employee_id = b.reports_to
GROUP BY a.employee_id
ORDER BY a.employee_id