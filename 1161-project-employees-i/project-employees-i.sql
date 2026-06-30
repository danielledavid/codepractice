# Write your MySQL query statement below
SELECT 
p.project_id, ROUND(AVG(experience_years),2) AS average_years
FROM Project p
LEFT JOIN Employee e
ON P.employee_id = e.employee_id
GROUP BY project_id