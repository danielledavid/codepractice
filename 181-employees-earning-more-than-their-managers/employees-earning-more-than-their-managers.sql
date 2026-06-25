# Write your MySQL query statement below
WITH manager_salary AS(
    SELECT id, salary
    FROM Employee
)
SELECT name AS Employee
FROM Employee e
LEFT JOIN manager_salary m
ON e.managerId = m.id
WHERE e.salary > m.salary
