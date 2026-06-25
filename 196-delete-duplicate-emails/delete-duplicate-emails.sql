# Write your MySQL query statement below
WITH duplicates AS(
    SELECT 
    id,
    ROW_NUMBER() OVER (PARTITION BY email ORDER BY id) AS ranked_emails
    FROM Person
)

DELETE FROM Person
WHERE id NOT IN (SELECT id FROM duplicates WHERE ranked_emails = 1)