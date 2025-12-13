# Write your MySQL query statement below
WITH shortest_point AS(
SELECT
x - (LAG(x) OVER(order BY X)) AS shortest
FROM Point
)
SELECT MIN(shortest) AS shortest
from shortest_point