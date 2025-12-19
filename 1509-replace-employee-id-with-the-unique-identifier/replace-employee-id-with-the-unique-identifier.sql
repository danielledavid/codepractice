# Write your MySQL query statement below
SELECT unique_id, name 
FROM EmployeeUNI u
RIGHT JOIN Employees e
ON e.id = u.id