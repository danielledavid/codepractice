# Write your MySQL query statement below
WITH SAME_2015 AS(
    SELECT tiv_2015 FROM
    Insurance
    GROUP BY tiv_2015
    HAVING COUNT(tiv_2015) > 1
),
UNIQUE_LOCATIONS AS(
    SELECT * FROM 
    Insurance
    GROUP BY CONCAT(lat, " ", lon)
    HAVING COUNT(CONCAT(lat, " ", lon)) = 1
)
SELECT ROUND(SUM(tiv_2016),2) AS tiv_2016
FROM UNIQUE_LOCATIONS
WHERE tiv_2015 IN (SELECT * FROM SAME_2015)
