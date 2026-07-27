# Write your MySQL query statement below
SELECT s.user_id,
CASE WHEN COUNT(action) = 0 THEN 0 ELSE
(round(sum(CASE WHEN action = "confirmed" THEN 1 ELSE 0 END) / count(action),2))
END AS confirmation_rate
FROM Signups s
left JOIN Confirmations c
ON s.user_id = c.user_id
GROUP BY s.user_id