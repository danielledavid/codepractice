WITH ALL_FILTERED AS(
SELECT customer_id,
(SELECT COUNT(product_key) FROM PRODUCT) AS total
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = total
)
SELECT customer_id FROM all_filtered