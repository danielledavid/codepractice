# Write your MySQL query statement below
SELECT activity_date AS day, count(DISTINCT(user_id)) AS active_users
FROM Activity
GROUP BY activity_date
HAVING count(user_id) >= 1
AND activity_date >= "2019-06-28"
AND activity_date <= "2019-07-27"