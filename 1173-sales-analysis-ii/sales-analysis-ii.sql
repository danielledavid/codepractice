WITH excluded AS(
    SELECT buyer_id
    FROM Product p
    NATURAL JOIN Sales
    WHERE product_name = "iPhone"
)

SELECT DISTINCT buyer_id
FROM Sales
WHERE buyer_id NOT IN (Select buyer_id FROM excluded)
AND product_id IN (SELECT product_id FROM Product WHERE product_name = "S8")