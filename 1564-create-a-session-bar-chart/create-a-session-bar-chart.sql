# Write your MySQL query statement below
WITH bar AS(
    SELECT session_id,
    CASE WHEN duration/60 >= 0 AND duration/60 < 5 then "[0-5>"
    WHEN duration/60 >= 5 AND duration/60 < 10 then "[5-10>"
    WHEN duration/60 >= 10 AND duration/60 < 15 then "[10-15>"
    ELSE "15 or more"
    END AS bin_all
    FROM SESSIONs
),
list AS(
    SELECT "[0-5>" AS bin
    UNION ALL SELECT "[5-10>"
    UNION ALL SELECT "[10-15>"
    UNION ALL SELECT "15 or more"
)
SELECT 
l.*, COUNT(bin_all) AS total
FROM list l
LEFT JOIN bar b
ON l.bin = b.bin_all
GROUP BY bin