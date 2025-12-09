# Write your MySQL query statement below
WITH clicks AS(
    SELECT ad_id, COUNT(action) AS clicks_count
    FROM Ads
    WHERE action = "Clicked"
    GROUP BY ad_id
    
),
views AS(
    SELECT ad_id, COUNT(action) AS views_count
    FROM Ads
    WHERE action = "Viewed"
    GROUP BY ad_id
)

SELECT ads.ad_id,
CASE
WHEN clicks_count IS NULL AND views_count IS NULL THEN 0
WHEN views_count IS NULL THEN (clicks_count * 100)/clicks_count
WHEN clicks_count IS NULL THEN 0
WHEN clicks_count + views_count = 0 THEN 0.00
ELSE ROUND((clicks_count/(clicks_count+views_count)) * 100, 2)
END AS ctr
FROM Ads
LEFT join views
ON ads.ad_id = views.ad_id
LEFT JOIN clicks
ON ads.ad_id = clicks.ad_id
GROUP BY ad_id
ORDER BY ctr DESC, ad_id