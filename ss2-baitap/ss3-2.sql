CREATE DATABASE quan_ly_ban_hang;
USE quan_ly_ban_hang;
CREATE TABLE customer (
id INT AUTO_INCREMENT PRIMARY KEY,
name_customer VARCHAR(45) NOT NULL ,
age INT 
);

CREATE TABLE order_product(
id INT AUTO_INCREMENT PRIMARY KEY,
id_customer INT ,
order_date DATE,
total_price DOUBLE,
FOREIGN KEY (id_customer) REFERENCES customer(id)
);

CREATE TABLE product(
id INT AUTO_INCREMENT PRIMARY KEY,
name_product VARCHAR(45) NOT NULL ,
price DOUBLE
);

CREATE TABLE order_detail(
order_id INT ,
product_id INT,
order_quantity VARCHAR(45),
PRIMARY KEY (order_id ,product_id),
FOREIGN KEY (order_id) REFERENCES order_product(id),
FOREIGN KEY (product_id) REFERENCES product(id)
);

INSERT INTO customer(name_customer , age)
VALUES ('Minh Quan' , 10) ,
		('Ngoc Oanh' , 20),
        ('Hong Ha' , 50);
SELECT * FROM customer;

INSERT INTO order_product(id_customer , order_date )
VALUES (1,'2006-03-21'),
		(2,'2006-3-23'),
        (3,'2006-3-16');
SELECT * FROM order_product;

INSERT INTO product( name_product,price)
VALUES ('May Giat', 3),
		('Tu Lanh',5),
        ('Dieu Hoa',7),
        ('Quat',1),
        ('Bep Dien',2);
SELECT * FROM product;

INSERT INTO order_detail( order_id,product_id,order_quantity)
VALUES (1,1,3),
		(1,3,7),
        (1,4,2),
        (2,1,1),
        (3,1,8),
        (2,5,4),
        (2,3,3);
        
SELECT * FROM  order_product;

SELECT
c.id, c.name_customer, c.age , p.name_product
FROM customer c
JOIN order_product o
ON c.id= o.id
JOIN order_detail od
ON od.order_id = c.id
JOIN product p
ON p.id = od.order_id;

SELECT c.name_customer
FROM customer c
LEFT JOIN order_product ON c.id = order_product.id_customer
WHERE isnull(order_product.id_customer);

SELECT order_product.id, order_product.order_date, sum(order_detail.order_quantity*product.price) AS total_price FROM order_product
INNER JOIN customer ON customer.id = order_product.id_customer
INNER JOIN order_detail ON order_detail.order_id = order_product.id
INNER JOIN product ON order_detail.product_id = product.id
GROUP BY order_product.id;