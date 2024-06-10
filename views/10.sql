SELECT english_title AS "Highest Entropy By Hokusai"
FROM views
WHERE artist = "Hokusai"
ORDER BY entropy DESC
LIMIT 1;