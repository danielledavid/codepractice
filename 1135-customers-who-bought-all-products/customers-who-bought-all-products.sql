# Write your MySQL query statement below
WITH COUNTED AS(
    SELECT COUNT(product_key) as cnt
    FROM Product
)
SELECT customer_id
FROM Customer 
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT * FROM COUNTED)