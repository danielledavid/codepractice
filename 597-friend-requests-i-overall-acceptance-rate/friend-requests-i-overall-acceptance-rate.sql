# Write your MySQL query statement below
WITH friendreqcount AS(
    SELECT COUNT(DISTINCT(CONCAT(sender_id, send_to_id))) AS friendreqcount FROM FriendRequest 
)

SELECT 
CASE 
WHEN requester_id IS NULL THEN 0
ELSE
ROUND(COUNT(DISTINCT(CONCAT(requester_id, accepter_id)))/friendreqcount,2)
END AS accept_rate
FROM
RequestAccepted
CROSS JOIN friendreqcount