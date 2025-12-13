# Write your MySQL query statement below
WITH highest as(
    SELECT *,
    DENSE_RANK() OVER(PARTITION BY departmentId ORDER BY salary DESC) AS dr
    FROM employee
)
select d.name AS department, e.name AS Employee, salary AS salary
FROM Department d
LEFT JOIN highest e
ON d.id = e.departmentId
WHERE dr = 1
