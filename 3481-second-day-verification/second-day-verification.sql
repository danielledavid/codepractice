# Write your MySQL query statement below
SELECT distinct user_id
FROM emails e
LEFT JOIN texts t
ON e.email_id = t.email_id
where
DATEDIFF(action_date, signup_date) = 1
AND signup_action = "Verified"
ORDER BY user_id
