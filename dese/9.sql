SELECT name
FROM districts
JOIN expenditures ON districts.id = (SELECT district_id FROM expenditures WHERE pupils = (SELECT MIN(pupils) FROM expenditures))
GROUP BY name
;