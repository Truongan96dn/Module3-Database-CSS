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
-- SQL 5
SELECT
    khach_hang.ma_khach_hang,
    khach_hang.ho_ten AS ho_ten_khach_hang,
    loai_khach.ten_loai_khach,
    hop_dong.ma_hop_dong,
    dich_vu.ten_dich_vu,
    hop_dong.ngay_lam_hop_dong,
    hop_dong.ngay_ket_thuc,
    ifnull((ifnull((hop_dong_chi_tiet.so_luong * dich_vu_di_kem.gia) , 0)  + dich_vu.chi_phi_thue),0) AS tong_so_tien
FROM
    khach_hang
        JOIN
    loai_khach ON khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
        LEFT JOIN
    hop_dong ON khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
        LEFT JOIN
    dich_vu ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
        LEFT JOIN
    hop_dong_chi_tiet ON hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
        LEFT JOIN
    dich_vu_di_kem ON hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
ORDER BY khach_hang.ma_khach_hang;


        
