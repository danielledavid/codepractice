# Write your MySQL query statement below
WITH DIFF AS(
SELECT MAX(SALARY) AS salary_difference
FROM SALARIES
where department = "Engineering" OR department = "Marketing"
GROUP BY DEPARTMENT
)
SELECT ABS(salary_difference - LEAD(salary_difference) OVER(ORDER BY salary_difference)) AS salary_difference
FROM DIFF
limit 1