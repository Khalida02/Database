CREATE TABLE store (
    store_id serial,
    name VARCHAR(25) NOT NULL,
    city VARCHAR(25) NOT NULL,
    street VARCHAR(25) NOT NULL,
    phone VARCHAR(11) NOT NULL,
    warehouse_id serial,
    order_id serial,
    transport serial,
    PRIMARY KEY (store_id),
    CONSTRAINT fk_warehouse FOREIGN KEY (warehouse_id) REFERENCES  warehouse (warehouse_id),
    CONSTRAINT fk_transport FOREIGN KEY (transport) REFERENCES transport(transport_id),
    CONSTRAINT fk_order FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
drop table store cascade;



CREATE TABLE warehouse (
    warehouse_id serial,
    product_id serial,
    city VARCHAR(25) NOT NULL,
    street VARCHAR(25) NOT NULL,
    warehouse_size integer,
    manufacturer serial,
    PRIMARY KEY (warehouse_id),
    CONSTRAINT fk_manufacturer FOREIGN KEY (manufacturer) REFERENCES manufacturer (manuf_id)
);
DROP TABLE warehouse CASCADE ;



CREATE TABLE manufacturer(
    manuf_id serial,
    name varchar(200),
    PRIMARY KEY (manuf_id)
);
DROP TABLE manufacturer CASCADE;


CREATE TABLE products(
    product_id serial,
    type text,
    name varchar(100),
    cnt integer,
    manufacturer serial,
    price integer,
    more_information text,
    store_id serial,
    PRIMARY KEY (product_id),
    CONSTRAINT fk_manuf FOREIGN KEY (manufacturer) REFERENCES manufacturer(manuf_id),
    CONSTRAINT fk_store FOREIGN KEY (store_id) REFERENCES store(store_id)
);
DROP TABLE products CASCADE ;


CREATE TABLE customers(
    customer_id serial,
    product_id serial,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL,
    city VARCHAR(25) NOT NULL,
    street VARCHAR(25) NOT NULL,
    phone VARCHAR(11) NOT NULL,
    order_id serial,
    PRIMARY KEY (customer_id),
    CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES products(product_id),
    CONSTRAINT fk_order FOREIGN KEY (order_id) REFERENCES orders (order_id)
);
DROP TABLE customers CASCADE ;

CREATE TABLE payment (
    pay_id serial,
    customer_id serial,
    card_id serial,
    purchase_date date,
    sum integer,
    PRIMARY KEY (pay_id),
    CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    CONSTRAINT fk_card FOREIGN KEY (card_id) REFERENCES card(card_id)
);
drop table payment;

CREATE TABLE card(
    card_id serial,
    bank varchar,
    PRIMARY KEY(card_id)
);
DROP TABLE card CASCADE ;

CREATE TABLE account(
    account_number serial,
    customer serial,
    PRIMARY KEY (account_number),
    CONSTRAINT fk_customer FOREIGN KEY (customer) REFERENCES customers(customer_id)
);
DROP TABLE account CASCADE ;


CREATE TABLE orders (
    order_id serial,
    prod_price integer,
    prod_size integer,
    date date,
    cur_place varchar(200),
    PRIMARY KEY (order_id)
);
DROP TABLE orders CASCADE ;


CREATE TABLE transport(
    transport_id serial,
    order_id serial,
    tracking_number integer,
    transport_type varchar(50),
    PRIMARY KEY (transport_id),
    CONSTRAINT fk_order_id FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
DROP TABLE transport CASCADE ;

CREATE TABLE phone(
    id serial,
    PRIMARY KEY (id),
    CONSTRAINT fk_phone_id FOREIGN KEY (id) REFERENCES products(product_id)
);
DROP TABLE phone;

CREATE TABLE laptop(
    id serial,
    PRIMARY KEY (id),
    CONSTRAINT fk_laptop_id FOREIGN KEY (id) REFERENCES products(product_id)
);
DROP TABLE laptop;

CREATE TABLE accessories(
    id serial,
    PRIMARY KEY (id),
    CONSTRAINT fk_access_id FOREIGN KEY (id) REFERENCES products(product_id)
);
DROP TABLE accessories;


create table online(
    id serial,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL,
    card_id serial,
    primary key (id),
    constraint fk_online foreign key (id) references customers(customer_id),
    constraint fk_card_id foreign key (card_id) references card(card_id)
);
DROP TABLE online CASCADE ;


create table frequent(
    id serial,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL,
    account_number serial,
    primary key (id),
    constraint fk_online foreign key (id) references customers(customer_id),
    constraint fk_account foreign key (account_number) references account(account_number)
);
DROP TABLE frequent CASCADE ;
