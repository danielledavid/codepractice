SELECT first_name, last_name, salary, salaries.year, HR
FROM players
JOIN salaries ON players.id = salaries.player_id
JOIN performances ON players.id = performances.player_id
WHERE
salaries.year IN (SELECT year FROM performances GROUP BY player_id)
GROUP BY salaries.id
ORDER BY players.id, first_name, last_name, salaries.year DESC, HR DESC, salary DESC;