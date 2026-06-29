# Write your MySQL query statement below
WITH counted AS(
    SELECT num, COUNT(num) AS count_num
    FROM MyNumbers 
    GROUP BY num
)
SELECT MAX(num) AS num
FROM counted
WHERE count_num = 1