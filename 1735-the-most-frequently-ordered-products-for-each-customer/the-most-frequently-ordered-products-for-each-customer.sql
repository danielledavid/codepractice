# Write your MySQL query statement below
WITH grouped AS(
    SELECT customer_id, product_id, COUNT(product_id) AS total_ordered
    FROM Orders
    GROUP BY customer_id, product_id
    ORDER BY customer_id
),
rankings AS(
    SELECT *,
    rank() OVER(PARTITION BY customer_id ORDER BY total_ordered DESC) AS ranked
    FROM grouped
)
SELECT product_id, customer_id, product_name
FROM rankings
NATURAL JOIN Products
WHERE ranked = 1
