WITH RANKED AS(
    SELECT *,
    RANK() OVER(PARTITION BY student_id, subject ORDER BY exam_date) AS FIRST,
    RANK() OVER(PARTITION BY student_id, subject ORDER BY exam_date DESC) AS LAST
    FROM Scores
),
SCORES AS(
SELECT student_id, subject,
SUM(CASE WHEN first = 1 THEN score END) AS first_score,
SUM(CASE WHEN LAST = 1 THEN score END) AS latest_score
FROM RANKED
WHERE first = 1 OR last = 1
GROUP BY student_id, subject)

SELECT * FROM SCORES
WHERE (latest_score - first_score) >= 1