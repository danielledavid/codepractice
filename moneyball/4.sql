SELECT first_name, last_name, salary
FROM players
JOIN salaries ON salaries.player_id = players.id
WHERE year = 2001
ORDER BY salary ASC, first_name DESC, last_name DESC, player_id
LIMIT 50;