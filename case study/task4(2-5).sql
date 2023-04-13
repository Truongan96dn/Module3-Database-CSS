USE furama_management;
-- SQL 2
SELECT * FROM nhan_vien
WHERE ho_ten REGEXP "^[HTK]" AND char_length(ho_ten)<=15;
-- SQL 3
SELECT * FROM khach_hang
WHERE (YEAR(CURDATE()) - YEAR(ngay_sinh) BETWEEN 18 AND 50) AND dia_chi LIKE '%Đà Nẵng'
        OR dia_chi LIKE '%Quảng Trị';
-- SQL 4
SELECT khach_hang.ma_khach_hang,khach_hang.ho_ten,count(ma_hop_dong) as so_lan_dat_phong 
FROM khach_hang
JOIN hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
JOIN loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
WHERE  loai_khach.ten_loai_khach = "Diamond"
group by ma_khach_hang
order by so_lan_dat_phong;

        
