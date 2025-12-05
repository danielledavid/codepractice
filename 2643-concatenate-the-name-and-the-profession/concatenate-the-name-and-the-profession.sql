# Write your MySQL query statement below
SELECT person_id, CONCAT(name,'(',LEFT(profession,1),')') AS NAME
FROM PERSON
ORDER BY person_id DESC;