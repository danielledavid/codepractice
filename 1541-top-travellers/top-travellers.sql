# Write your MySQL query statement below
SELECT name, 
CASE WHEN sum(distance) > 1 then SUM(distance)
ELSE 0 END AS travelled_distance
FROM Users
LEFT JOIN RIDES
ON USERS.ID = RIDES.USER_ID
GROUP BY USERS.ID
ORDER BY travelled_distance DESC, NAME 