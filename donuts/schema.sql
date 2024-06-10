CREATE TABLE ingredients(
    id INTEGER,
    ingredient TEXT NOT NULL,
    price_per_unit INTEGER NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE donuts(
    id INTEGER,
    ingredients_id INTEGER,
    orders_id INTEGER,
    name TEXT NOT NULL,
    glutten_free INTEGER NOT NULL CHECK(glutten_free IN (1,0)),
    price_per_donut INTEGER NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (ingredients_id) REFERENCES ingredients(id),
    FOREIGN KEY (orders_id) REFERENCES orders(id)
);

CREATE TABLE orders(
    id INTEGER,
    donuts_id INTEGER NOT NULL,
    customer_id INTEGER NOT NULL,
    order_number INTEGER UNIQUE,
    PRIMARY KEY (id),
    FOREIGN KEY (donuts_id) REFERENCES donuts(id)
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE customers(
    id INTEGER,
    orders_id INTEGER NOT NULL,
    first_name TEXT,
    last_name TEXT,
    PRIMARY KEY (id),
    FOREIGN KEY (orders_id) REFERENCES orders(id)
);