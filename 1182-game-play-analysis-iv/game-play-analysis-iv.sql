# Write your MySQL query statement below
WITH logged AS
(
    SELECT 
    player_id, device_id, event_date, games_played,
    LEAD(event_date) OVER (PARTITION BY player_id) AS logged_date,
    DATEDIFF(LEAD(event_date) OVER (PARTITION BY player_id ORDER BY event_date), event_date) AS difference
    FROM Activity
),
first_day AS(
    SELECT *
    FROM logged
    GROUP BY player_id
    HAVING MIN(event_date)
)
SELECT 
ROUND(
    (SUM(
    CASE WHEN difference = 1 THEN 1 
    ELSE 0 END)/COUNT(DISTINCT player_id))
    , 2) AS fraction
FROM first_day 


