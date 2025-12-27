# Write your MySQL query statement below
WITH store1 AS(
    SELECT product_id, 'store1' AS store, store1 AS price
    FROM Products
    where store1 is not null
),
store2 AS(
    SELECT product_id, 'store2' AS store, store2 AS price
    FROM Products
    where store2 is not null
),
store3 AS(
    SELECT product_id, 'store3' AS store, store3 AS price
    FROM Products
    where store3 is not null
)
SELECT * FROM store1
UNION ALL SELECT * FROM store2
UNION ALL SELECT * FROM store3
