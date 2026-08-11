# Write your MySQL query statement below
WITH TRIP_TYPE AS (
SELECT *,
CASE WHEN MONTH(trip_date) IN (1,2,3,4,5,6) THEN "first_half"
ELSE "second_half" END AS trip
FROM trips),
CALCULATED AS(
SELECT *, 
AVG(CASE WHEN TRIP = "first_half" THEN DISTANCE_KM ELSE 0 END / CASE WHEN TRIP = "first_half" THEN fuel_consumed ELSE 0 END) AS first_half_avg,
AVG(CASE WHEN TRIP = "second_half" THEN DISTANCE_KM ELSE 0 END / CASE WHEN TRIP = "second_half" THEN fuel_consumed ELSE 0 END) AS second_half_avg   
FROM TRIP_TYPE
GROUP BY DRIVER_ID, TRIP
),
FINAL AS(
SELECT
c.driver_id, driver_name, ROUND(SUM(first_half_avg),2) AS first_half_avg, ROUND(SUM(second_half_avg),2) AS second_half_avg, ROUND(SUM(second_half_avg)-SUM(first_half_avg),2) AS  efficiency_improvement 
FROM CALCULATED c
JOIN DRIVERS
USING(DRIVER_ID)

GROUP BY driver_id
)
SELECT * FROM FINAL WHERE first_half_avg  IS NOT NULL AND second_half_avg IS NOT NULL AND efficiency_improvement >= 0
ORDER BY efficiency_improvement DESC, driver_name