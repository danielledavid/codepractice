# Write your MySQL query statement below
WITH top_three AS(
    SELECT *, DENSE_RANK() OVER(PARTITION BY departmentId ORDER BY salary desc) AS dr
    FROM Employee
)
SELECT d.name AS Department, t.name AS Employee, salary AS Salary
FROM Department d
LEFT JOIN top_three t
ON d.id = t.departmentId
WHERE dr IN (1,2,3)