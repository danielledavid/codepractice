# Write your MySQL query statement below
WITH joined AS(
SELECT student_id, student_name, subject_name AS sub_name
FROM Students
CROSS JOIN Subjects)

SELECT j.student_id, student_name, sub_name AS subject_name, count(e.student_id) AS attended_exams
from JOINED j
LEFT JOIN 
Examinations e
on e.student_id = j.student_id
AND subject_name = sub_name
GROUP BY student_id, subject_name
ORDER BY student_id, subject_name