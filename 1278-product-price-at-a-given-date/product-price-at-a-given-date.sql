# Write your MySQL query statement below
WITH UPDATED AS(
    SELECT *,
    CASE WHEN change_date <= "2019-08-16" THEN new_price
    ELSE 10 END AS price,
    RANK() OVER (PARTITION BY product_id ORDER BY change_date DESC ) AS ranked
    FROM Products
    WHERE change_date <= "2019-08-16"
    
)
SELECT product_id, price 
FROM updated
WHERE ranked = 1
UNION 
SELECT product_id, 
10 AS price
FROM Products
WHERE product_id NOT IN (SELECT product_id FROM updated)
GROUP BY product_id