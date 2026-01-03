# Write your MySQL query statement below
WITH paid AS(
    SELECT *, ROUND(AVG(activity_duration),2) AS paid_avg_duration
    FROM UserActivity
    WHERE activity_type = "paid"
    GROUP BY user_id
)
SELECT u.user_id, ROUND(AVG(u.activity_duration),2) AS trial_avg_duration, paid_avg_duration
FROM UserActivity u
RIGHT JOIN paid p ON 
u.user_id = p.user_id
WHERE u.activity_type = "free_trial"
GROUP BY u.user_id

