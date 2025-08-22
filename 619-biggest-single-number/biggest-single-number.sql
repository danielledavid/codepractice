# Write your MySQL query statement below
WITH highest AS(
SELECT num
FROM MyNumbers
GROUP BY num
HAVING count(num) = 1
ORDER BY num DESC
LIMIT 1)
SELECT
distinct highest.num as num
FROM MyNumbers
LEFT JOIN highest
on highest.num = Mynumbers.num
ORDER BY highest.num desc
LIMIT 1