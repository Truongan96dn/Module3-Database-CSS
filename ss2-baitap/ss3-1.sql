CREATE DATABASE quan_ly_sinh_vien;
USE quan_ly_sinh_vien;
CREATE TABLE classes (
    class_id INT AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(50) NOT NULL,
    start_date DATE NOT NULL,
    STATUS BIT
);
CREATE TABLE student
(
    student_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(30) NOT NULL,
    address VARCHAR(50),
    phone VARCHAR(20) UNIQUE,
    STATUS BIT,
    id INT NOT NULL,
    FOREIGN KEY (id) REFERENCES classes (class_id)
);

CREATE TABLE subjects
(
    sub_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_name VARCHAR(30) NOT NULL,
    credit TINYINT NOT NULL DEFAULT 1 CHECK ( credit >= 1 ),
    STATUS BIT DEFAULT 1
);

CREATE TABLE mark
(
    mark_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_id INT NOT NULL,
    student_id INT NOT NULL,
    mark FLOAT DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),
    exam_times TINYINT DEFAULT 1,
    UNIQUE(sub_id, student_id),
    FOREIGN KEY (sub_id) REFERENCES subjects (sub_id),
    FOREIGN KEY (student_id) REFERENCES student (student_id)
);
INSERT INTO classes
VALUES (1, 'A1', '2008-12-20', 1);

INSERT INTO classes
VALUES (2, 'A2', '2012-12-22', 1);

INSERT INTO classes
VALUES (3, 'B3', current_date, 0);

INSERT INTO student (student_name, address, phone, status, id)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);

INSERT INTO student (student_name, address, status, id)
VALUES ('Hoa', 'Hai phong', 1, 1);

INSERT INTO student (student_name, address, phone, status, id)
VALUES ('Manh', 'HCM', '0123123123',0,2);
INSERT INTO subjects
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
       
INSERT INTO mark (sub_id, student_id, mark, exam_times)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
-- 1 
SELECT *FROM student
WHERE student_name LIKE "H%";
-- 2
SELECT *FROM classes
WHERE start_date LIKE "%-12-%";
-- 3
SELECT *FROM subjects
WHERE credit BETWEEN 3 AND 5;
-- 4
 SET SQL_SAFE_UPDATES =0;
 UPDATE student SET id=2
 WHERE student.student_name='HUNG';
 SET SQL_SAFE_UPDATES =1;
 -- 5
 SELECT student.student_name,subjects.sub_name,mark.mark
FROM mark
JOIN student ON student.student_id=mark.student_id
JOIN subjects ON subjects.sub_id=mark.sub_id
ORDER BY mark DESC;