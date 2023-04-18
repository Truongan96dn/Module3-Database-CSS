USE furama_management;
-- SQL 16 Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
 SET SQL_SAFE_UPDATES=0;
UPDATE nhan_vien SET `status` = 0 
WHERE `status` = 1 AND nhan_vien.ma_nhan_vien NOT IN (SELECT hop_dong.ma_nhan_vien
FROM hop_dong WHERE YEAR(hop_dong.ngay_lam_hop_dong) BETWEEN 2019 AND 2021);
SET SQL_SAFE_UPDATES=1;
SELECT * FROM nhan_vien WHERE `status` = 0 ;
-- SQL 17 Cập nhật thông tin những khách hàng có ten_loai_khach từ 
-- Platinum lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với 
-- Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
CREATE VIEW v_update_khach_hang AS SELECT hd.ma_khach_hang, SUM(dv.chi_phi_thue +  IFNULL(dvdk.gia,0) * IFNULL(hdct.so_luong,0) ) AS tong_tien
FROM hop_dong AS hd
LEFT JOIN hop_dong_chi_tiet AS hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
INNER JOIN dich_vu AS dv ON hd.ma_dich_vu = dv.ma_dich_vu
LEFT JOIN dich_vu_di_kem AS dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
INNER JOIN khach_hang AS kh ON hd.ma_khach_hang = kh.ma_khach_hang
INNER JOIN loai_khach AS lk ON kh.ma_loai_khach = lk.ma_loai_khach
WHERE YEAR(hd.ngay_lam_hop_dong) = 2021 AND lk.ten_loai_khach = "Plantium"
GROUP BY hd.ma_khach_hang
HAVING tong_tien > 1000000;
SELECT * FROM v_update_khach_hang;
UPDATE khach_hang SET ma_loai_khach = 1 WHERE ma_khach_hang IN (SELECT ma_khach_hang FROM v_update_khach_hang);
SET sql_safe_updates = 1;
-- SQL 20 Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị 
-- bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
SELECT nv.ma_nhan_vien,nv.ho_ten,nv.email,nv.so_dien_thoai,nv.ngay_sinh,nv.dia_chi FROM nhan_vien AS nv
UNION
SELECT kh.ma_khach_hang,kh.ho_ten,kh.email,kh.so_dien_thoai,kh.ngay_sinh,kh.dia_chi FROM khach_hang AS kh;
-- SQL 19
CREATE VIEW v_mdvdk AS SELECT dvdk.ma_dich_vu_di_kem,dvdk.ten_dich_vu_di_kem,hdct.so_luong,dvdk.gia,hd.ma_hop_dong FROM dich_vu_di_kem AS dvdk 
JOIN hop_dong_chi_tiet AS hdct ON  hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
JOIN hop_dong AS hd ON hd.ma_hop_dong = hdct.ma_hop_dong
WHERE YEAR(hd.ngay_lam_hop_dong) = 2020
GROUP BY hdct.ma_dich_vu_di_kem,dvdk.ten_dich_vu_di_kem,hdct.so_luong,dvdk.gia,hd.ma_hop_dong
HAVING hdct.so_luong >10 ;
UPDATE dich_vu_di_kem SET gia = gia * 2
WHERE ma_dich_vu_di_kem IN (SELECT ma_dich_vu_di_kem FROM v_mdvdk);
SET sql_safe_updates = 1;
-- SQL 18 Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
UPDATE khach_hang AS kh SET `status` = 0
WHERE `status`= 1 AND kh.ma_khach_hang IN ( SELECT hd.ma_khach_hang FROM hop_dong AS hd
WHERE YEAR(hd.ngay_lam_hop_dong) < 2021);
SET sql_safe_updates = 0;
-- SQL 18 khach hang bi xoa
SELECT * FROM khach_hang
WHERE `status` = 0;

-- SQL 18




