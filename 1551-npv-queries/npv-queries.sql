# Write your MySQL query statement below
SELECT q.id, q.year, COALESCE(n.npv,0) as npv
FROM Queries q
LEFT JOIN npv n
ON q.id = n.id
AND q.year = n.year