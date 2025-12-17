# Write your MySQL query statement below
SELECT name, SUM(amount) AS balance
FROM users
NATURAL JOIN Transactions
GROUP BY name
HAVING SUM(amount) > 10000