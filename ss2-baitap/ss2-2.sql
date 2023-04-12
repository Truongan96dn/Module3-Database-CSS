CREATE DATABASE merchandise_management;
USE merchandise_management;
CREATE TABLE customer (
id INT PRIMARY KEY AUTO_INCREMENT,
name_customer VARCHAR(45) NOT NULL ,
age INT 
);

CREATE TABLE order_product(
id INT PRIMARY KEY AUTO_INCREMENT,
id_customer INT ,
order_date DATE,
total_price DOUBLE,
FOREIGN KEY (id_customer) REFERENCES customer(id)
);

CREATE TABLE product(
id INT PRIMARY KEY AUTO_INCREMENT,
name_product VARCHAR(45) NOT NULL ,
price DOUBLE
);

CREATE TABLE order_detail(
order_id INT ,
product_id INT,
order_quantity VARCHAR(45),
PRIMARY KEY (order_id ,product_id),
FOREIGN KEY(order_id) REFERENCES order_product(id),
FOREIGN KEY(product_id) REFERENCES product(id)
);