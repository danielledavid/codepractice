SELECT first_name, last_name AS "August Celebrants"
FROM players
WHERE birth_month = 8
ORDER BY first_name ASC, last_name ASC;