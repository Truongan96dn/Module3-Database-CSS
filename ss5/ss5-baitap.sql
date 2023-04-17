CREATE DATABASE ss5_products;
USE ss5_products;
CREATE TABLE products(
id INT PRIMARY KEY,
productCode VARCHAR(20) NOT NULL UNIQUE,
productName VARCHAR(20)NOT NULL,
productPrice DOUBLE NOT NULL,
productAmount INT NOT NULL,
productDescription VARCHAR(50),
productStatus BIT);
INSERT INTO products VALUES (1,"p123","IPhone12",999,1,"Black",1),
(2,"p124","IPhone13",1000,2,"White",1),
(3,"p125","IPhone14",1500,4,"Grey",1);
SELECT * FROM products;
-- unique index;
CREATE UNIQUE INDEX i_productCode ON products(productCode);
EXPLAIN SELECT productCode, productName, productPrice FROM products WHERE productCode = "p125";
-- composite index 
CREATE INDEX i_products ON products(productName,productPrice);
EXPLAIN SELECT productCode, productName, productPrice FROM products WHERE productName = 'iphone12' OR productPrice = '999';
-- tạo view 
CREATE VIEW v_products AS 
SELECT  productCode, productName, productPrice, productStatus
FROM products;
SELECT * FROM v_products;
-- sửa đổi view
SET sql_safe_updates = 1;
UPDATE v_products SET productName = "IPhone15" WHERE productName = "IPhone14";
-- xoá view 
DELETE FROM v_products WHERE productName = "IPhone13";
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
Delimiter //
CREATE PROCEDURE get_all_products()
    BEGIN
    SELECT * FROM products;
    END//
DELIMITER ;
CALL get_all_products();
-- Tạo store procedure thêm một sản phẩm mới
Delimiter //
CREATE PROCEDURE add_products()
    BEGIN
    INSERT INTO products VALUES (6,"P132","Iphoen17",2000,6,"BLue",1);
    END//
DELIMITER ;
CALL add_products();
DROP PROCEDURE add_products;
-- Tạo store procedure sửa thông tin sản phẩm theo id
DELIMITER //
	CREATE PROCEDURE edit_products(IN p_id INT)
    BEGIN
    UPDATE products
    SET productDescription = 'Black'
    WHERE id = p_id;
    END// 
    DELIMITER ;
    CALL edit_products(6);
    DROP PROCEDURE edit_products;
-- Tạo store procedure xoá sản phẩm theo id
DELIMITER //
CREATE PROCEDURE delete_products(IN p_id INT)
    BEGIN
    DELETE FROM products
    WHERE id = p_id;
    END// 
DELIMITER ;
CALL delete_products(4);
SELECT * FROM products;
DROP PROCEDURE delete_products;
