# Write your MySQL query statement below
WITH product_volume AS(
    SELECT product_id, 
    (Width * Length * Height) AS volume
    FROM Products
)
SELECT name AS warehouse_name, SUM(units * volume) AS volume
FROM Warehouse
NATURAL JOIN product_volume
GROUP BY name