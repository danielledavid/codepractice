# Write your MySQL query statement below
SELECT artist, COUNT(artist) AS occurrences
FROM Spotify
group by artist
ORDER BY COUNT(artist) DESC, artist
