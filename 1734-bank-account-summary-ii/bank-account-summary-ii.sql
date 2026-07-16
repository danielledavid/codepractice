# Write your MySQL query statement below
SELECT name, SUM(amount) AS balance
FROM Users u
NATURAL JOIN Transactions
GROUP BY u.account
HAVING SUM(amount) > 10000