# Write your MySQL query statement below
WITH filtered AS(
    SELECT product_id
    FROM SALES
    WHERE sale_date < "2019-01-01" OR sale_date > "2019-03-31"
)

SELECT product_id, product_name
FROM Product
WHERE product_id NOT IN (SELECT product_id FROM filtered)
AND product_id IN(SELECT product_id from SALES)