# Write your MySQL query statement below
WITH teams_2 AS(
    SELECT team_name AS away_team FROM Teams
)
SELECT team_name AS home_team, away_team FROM Teams
CROSS JOIN teams_2
WHERE team_name != away_team