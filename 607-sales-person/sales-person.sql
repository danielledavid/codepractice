# Write your MySQL query statement below
SELECT name
FROM SalesPerson s
WHERE sales_id NOT IN (SELECT sales_id FROM Orders  NATURAL JOIN Company WHERE name = "RED")