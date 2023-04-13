CREATE DATABASE merchandise_management;
USE merchandise_management;
CREATE TABLE customer (
id INT PRIMARY KEY AUTO_INCREMENT ,
name_customer VARCHAR(45) NOT NULL ,
age INT CHECK (age > 16)
);

CREATE TABLE order_product(
id INT PRIMARY KEY AUTO_INCREMENT,
id_customer INT NOT NULL UNIQUE,
order_date DATE NOT NULL,
total_price DOUBLE NOT NULL,
FOREIGN KEY (id_customer) REFERENCES customer(id)
);

CREATE TABLE product(
id INT PRIMARY KEY AUTO_INCREMENT,
name_product VARCHAR(45) NOT NULL ,
price DOUBLE NOT NULL
);

CREATE TABLE order_detail(
order_id VARCHAR(20) NOT NULL ,
product_id VARCHAR(20) NOT NULL,
order_quantity INT NOT NULL,
PRIMARY KEY (order_id ,product_id),
FOREIGN KEY(order_id) REFERENCES order_product(id),
FOREIGN KEY(product_id) REFERENCES product(id)
);