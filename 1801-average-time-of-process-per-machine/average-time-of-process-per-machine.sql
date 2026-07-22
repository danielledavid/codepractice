# Write your MySQL query statement below
WITH PROCESSED AS(
SELECT machine_id, (MAX(timestamp) - MIN(timestamp)) AS processing_time
FROM Activity
GROUP BY machine_id, process_id)
SELECT machine_id, round(AVG(processing_time),3) AS processing_time
FROM PROCESSED
GROUP BY machine_id