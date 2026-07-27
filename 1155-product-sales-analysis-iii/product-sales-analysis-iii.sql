# Write your MySQL query statement below
WITH FIRST AS(
    SELECT product_id, MIN(year) AS first_year
    FROM Sales
    GROUP BY product_id
)
SELECT s.product_id, first_year, s.quantity, s.price
FROM Sales s
RIGHT JOIN FIRST f
ON s.year = f.first_year
AND s.product_id = f.product_id
