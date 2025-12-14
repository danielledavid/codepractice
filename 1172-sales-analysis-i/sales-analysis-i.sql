# Write your MySQL query statement below
WITH grouped AS(
    SELECT seller_id, SUM(price) AS total_sales
    FROM sales
    GROUP BY seller_id
),
ranked AS(
SELECT seller_id, 
RANK() OVER(ORDER BY total_sales desc) AS ranked_sellers
FROM grouped)

SELECT seller_id
FROM ranked
WHERE ranked_sellers = 1
