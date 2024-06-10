SELECT first_name, last_name
FROM players
WHERE bats = "R"
ORDER BY debut DESC, first_name ASC, last_name ASC;