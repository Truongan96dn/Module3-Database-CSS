CREATE DATABASE demo;
USE demo;

create table users (
 id  int(3) NOT NULL AUTO_INCREMENT,
 name varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 country varchar(120),
 PRIMARY KEY (id)
);
insert into users(name, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Kante','kante@che.uk','Kenia');
DELIMITER //
CREATE PROCEDURE showList()
BEGIN
    SELECT * FROM users;
END
    //
DELIMITER ;
  CALL showList();
DELIMITER //
CREATE PROCEDURE update_user()
BEGIN
    SELECT * FROM users;
END
    //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE delete_user(IN deleteID INT)
BEGIN
    DELETE FROM users WHERE users.id= deleteID;
END
    //
DELIMITER ;

