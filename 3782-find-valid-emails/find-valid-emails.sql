# Write your MySQL query statement below
SELECT user_id, email 
FROM Users
WHERE email REGEXP '^[A-Z0-9]+@[A-Z]+(\\.com)$'