# Write your MySQL query statement below
WITH RANKED AS(
    SELECT 
    actor_id, director_id,
    ROW_NUMBER() OVER (PARTITION BY actor_id, director_id ORDER BY director_id) AS ranked
    FROM ActorDirector 
)
SELECT actor_id, director_id
FROM ranked 
WHERE ranked = 3