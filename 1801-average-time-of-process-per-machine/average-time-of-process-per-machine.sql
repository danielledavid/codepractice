# Write your MySQL query statement below
WITH end_process AS(
    SELECT machine_id, process_id, timestamp
    FROM Activity 
    WHERE activity_type = "end"
),
start_process AS(
    SELECT machine_id, process_id, timestamp
    FROM Activity 
    WHERE activity_type = "start"
)
SELECT 
a.machine_id, ROUND(AVG(e.timestamp - s.timestamp),3) AS processing_time
FROM Activity a
LEFT JOIN end_process e
ON a.machine_id = e.machine_id
AND a.process_id = e.process_id
LEFT JOIN start_process s
ON a.machine_id = s.machine_id
AND a.process_id = s.process_id
GROUP BY machine_id