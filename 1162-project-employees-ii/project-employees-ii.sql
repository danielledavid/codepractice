# Write your MySQL query statement below
WITH counts AS(
    SELECT project_id,
    RANK() OVER(ORDER BY COUNT(project_id) DESC) AS ranked_projects
    FROM Project
    GROUP BY project_id
)
SELECT project_id
FROM counts
WHERE ranked_projects = 1;