# Write your MySQL query statement below
SELECT p.product_id, 
CASE WHEN ROUND(SUM(units * price) / SUM(units),2) IS NULL THEN 0 
ELSE
ROUND(SUM(units * price) / SUM(units),2)
END AS average_price
FROM UnitsSold u
RIGHT JOIN Prices p
ON u.product_id = p.product_id
AND purchase_date BETWEEN start_date AND end_date
GROUP BY p.product_id
