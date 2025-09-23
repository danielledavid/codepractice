# Write your MySQL query statement below
SELECT product_id, product_name, description
FROM products
WHERE description COLLATE utf8mb3_bin REGEXP '\\bSN[0-9]{4}-[0-9]{4}\\b'