# Write your MySQL query statement below
WITH merged AS(
    SELECT *, "New York University" AS university, COUNT(student_id) AS student_count
    FROM NewYork
    WHERE score >= 90
    UNION ALL
    SELECT *, "California University" AS university, COUNT(student_id) AS student_count
    FROM California
    WHERE score >= 90
),
top AS(
    SELECT * 
    FROM merged
    WHERE student_count = (SELECT MAX(student_count) FROM merged)
)
SELECT 
CASE WHEN COUNT(*) > 1 or COUNT(*) < 1 THEN "No Winner"
ELSE university
END AS winner
FROM top