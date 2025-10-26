CREATE PROCEDURE getUserIDs(startDate DATE, endDate DATE, minAmount INT)
BEGIN
	SELECT DISTINCT user_id
    FROM Purchases
    WHERE DATE(time_stamp) BETWEEN startDate AND endDate-1
    AND amount >= minAmount
    ORDER BY user_id;
END