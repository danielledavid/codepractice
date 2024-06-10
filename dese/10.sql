SELECT name, per_pupil_expenditure
FROM districts
JOIN expenditures ON districts.id = expenditures.district_id
WHERE districts.id IN (SELECT district_id FROM schools WHERE type = "Public School")
GROUP BY name
ORDER BY per_pupil_expenditure DESC
LIMIT 10;