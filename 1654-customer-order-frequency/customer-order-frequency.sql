# Write your MySQL query statement below
WITH TOTAL AS(
    SELECT 
    *,
    (quantity * price) AS total_price
    FROM Orders
    NATURAL JOIN Product
    WHERE 
    EXTRACT(YEAR_MONTH FROM order_date) = "202006" or 
    EXTRACT(YEAR_MONTH FROM order_date) = "202007"
    GROUP BY customer_id, EXTRACT(YEAR_MONTH FROM order_date)
    HAVING SUM(total_price) >= 100

)
SELECT t.customer_id, name
FROM TOTAL t
LEFT JOIN Customers c
ON t.customer_id = c.customer_id
GROUP BY t.customer_id
HAVING count(t.customer_id) > 1