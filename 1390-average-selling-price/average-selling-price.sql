# Write your MySQL query statement below
WITH priced AS(
    SELECT p.product_id, price, units
    FROM Prices p
    LEFT JOIN UnitsSold u
    ON p.product_id = u.product_id
    AND purchase_date BETWEEN start_date AND end_date
)
SELECT 
product_id,
COALESCE((ROUND((SUM(units * price) / SUM(units)),2)),0) AS average_price
FROM priced
group by product_id