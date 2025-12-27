# Write your MySQL query statement below
SELECT
RIGHT(email, 
LENGTH(email) - INSTR(email, '@')) AS email_domain,
COUNT(RIGHT(email, 
LENGTH(email) - INSTR(email, '@'))) AS count
FROM Emails
where 
email REGEXP'.com'
group by RIGHT(email, 
LENGTH(email) - INSTR(email, '@'))
order by RIGHT(email, 
LENGTH(email) - INSTR(email, '@'))