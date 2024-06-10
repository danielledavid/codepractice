CREATE TABLE users(
    id INTEGER,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    username TEXT NOT NULL,
    password TEXT NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE schools(
    id INTEGER,
    name TEXT,
    type TEXT,
    location TEXT,
    year YEAR,
    PRIMARY KEY (id)
);

CREATE TABLE companies(
    id INTEGER,
    name TEXT,
    industry TEXT,
    location TEXT,
    PRIMARY KEY (id)
);

CREATE TABLE connections(
    id INTEGER,
    user_id INTEGER,
    school_id INTEGER,
    company_id INTEGER,
    user_connection TEXT,
    school_connection TEXT,
    school_start_date DATE,
    school_end_date DATE,
    degree TEXT,
    company_connection TEXT,
    company_start_date DATE,
    company_end_date DATE,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (school_id) REFERENCES schools(id),
    FOREIGN KEY (company_id) REFERENCES companies(id)
);