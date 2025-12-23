# Write your MySQL query statement below
WITH SUMall AS(
    SELECT COUNT(*) AS all_users
    from Users
)
SELECT contest_id,
ROUND(count(r.user_id)/all_users * 100,2) AS percentage
FROM REGISTER r
CROSS JOIN SUMall
GROUP BY contest_id
ORDER BY percentage DESC, contest_id