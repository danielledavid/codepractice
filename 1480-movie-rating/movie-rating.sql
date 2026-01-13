# Write your MySQL query statement below
WITH rating_counts AS(
    SELECT COUNT(rating) AS rating_count, r.user_id
    FROM MovieRating r
    LEFT JOIN Users u
    ON u.user_id = r.user_id

    GROUP BY user_id
    ORDER BY COUNT(rating) DESC, name
    LIMIT 1
),
highest_avg_ratings AS(
    SELECT AVG(rating) as average_rating, r.movie_id, r.created_at
    FROM MovieRating r
    WHERE EXTRACT(YEAR_MONTH FROM created_at) = "202002"
    GROUP BY r.movie_id
    HAVING AVG(rating) = (SELECT AVG(rating) FROM MovieRating WHERE EXTRACT(YEAR_MONTH FROM created_at) = "202002" GROUP BY movie_id ORDER BY AVG(rating) DESC LIMIT 1)
  
    
)

SELECT name AS results
FROM
Users
WHERE user_id IN (SELECT user_id FROM rating_counts)
UNION ALL
(
SELECT title AS results
FROM Movies
WHERE movie_id IN (SELECT movie_id FROM highest_avg_ratings)
ORDER BY results 
LIMIT 1)