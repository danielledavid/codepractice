SELECT name, H AS "total hits"
FROM teams
JOIN performances ON teams.id = performances.team_id
ORDER BY H DESC
LIMIT 5;