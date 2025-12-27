# Write your MySQL query statement below
WITH ranked AS(
    SELECT *,
    rank() OVER(ORDER BY gold_medals DESC, silver_medals DESC, bronze_medals DESC, country) AS ranked
    FROM Olympic
    group by country
)

SELECT country, gold_medals, silver_medals, bronze_medals  FROM ranked
ORDER BY RANKED