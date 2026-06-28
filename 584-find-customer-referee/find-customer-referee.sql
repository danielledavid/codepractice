# Write your MySQL query statement below
SELECT name
FROM Customer
WHERE id NOT IN (SELECT id FROM Customer where referee_id = 2)