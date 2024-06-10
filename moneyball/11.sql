SELECT first_name, last_name, (salary / H) AS "dollars per hit"
FROM players
JOIN performances ON players.id = performances.player_id
JOIN salaries ON players.id = salaries.player_id
WHERE H > 0
AND salaries.year = 2001
GROUP BY players.id
ORDER BY "dollars per hit" ASC
LIMIT 10;