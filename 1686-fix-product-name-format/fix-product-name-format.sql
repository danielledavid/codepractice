# Write your MySQL query statement below
SELECT lower(trim(product_name)) AS product_name,
DATE_FORMAT(sale_date, "%Y-%m") AS sale_date,
COUNT(lower(trim(product_name))) AS total
FROM Sales
GROUP BY
lower(trim(product_name)), DATE_FORMAT(sale_date, "%Y-%m")
ORDER BY lower(trim(product_name)), sale_date