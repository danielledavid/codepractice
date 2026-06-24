# Write your MySQL query statement below
WITH ranked AS(
SELECT
DENSE_RANK() OVER (ORDER BY salary DESC ) AS ranked_salary, salary
FROM Employee)

SELECT MAX(salary) AS SecondHighestSalary
FROM ranked
WHERE ranked_salary = 2