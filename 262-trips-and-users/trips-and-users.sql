# Write your MySQL query statement below
SELECT
request_at AS Day, 
ROUND((SUM(left(status,4) = "canc") / COUNT(*)),2) AS 'Cancellation Rate'
FROM Trips t
left join users u
ON CONCAT(u.users_id, u.role) = CONCAT(client_id, 'client')
left join users v
ON CONCAT(v.users_id, v.role) = CONCAT(driver_id, 'driver')
WHERE request_at BETWEEN "2013-10-01" and "2013-10-03"
AND u.banned = "No"
AND v.banned = "No"

GROUP BY request_at
