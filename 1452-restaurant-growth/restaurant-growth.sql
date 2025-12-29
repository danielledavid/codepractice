# Write your MySQL query statement below
SELECT
visited_on, (
    SELECT SUM(amount)
    FROM Customer AS c2
    WHERE c2.visited_on BETWEEN DATE_SUB(c1.visited_on, INTERVAL 6 DAY) AND c1.visited_on) AS amount, (
    SELECT ROUND(SUM(amount)/7,2)
    FROM Customer AS c2
    WHERE c2.visited_on BETWEEN DATE_SUB(c1.visited_on, INTERVAL 6 DAY) AND c1.visited_on)
    AS average_amount
FROM Customer c1
GROUP BY visited_on
HAVING DATE_SUB(visited_on, INTERVAL 6 DAY) IN (select visited_on FROM Customer)