SELECT first_name, last_name
FROM players
WHERE final_game BETWEEN "2022-01-01" AND "2023-01-01"
ORDER BY first_name ASC, last_name ASC;