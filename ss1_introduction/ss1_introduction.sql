create database student_management;
use student_management;
create table class(
id int primary key,
`name` varchar(50)
);
create table teacher(
id int primary key,
`name` varchar(50),
age int,
country varchar(50)
);
-- input data 
insert into teacher value(1,"an",27,"viet nam"),
						(2,"dinh",20,"viet nam");
insert into teacher value(3,"khang",25,"lao");
-- displayTeacher
select * from teacher;
-- edit data 
update teacher set `name` = "anh", age = 29 where id = 2;
-- replace all 
set SQL_SAFE_UPDATES = 1;
update teacher set `name` = "AN";
-- delete data
delete from teacher where id = 2;
-- delete table 
drop table teacher;
drop database student_management;