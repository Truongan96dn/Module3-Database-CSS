USE quan_ly_sinh_vien;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT *from subjects
WHERE credit = (SELECT max(credit)from subjects);
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT s.sub_name,s.credit,s.STATUS, m.mark FROM subjects s
JOIN mark m ON s.sub_id = m.sub_id
WHERE mark = ( SELECT MAX(mark) from mark);
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
SELECT student.*, AVG(m.mark) AS diem_trung_binh
FROM student
JOIN mark m ON student.student_id = m.student_id
GROUP BY student_id
ORDER BY diem_trung_binh DESC, student_id;
