# Write your MySQL query statement below
WITH LABELED AS(
SELECT 
product_id,
CASE WHEN
EXTRACT(MONTH FROM sale_date) = 01
OR EXTRACT(MONTH FROM sale_date) = 12
OR EXTRACT(MONTH FROM sale_date) = 02
 THEN "Winter"
WHEN
EXTRACT(MONTH FROM sale_date) = 03
OR EXTRACT(MONTH FROM sale_date) = 04
OR EXTRACT(MONTH FROM sale_date) = 05
THEN "Spring"
WHEN
EXTRACT(MONTH FROM sale_date) = 06
OR EXTRACT(MONTH FROM sale_date) = 07
OR EXTRACT(MONTH FROM sale_date) = 08
THEN "Summer"
ELSE
"Fall" END AS "season",

SUM(quantity * price) AS total_revenue,
SUM(quantity) AS total_quantity
FROM sales
GROUP BY product_id, MONTH(sale_date)
),
RANKED AS (
SELECT season, category, SUM(total_quantity) AS total_quantity, SUM(total_revenue) AS total_revenue,
RANK() OVER(PARTITION BY season ORDER BY SUM(total_quantity) DESC, SUM(total_revenue) DESC, category) AS RANKED
FROM LABELED l
LEFT JOIN products p
ON l.product_id = p.product_id
GROUP BY season, category)
SELECT season, category, total_quantity, total_revenue
from ranked
WHERE RANKED = 1
ORDER BY season
