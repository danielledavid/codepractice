-- Keep a log of any SQL queries you execute as you solve the mystery.

-- Check the contents of the database
.schema

--Check reports that happened on July 28, 2021 at Humphrey Street
SELECT id FROM crime_scene_reports WHERE month = 7 AND year = 2021 AND DAY = 28 AND street = "Humphrey Street";

--Check description of the report
SELECT description FROM crime_scene_reports WHERE id = 295;
SELECT description FROM crime_scene_reports WHERE id = 297;

--Names and transcripts of witnesses who mentioned bakery
SELECT name, transcript FROM interviews WHERE transcript LIKE "%bakery%";

--check license plate of the person who left that day
SELECT license_plate FROM bakery_security_logs WHERE hour = 10 AND minute > 15 AND minute <= 25 AND year = 2021 AND month = 7 AND day = 28 AND activity = "exit";

--Check id, acc numbers and amount withdrawn at Leggett Street that day
SELECT id, account_number, amount FROM atm_transactions WHERE year = 2021 AND month = 7 AND day = 28 AND atm_location = "Leggett Street" AND transaction_type = "withdraw";


--Check airport details
SELECT id, abbreviation, full_name FROM airports WHERE city = "Fiftyville";

--Find Earliest flight
SELECT id, hour, minute FROM flights WHERE origin_airport_id = 8 AND year = 2021 AND month = 7 AND day = 29;

--See seats and passport nos from the flight
SELECT passport_number, seat FROM passengers WHERE flight_id = 36;


--Check id, caller, receiver of phonecalls
SELECT id, caller, receiver FROM phone_calls WHERE year = 2021 AND month = 7 AND day = 28 AND duration < 60;

--Check everything
SELECT name FROM PEOPLE where phone_number IN (SELECT caller FROM phone_calls WHERE year = 2021 AND month = 7
AND day = 28 AND duration < 60)
AND passport_number IN (SELECT passport_number FROM passengers WHERE flight_id = 36)
AND license_plate IN (SELECT license_plate FROM bakery_security_logs WHERE hour = 10 AND minute > 15 AND minute <= 25 AND year = 2021 AND month = 7 AND day = 28 AND activity = "exit");

--Check their ids
SELECT id FROM people WHERE name = "Sofia";
SELECT id FROM people WHERE name = "Kelsey";
SELECT id FROM people WHERE name = "Bruce";

--check bank acc
SELECT account_number FROM bank_accounts WHERE person_id = 398010;
SELECT account_number FROM bank_accounts WHERE person_id = 560886;
SELECT account_number FROM bank_accounts WHERE person_id = 686048;

--CHECK bruce's details
SELECT phone_number, passport_number FROM people WHERE name = "Bruce";

--check destination
SELECT city FROM airports WHERE id = 4;

--find who is receiver of phonecall
SELECT receiver FROM phone_calls WHERE caller = "(367) 555-5533" AND year = 2021 AND month = 7 AND day = 28 AND duration < 60;
SELECT name FROM people WHERE phone_number = "(375) 555-8161";