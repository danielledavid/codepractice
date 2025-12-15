SELECT
ROUND((SUM(order_date = customer_pref_delivery_date) / count(delivery_id)) * 100,2) as immediate_percentage
FROM delivery