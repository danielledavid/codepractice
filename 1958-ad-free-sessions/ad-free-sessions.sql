# Write your MySQL query statement below
WITH ADS AS(
SELECT session_id
FROM Playback p
LEFT JOIN Ads a
ON p.customer_id = a.customer_id
WHERE timestamp >= start_time AND timestamp <= end_time
)
SELECT session_id FROM playback
WHERE session_id NOT IN (SELECT * FROM ads)