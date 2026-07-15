# Write your MySQL query statement below
Select name, 
CASE WHEN SUM(distance) IS NOT NULL THEN SUM(distance)
ELSE 0
END AS travelled_distance
FROM Rides r
RIGHT JOIN Users u
ON r.user_id = u.id
GROUP BY user_id
ORDER BY travelled_distance DESC, name