CREATE TABLE passengers(
    id INTEGER
    first_name TEXT,
    last_name TEXT,
    age INTEGER,
    PRIMARY KEY (id)
);

CREATE TABLE check_ins(
    id INTEGER,
    passenger_id INTEGER,
    flight_id INTEGER,
    check_in DATETIME,
    PRIMARY KEY(id),
    FOREIGN KEY(passenger_id) REFERENCES passengers(id),
    FOREIGN KEY(flight_id) REFERENCES flights(id)
);
CREATE TABLE flights(
    id INTEGER,
    check_in_id INTEGER,
    airline_id INTEGER,
    flight_number INTEGER,
    depart_code TEXT,
    destination_code TEXT,
    departure_date DATETIME,
    arrival_date DATETIME,
    PRIMARY KEY(id),
    FOREIGN KEY(check_in_id) REFERENCES check_ins(id),
    FOREIGN KEY(airline_id) REFERENCES airlines(id)
);

CREATE TABLE airlines(
    id INTEGER,
    flight_id INTEGER,
    name TEXT,
    concourse CHECK(concourse IN("A", "B", "C", "D", "E", "F", "T")),
    PRIMARY KEY(id),
    FOREIGN KEY(flight_id) REFERENCES flights(id)
);