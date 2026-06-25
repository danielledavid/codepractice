# Write your MySQL query statement below
WITH RANKED AS(
    SELECT e.id, e.name AS Employee, salary AS Salary, e.departmentId, d.name AS Department,
    rank() OVER (PARTITION BY d.name ORDER BY salary DESC) AS RANKED_SALARY
    FROM Employee e
    LEFT JOIN Department d
    ON e.departmentId = d.id
)
SELECT Department, Employee, Salary
FROM Ranked
WHERE RANKED_SALARY = 1