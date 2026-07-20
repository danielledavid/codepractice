# Write your MySQL query statement below
SELECT e.reports_to AS employee_id, e2.name, count(e.reports_to) as reports_count, ROUNd(AVG(e.age),0) as average_age
FROM Employees e
JOIN employees e2
ON e.reports_to = e2.employee_id
GROUP BY e.reports_to
ORDER BY employee_id