# Write your MySQL query statement below
WITH red AS(
    SELECT s.name as name
    FROM SalesPerson as s
    JOIN Orders as o
    ON s.sales_id = o.sales_id
    JOIN company as c
    ON c.com_id = o.com_id
    WHERE c.name = "RED"
)

SELECT name
FROM SalesPerson as s
WHERE s.name NOT IN (SELECT name FROM red)