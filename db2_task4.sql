-- CUSTOMERS
INSERT INTO customers VALUES (1, 'Ivanov Ivan', '22.09.2021 21.44.22', 'Moscow');
SELECT full_name FROM customers
    WHERE delivery_address = 'Moscow';


-- PRODUCTS
INSERT INTO products VALUES ('book1', 'The Miracle Morning', 'book', 435.66);
INSERT INTO products VALUES ('book2', 'Eat that frog', 'book', 533.33);

SELECT id FROM products;

DELETE FROM products
WHERE id = 'book1';

UPDATE products
SET price = price * 1.5
WHERE price <= 500.00;

SELECT * FROM products;



-- ORDER_ITEMS
INSERT INTO order_items VALUES (1, 'book2', 1);
SELECT * FROM order_items;

-- ORDERS
INSERT INTO orders VALUES (1, 1, 533.33, FALSE);
SELECT * FROM orders;