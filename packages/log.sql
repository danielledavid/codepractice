
-- *** The Lost Letter ***
SELECT * FROM addresses WHERE address LIKE "2 %F%Street%";
-- *** The Devious Delivery ***
SELECT * FROM packages WHERE contents LIKE "%duck%";
SELECT * FROM scans WHERE package_id = 5098;
SELECT * FROM addresses WHERE id = 348;

-- *** The Forgotten Gift ***
SELECT * FROM addressess WHERE address LIKE "109 Tileston Street";
SELECT * FROM scans WHERE address_id = 9873;
SELECT * FROM packages WHERE id = 9523;
SELECT * FROM drivers WHERE id = 11;