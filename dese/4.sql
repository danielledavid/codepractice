SELECT city, COUNT(type)
FROM schools
WHERE type = "Public School"
GROUP BY city
ORDER BY COUNT(name) DESC, city ASC
LIMIT 10;