# Write your MySQL query statement below
WITH SUMMED AS(
    SELECT *, SUM(amount) AS summed,
    AVG(amount) AS averaged
    FROM Customer
    GROUP BY visited_on
),
LAGGED_DATE AS(
    SELECT *,
    LAG(visited_on, 6) OVER(ordeR by visited_on) AS LAGGED,
    ROUND((SUM(summed) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)),2) 
AS amt,
ROUND(sum(summed) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) / 7,2)
AS average_amount
FROM SUMMED
)

SELECT 
visited_on, amt AS amount, average_amount
FROM LAGGED_DATE
WHERE LAGGED IS NOT NULL