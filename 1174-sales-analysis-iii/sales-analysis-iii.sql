# Write your MySQL query statement below
SELECT 
DISTINCT s.product_id, product_name
FROM SALES s
LEFT JOIN Product p
ON s.product_id = p.product_id
WHERE p.product_id NOT IN (SELECT product_id FROM Sales WHERE sale_date NOT BETWEEN "2019-01-01" AND "2019-03-31")