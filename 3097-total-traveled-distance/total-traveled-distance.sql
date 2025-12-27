# Write your MySQL query statement below
SELECT u.user_id, name, COALESCE(SUM(distance),0) AS 'traveled distance'
FROM Users u
LEFT JOIN rides r
ON u.user_id = r.user_id
GROUP BY user_id
ORDER BY user_id