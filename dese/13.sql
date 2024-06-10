SELECT name, graduated
FROM schools
JOIN graduation_rates ON schools.id = graduation_rates.school_id
ORDER BY graduated DESC LIMIT 10;