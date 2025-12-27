# Write your MySQL query statement below
SELECT tweet_id 
FROM tweets
WHERE length(content) > 140
OR (CHAR_LENGTH(content) - CHAR_LENGTH(REPLACE(content, '@', ''))) / CHAR_LENGTH('@') > 3
OR
(CHAR_LENGTH(content) - CHAR_LENGTH(REPLACE(content, '#', ''))) / CHAR_LENGTH('#') > 3