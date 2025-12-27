# Write your MySQL query statement below
SELECT  user_id
FROM Loans
WHERE loan_type = "Mortgage" OR loan_type = "Refinance"
GROUP BY user_id 
HAVING count(distinct loan_type) > 1
order by USER_ID