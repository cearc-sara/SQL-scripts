CREATE DATABASE gstoredb;
USE gstoredb;

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
    fk_customer_id INT NOT NULL,
    fk_product_id INT NOT NULL,
    date_placed DATE NOT NULL,
    PRIMARY KEY(order_id),
    FOREIGN KEY(fk_customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY(fk_product_id) REFERENCES products(product_id)
);

SHOW TABLES;
DESCRIBE customers;

