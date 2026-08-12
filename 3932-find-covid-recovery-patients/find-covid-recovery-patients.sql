# Write your MySQL query statement below
WITH FIRST_POSITIVE AS(
    SELECT *
    FROM covid_tests
    WHERE result = "Positive"
    GROUP BY patient_id
    HAVING MIN(test_date)
),

RANKED AS (
    SELECT *,
    RANK() OVER(PARTITION BY c.patient_id ORDER BY test_date) AS RANKED,
    MIN(CASE WHEN result = "Positive" THEN test_date END)  AS positives,
    MIN(CASE WHEN result = "Negative" THEN test_date END)  AS negatives
    FROM covid_tests c
    JOIN patients
    USING (patient_id)
    WHERE test_date >= (SELECT test_date FROM FIRST_POSITIVE f WHERE f.patient_id = c.patient_id)
    GROUP BY patient_id
)
SELECT patient_id, patient_name, age,
CASE WHEN DATEDIFF(negatives, positives) > 0 THEN DATEDIFF(negatives, positives) END AS recovery_time
FROM RANKED 
WHERE DATEDIFF(negatives, positives) > 0 
ORDER BY DATEDIFF(negatives, positives), patient_name
