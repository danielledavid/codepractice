# Write your MySQL query statement below
WITH duplicates AS(
SELECT id, email, RANK() OVER (PARTITION BY email ORDER BY id) AS rnk
FROM PERSON)

DELETE FROM Person
WHERE id IN (SELECT id FROM duplicates WHERE rnk > 1)
