# Write your MySQL query statement below
WITH counted AS(
    SELECT COUNT(user_id) as counts
    FROM Users
)
SELECT contest_id,
ROUND((COUNT(user_id) / counts) * 100,2) AS percentage
FROM Register
CROSS JOIN counted

GROUP BY contest_id
ORDER BY percentage DESC, contest_id
