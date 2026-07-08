# Write your MySQL query statement below
WITH joined AS(
    SELECT student_id, student_name, subject_name
    FROM students
    CROSS JOIN subjects
),
attended AS(
    SELECT student_id, COUNT(subject_name) AS attended_exams, subject_name
    FROM Examinations
    GROUP BY student_id, subject_name
)
SELECT j.student_id, j.student_name, j.subject_name, 
CASE WHEN attended_exams IS null THEN 0
ELSE attended_exams END AS attended_exams
FROM JOINED j
LEFT JOIN attended a
ON j.student_id = a.student_id
AND j.subject_name = a.subject_name
ORDER BY j.student_id, j.subject_name
