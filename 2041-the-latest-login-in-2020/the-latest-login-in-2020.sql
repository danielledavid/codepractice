# Write your MySQL query statement below

SELECT user_id, max(time_stamp) AS last_stamp
from logins
WHERE EXTrACT(YEAr from time_stamp) = 2020
group by user_Id