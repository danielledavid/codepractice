# Write your MySQL query statement below

(SELECT name AS results
FROM MovieRating m
LEFT JOIN Users u
ON u.user_id = m.user_id
GROUP BY m.user_id
ORDER BY COUNT(movie_id) DESC, name
LIMIT 1)
    
UNION ALL


(SELECT title AS results
FROM Movies s
LEFT JOIN MovieRating m
ON m.movie_id = s.movie_id
WHERE
DATE_FORMAT(created_at, '%Y-%m') = "2020-02"
GROUP BY m.movie_id
ORDER BY AVG(rating) desc, title
LIMIT 1
)


