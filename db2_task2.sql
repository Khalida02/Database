-- TASK 2

CREATE TABLE customers(
    id                  INTEGER NOT NULL ,
    full_name           VARCHAR(50) NOT NULL,
    timestamp           TIMESTAMP NOT NULL,
    delivery_address    TEXT NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (id)
);

CREATE TABLE orders(
    code                INTEGER UNIQUE NOT NULL,
    customer_id         INTEGER,
    total_sum           DOUBLE PRECISION NOT NULL CHECK (  total_sum > 0 ),
    is_paid             boolean NOT NULL,
    PRIMARY KEY (code),
    UNIQUE (code),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE order_items(
    order_code          INTEGER NOT NULL,
    product_id          VARCHAR NOT NULL,
    quantity            INTEGER NOT NULL CHECK ( quantity > 0 ),
    PRIMARY KEY (order_code, product_id),
    UNIQUE (order_code, product_id),
    FOREIGN KEY (order_code) REFERENCES orders(code),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE products(
    id                  VARCHAR NOT NULL ,
    name                VARCHAR NOT NULL,
    description         TEXT,
    price               DOUBLE PRECISION NOT NULL CHECK ( price > 0 ),
    PRIMARY KEY (id),
    UNIQUE (id, name)
);