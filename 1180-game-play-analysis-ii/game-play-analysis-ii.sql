# Write your MySQL query statement below
WITH ORDERED AS(
    SELECT *, ROW_NUMBER() OVER (PARTITION BY player_id ORDER BY event_date) AS row_num
    FROM Activity
)
SELECT player_id, device_id
FROM ORDERED
WHERE row_num = 1