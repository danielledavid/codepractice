# Write your MySQL query statement below
WITH lags AS(
    SELECT id, num, 
    CASE WHEN num = LEAD(num) OVER(ORDER BY id) AND 
    num = LEAD(num, 2) OVER(ORDER BY id)
    THEN TRUE 
    END AS consecutive
    FROM LOGS
)
SELECT DISTINCT num as ConsecutiveNums
FROM lags
WHERE consecutive = true;

