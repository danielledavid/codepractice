# Write your MySQL query statement below
WITH metals as(
    SELECT symbol AS metal
    FROM Elements
    where type = "Metal"
)
SELECT e.symbol AS nonmetal, metal
FROM Elements e
CROSS JOIN metals
WHERE type = "Nonmetal"
