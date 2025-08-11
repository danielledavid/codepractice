-- Write your PostgreSQL query statement below
With yesterday AS(
    SELECT id, TO_CHAR((recordDate + INTERVAL '1 day'),'YYYY-MM-DD') AS yesterday_date, temperature AS yesterday_tempp
    FROM Weather
),
yesterday_temperature AS(
    SELECT Weather.id, yesterday_tempp AS yesterday_temp
    FROM Weather
    LEFT JOIN yesterday
    ON yesterday.yesterday_date = TO_CHAR(Weather.recordDate,'YYYY-MM-DD')
)


SELECT Weather.id
FROM Weather
LEFT JOIN yesterday_temperature
ON Weather.id = yesterday_temperature.id
WHERE temperature > yesterday_temp