WITH zero AS(
    SELECT DISTINCT sub_id 
    FROM Submissions
    WHERE parent_id IS NULL
)

SELECT z.sub_id AS post_id, COUNT(DISTINCT s.sub_id) AS number_of_comments
FROM zero z
LEFT JOIN Submissions s
ON z.sub_id = s.parent_id
GROUP BY z.sub_id
