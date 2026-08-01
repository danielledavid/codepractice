# Write your MySQL query statement below
WITH RANKED AS(
    SELECT *,
    RANK() OVER(PARTITION BY customer_id ORDER BY order_date) AS RANKED,
    CASE WHEN order_date = customer_pref_delivery_date THEN 1
    ELSE 0 END AS type
    FROM Delivery
)
SELECT 
ROUND(SUM(type) / COUNT(*) * 100,2) AS immediate_percentage
FROM RANKED
WHERE RANKED = 1