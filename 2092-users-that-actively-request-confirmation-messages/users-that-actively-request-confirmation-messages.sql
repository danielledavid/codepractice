WITH TABLE_B AS (
SELECT
user_id,time_stamp,
LAG(time_stamp, 1 , 0) OVER (PARTITION BY user_id ORDER BY time_stamp) AS time_stamp_b,
TIMESTAMPDIFF(SECOND, LAG(time_stamp, 1 , 0) OVER (PARTITION BY user_id ORDER BY time_stamp), time_stamp) AS DIFF
FROM Confirmations
)
SELECT DISTINCT user_id FROM 
TABLE_B 
WHERE DIFF <= 86400
