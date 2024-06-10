SELECT year, salary
FROM salaries
WHERE player_id IN (
    SELECT id
    FROM players
    WHERE first_name = "Cal"
    AND last_name = "Ripken")
ORDER BY year DESC;