# Write your MySQL query statement below
WITH size AS(
    Select team_id, count(team_id) AS team_size
    FROM Employee
    GROUP BY team_id
)
select employee_id, team_size
FROM Employee
NATURAL JOIN Size