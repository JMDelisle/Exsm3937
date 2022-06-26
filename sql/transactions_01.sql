DROP DATABASE IF EXISTS jedelisl;
CREATE DATABASE jedelisl;

START TRANSACTION;

CREATE TABLE Customer (
    customer_id int PRIMARY key AUTO_INCREMENT,
    customer_name varchar(50) NOT NULL,
    customer_email varchar(50) NULL,
    street_address varchar(50) NULL,
    city varchar(50) NULL,
    province char(2) NULL,
    postal_code char(6) NULL
);

CREATE TABLE Product (
    product_id int PRIMARY key AUTO_INCREMENT,
    product_name varchar(50) NOT NULL,
    product_description varchar(200) NOT NULL,
    price decimal(15, 2) NOT NULL,
    quantity_in_stock int NOT NULL
);

CREATE TABLE Order_Header( 
    order_header_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_price DECIMAL(15,2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE Order_Detail(
    order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_header_id int NOT NULL,
    product_id int NOT NULL,
    order_qty int NOT NULL,
    sub_total DECIMAL(15,2) NOT NULL,
    FOREIGN KEY (order_header_id) REFERENCES Order_Header(order_header_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

COMMIT;