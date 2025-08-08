# Write your MySQL query statement below
WITH managers as (
    SELECT id, salary
    FROM Employee
)
SELECT name as Employee
FROM Employee e
LEFT JOIN managers 
ON e.managerID = managers.id
WHERE
e.salary > managers.salary