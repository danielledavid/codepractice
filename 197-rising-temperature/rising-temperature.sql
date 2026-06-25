# Write your MySQL query statement below
WITH yesterday_date AS(
    SELECT id,
    DATE_SUB(recordDate, INTERVAL 1 DAY) AS previous_day,
    temperature
    FROM Weather 
)
SELECT y.id
FROM yesterday_date y
LEFT JOIN Weather w
ON y.previous_day = w.recordDate
WHERE y.temperature > w.temperature