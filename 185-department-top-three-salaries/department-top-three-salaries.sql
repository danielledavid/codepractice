# Write your MySQL query statement below
WITH ranked AS(
    SELECT departmentId, name AS Employee, salary,
    DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS ranked_salaries
    FROM Employee
)
SELECT d.name AS Department, Employee, Salary
FROM Department d
LEFT JOIN ranked r
ON d.id = r.departmentId
WHERE ranked_salaries <= 3