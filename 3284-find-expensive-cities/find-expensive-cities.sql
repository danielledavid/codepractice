# Write your MySQL query statement below
SELECT city
FROM Listings
GROUP BY city
HAVING 
AVG(price) >= (SELECT AVG(price) FROM listings limit 1)
ORDER BY city