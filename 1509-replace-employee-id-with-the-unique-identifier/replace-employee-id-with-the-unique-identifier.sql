# Write your MySQL query statement below
SELECT unique_id, name
FROM EmployeeUNI u
right JOIN Employees e
ON e.id = u.id
GROUP BY e.id