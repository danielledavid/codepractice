# Write your MySQL query statement below
WITH lead_functions AS(
    SELECT
    num,
    LEAD(num) OVER (ORDER BY ID) AS leaded,
    LEAD(num, 2) OVER (ORDER BY id) AS leaded_two
    FROM Logs
)
SELECT DISTINCT num AS ConsecutiveNums
FROM lead_functions 
WHERE num = leaded AND num = leaded_two