CREATE INDEX price_manufac ON products(price, manufacturer);
CREATE INDEX store_ind ON store(name, city);
CREATE INDEX customers_ind ON customers(first_name, city);
CREATE INDEX pay_ind on payment(sum, purchase_date);
CREATE INDEX order_ind on orders(prod_price, cur_place, date);


-- 4a
SELECT customers.customer_id, customers.first_name, customers.last_name, customers.phone FROM customers
    full join transport on transport.order_id = customers.order_id
where transport.tracking_number = 123456 and transport.transport_type = 'USPS';
UPDATE transport SET transport_id = 5, tracking_number = 1234567, transport_type = 'SDEK'
WHERE order_id = 85;


-- 4b
SELECT customers.customer_id, customers.first_name, customers.last_name, payment.sum, payment.purchase_date FROM customers
    full join payment on payment.customer_id = customers.customer_id
where payment.sum = (select max(sum) from payment) and purchase_date >= now() - interval '1' year
order by purchase_date desc ;


-- 4c
SELECT product_id, name, products.cnt, sum(cnt * products.price / 435)
from products
group by product_id
order by sum(cnt * products.price / 435) desc
limit 2;


-- 4d
SELECT product_id, name, products.cnt
from products
group by product_id
order by cnt desc
limit 2;

-- 4g
SELECT customers.customer_id, customers.first_name, customers.last_name, payment.sum FROM customers
    FULL JOIN payment ON payment.customer_id = customers.customer_id
WHERE payment.purchase_date >= now() - interval '1' month ;




INSERT INTO store (store_id, name, city, street, phone, warehouse_id, order_id, transport) values(1, 'MyStore', 'Almaty', 'Tole bi', 87755215555, 1, 1, 1);
INSERT INTO store values(2, 'MyStore', 'Almaty', 'Abylai khan', 87755215556, 2, 2, 2);
INSERT INTO store values(3, 'MyStore', 'Uralsk', 'Nazarbayev', 87755215557, 3, 3, 3);
INSERT INTO store values(4, 'MyStore', 'Nur-Sultan', 'Makataev', 87755215558, 4, 4, 4);

INSERT INTO warehouse (warehouse_id, product_id, city, street, warehouse_size, manufacturer) VALUES (1, 1, 'Almaty', 'Tole bi', 50, 1);
INSERT INTO warehouse VALUES (2, 2, 'Almaty', 'Karimov', 150, 2);
INSERT INTO warehouse VALUES (3, 3, 'Uralsk', 'Zhangirkhan', 250, 3);
INSERT INTO warehouse VALUES (4, 4, 'Nur-Sultan', 'Makataev', 200, 4);


INSERT INTO manufacturer (manuf_id, name) VALUES (1, 'Apple');
INSERT INTO manufacturer VALUES (2, 'Samsung');
INSERT INTO manufacturer VALUES (3, 'Huawei');
INSERT INTO manufacturer VALUES (4, 'Xiomi');


INSERT INTO products (product_id, type, name, cnt, manufacturer, price, more_information, store_id) VALUES (1, 'phone', 'Iphone 13', 2, 1, 418500, '128GB', 1);
INSERT INTO products VALUES (2, 'laptop', 'Macbook Air', 1, 2, 462000, '128GB', 1);
INSERT INTO products VALUES (3, 'phone', 'Huawei P30',  3, 3, 289500, '128GB', 3);
INSERT INTO products VALUES (4, 'accessories', 'Airpods', 1, 4, 98000, '3', 1);


INSERT INTO customers (customer_id, product_id, first_name, last_name, city, street, phone, order_id) VALUES (1, 1, 'Khalida', 'Khamitova', 'Uralsk', 'Akkozy batyr', '87788888857', 1);
INSERT INTO customers VALUES (2, 2, 'Nurbol', 'Zhetpisbai', 'Almaty', 'Turgut Ozala', '87788888888', 2);
INSERT INTO customers VALUES (3, 3, 'Mukhit', 'Nasyrov', 'Almaty', 'Kambar batyr', '87788888800', 3);
INSERT INTO customers VALUES (4, 4, 'Alina', 'Ismagulova', 'Almaty', 'Islama Karimova', '8778627757', 4);



INSERT INTO payment (pay_id, customer_id, card_id, purchase_date, sum) VALUES (1, 1, 1, '2021-01-01', 418500);
INSERT INTO payment VALUES (2, 2, 2, '2021-01-02', 462000);
INSERT INTO payment VALUES (3, 3, 3, '2021-01-01', 289500);
INSERT INTO payment VALUES (4, 4, 4, '2021-01-01', 294000);


INSERT INTO card (card_id, bank) VALUES (1, 'KASPI');
INSERT INTO card VALUES (2, 'Halyk');
INSERT INTO card VALUES (3, 'Sberbank');
INSERT INTO card VALUES (4, 'Alpha bank');





INSERT INTO orders (order_id, prod_price, prod_size, date, cur_place) VALUES (1, 418500, 1, '2021-01-01', 'Almaty');
INSERT INTO orders VALUES (2, 462000, 1, '2021-01-02', 'Almaty');
INSERT INTO orders VALUES (3, 289500, 1, '2021-01-01', 'Almaty');
INSERT INTO orders VALUES (4, 294000, 1, '2021-11-30', 'Almaty');



INSERT INTO transport (tracking_number, transport_type) VALUES (2, 'SDEK');
INSERT INTO transport (tracking_number, transport_type) VALUES (22, 'KazPost');
INSERT INTO transport (tracking_number, transport_type) VALUES (15, 'Belposhta');
INSERT INTO transport (tracking_number, transport_type) VALUES (123456, 'USPS');

