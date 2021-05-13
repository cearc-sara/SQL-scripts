CREATE DATABASE new_game_store;
USE new_game_store;

CREATE TABLE customers(
    customer_id INT NOT NULL AUTO_INCREMENT,
    customer_name VARCHAR(60) NOT NULL,
    email VARCHAR(60) NOT NULL,
    house_number INT NOT NULL,
    postcode VARCHAR(8) NOT NULL,
    PRIMARY KEY(customer_id)
);

CREATE TABLE products(
    product_id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(60) NOT NULL,
    price DECIMAL(6,2) NOT NULL,
    stock INT NOT NULL,
    PRIMARY KEY(product_id)
);

CREATE TABLE orders(
    order_id INT NOT NULL AUTO_INCREMENT,
    date_placed DATE NOT NULL,
    fk_customer_id INT NOT NULL,
    PRIMARY KEY(order_id),
    FOREIGN KEY(fk_customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE product_orders(
    fk_order_id INT NOT NULL,
    fk_product_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY(fk_order_id, fk_product_id),
    FOREIGN KEY(fk_order_id) REFERENCES orders(order_id),
    FOREIGN KEY(fk_product_id) REFERENCES products(product_id)
);

SHOW TABLES;
DESCRIBE customers;


INSERT INTO customers(customer_name, email, house_number, postcode)
VALUES('Andrew', 'adrew@gmail.com', 23, '86753');

INSERT INTO customers(customer_name, email, house_number, postcode)
VALUES('Alice', 'aclark@gmail.com', 383, '07823');

INSERT INTO customers(customer_name, email, house_number, postcode)
VALUES('Debra', 'dgrant@gmail.com', 651, '98264');

INSERT INTO customers(customer_name, email, house_number, postcode)
VALUES('Charlie', 'ccrew@gmail.com', 16, '08865');

INSERT INTO customers(customer_name, email, house_number, postcode)
VALUES('Benjiman', 'bjeni@gmail.com', 56, '54869');


SELECT * FROM customers;


INSERT INTO products(title, price, stock)
VALUES('Deadman Rising', 45.78, 6);

INSERT INTO products(title, price, stock)
VALUES('7DaysToDie', 68.78, 9);

INSERT INTO products(title, price, stock)
VALUES('Fisherman', 25.78, 3);

INSERT INTO products(title, price, stock)
VALUES('Jumping Jacks', 38.78, 2);

INSERT INTO products(title, price, stock)
VALUES('Hills Have Eyes Survival', 78.98, 7);


SELECT * FROM products;


INSERT INTO orders(date_placed, fk_customer_id)
VALUES('2021-03-25', 3);

INSERT INTO orders(date_placed, fk_customer_id)
VALUES('2021-03-10', 2);

INSERT INTO orders(date_placed, fk_customer_id)
VALUES('2021-04-13', 1);

INSERT INTO orders(date_placed, fk_customer_id)
VALUES('2021-02-28', 4);

INSERT INTO orders(date_placed, fk_customer_id)
VALUES('2021-01-25', 5);


SELECT * FROM orders;


INSERT INTO product_orders(fk_order_id, fk_product_id, quantity)
VALUES(1, 4, 2);

INSERT INTO product_orders(fk_order_id, fk_product_id, quantity)
VALUES(2, 5, 3);

INSERT INTO product_orders(fk_order_id, fk_product_id, quantity)
VALUES(5, 1, 6);

INSERT INTO product_orders(fk_order_id, fk_product_id, quantity)
VALUES(3, 2, 1);

INSERT INTO product_orders(fk_order_id, fk_product_id, quantity)
VALUES(4, 3, 1);


SELECT * FROM product_orders;


SELECT * FROM customers cu JOIN orders o ON cu.customer_id = o.fk_customer_id;
SELECT cu.customer_name, o.date_placed FROM customers cu JOIN orders o ON cu.customer_id = o.fk_customer_id;

SELECT * FROM product_orders po 
JOIN orders o ON po.fk_order_id = o.order_id 
JOIN customers cu ON cu.customer_id = o.fk_customer_id 
JOIN products p ON p.product_id = po.fk_product_id;

SELECT cu.customer_name, o.date_placed AS order_placed, p.title, po.quantity
FROM product_orders po 
JOIN orders o ON po.fk_order_id = o.order_id 
JOIN customers cu ON cu.customer_id = o.fk_customer_id 
JOIN products p ON p.product_id = po.fk_product_id;