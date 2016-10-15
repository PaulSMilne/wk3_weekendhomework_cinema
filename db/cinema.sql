DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS films;

CREATE TABLE customers (
    id SERIAL4 PRIMARY KEY,
    name VARCHAR(255),
    wallet INT2,
    concession BOOLEAN
);

CREATE TABLE films (
    id SERIAL4 PRIMARY KEY,
    name VARCHAR(255),
    genre VARCHAR(255),
    running_time INT2
);

CREATE TABLE tickets (
    id SERIAL4 PRIMARY KEY,
    customer_id INT2 REFERENCES customers(id),
    film_id INT2 REFERENCES films(id),
    price INT2,
    time TIME,
    capacity INT2
);