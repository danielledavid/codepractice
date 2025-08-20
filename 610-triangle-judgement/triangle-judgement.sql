# Write your MySQL query statement below
SELECT x, y, z,
CASE WHEN 
(x + y) > z IS TRUE
AND (x + z) > y IS TRUE
AND (y + z) > x IS TRUE
THEN "Yes"
ELSE "No"
END AS "triangle"
FROM Triangle