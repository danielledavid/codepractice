# Write your MySQL query statement below
SELECT * 
FROM Users
WHERE REGEXP_LIKE(email, '^[A-Za-z0-9_]+@[A-Za-z]+\\.com$')
ORDER BY user_id 