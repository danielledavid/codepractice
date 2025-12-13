# Write your MySQL query statement below
WITH consecutive AS(
    SELECT *, 
    CASE WHEN 
    free = lead(free) OVER(ORDER BY seat_id) THEN TRUE
    ELSE FALSE
    END AS consecutive_seats,
    CASE WHEN 
    free = lag(free) OVER(ORDER BY seat_id) THEN TRUE
    ELSE FALSE
    END AS consecutive_seats_back
    FROM Cinema
)
SELECT seat_id
FROM consecutive
WHERE (consecutive_seats = 1
OR consecutive_seats_back = 1)
AND free = 1
order by seat_id