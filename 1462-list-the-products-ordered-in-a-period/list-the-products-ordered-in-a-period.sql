# Write your MySQL query statement below
SELECT product_name, SUM(unit) AS unit
FROM Products p

NATURAL JOIN Orders
WHERE order_date BETWEEN '2020-02-01' AND '2020-02-29'

GROUP BY p.product_id
HAVING SUM(unit) >= 100