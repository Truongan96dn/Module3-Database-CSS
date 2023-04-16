USE furama_management;
-- SQL 11 Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.

SELECT dvdk.*,lk.ten_loai_khach FROM khach_hang k
JOIN hop_dong h  ON k.ma_khach_hang = h.ma_khach_hang
JOIN loai_khach lk ON k.ma_loai_khach = lk.ma_loai_khach
JOIN hop_dong_chi_tiet hdct ON hdct.ma_hop_dong = h.ma_hop_dong
JOIN dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
WHERE lk.ten_loai_khach = "Diamond" AND k.dia_chi LIKE "%Vinh" OR k.dia_chi LIKE "%Quảng Ngãi";
-- SQL 12 Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được khách 
-- hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
SELECT h.ma_hop_dong,nv.ho_ten,k.ho_ten,k.so_dien_thoai,dv.ten_dich_vu, sum(hdct.so_luong) AS so_luong_dich_vu_di_kem,h.tien_dat_coc
FROM khach_hang k
JOIN hop_dong h  ON k.ma_khach_hang = h.ma_khach_hang
JOIN dich_vu dv ON dv.ma_dich_vu = h.ma_dich_vu
JOIN nhan_vien nv ON h.ma_nhan_vien = nv.ma_nhan_vien
JOIN loai_khach lk ON k.ma_loai_khach = lk.ma_loai_khach
JOIN hop_dong_chi_tiet hdct ON hdct.ma_hop_dong = h.ma_hop_dong
JOIN dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
WHERE YEAR(h.ngay_lam_hop_dong)= 2020 
AND MONTH(h.ngay_lam_hop_dong) in (10,11,12)
AND (dv.ma_dich_vu NOT IN (SELECT 
            dv.ma_dich_vu
        FROM
            dich_vu dv
                JOIN
            loai_dich_vu ON dv.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
                JOIN
            hop_dong h ON dv.ma_dich_vu = h.ma_dich_vu
        WHERE
            YEAR(h.ngay_lam_hop_dong) = 2021 AND MONTH(h.ngay_lam_hop_dong) IN (1,2,3,4,5,6)))
GROUP BY hdct.ma_hop_dong;
-- SQL 13 Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
SELECT dvdk.*,max(hdct.so_luong) AS dvdk_duoc_su_dung_nhieu_nhat 
FROM khach_hang k
JOIN hop_dong h  ON k.ma_khach_hang = h.ma_khach_hang
JOIN dich_vu dv ON dv.ma_dich_vu = h.ma_dich_vu
JOIN nhan_vien nv ON h.ma_nhan_vien = nv.ma_nhan_vien
JOIN loai_khach lk ON k.ma_loai_khach = lk.ma_loai_khach
JOIN hop_dong_chi_tiet hdct ON hdct.ma_hop_dong = h.ma_hop_dong
JOIN dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
GROUP BY dvdk.ma_dich_vu_di_kem
ORDER BY dvdk_duoc_su_dung_nhieu_nhat DESC
LIMIT 1;
-- SQL 14 Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, 
-- so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).
-- SELECT hd.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem, COUNT(hdct.so_luong) AS so_lan_su_dung;
SELECT dvdk.*, h.ma_hop_dong,ldv.ten_loai_dich_vu,dvdk.ten_dich_vu_di_kem, count(hdct.ma_dich_vu_di_kem) AS so_lan_su_dung
FROM khach_hang k
JOIN hop_dong h  ON k.ma_khach_hang = h.ma_khach_hang
JOIN dich_vu dv ON dv.ma_dich_vu = h.ma_dich_vu
JOIN loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
JOIN nhan_vien nv ON h.ma_nhan_vien = nv.ma_nhan_vien
JOIN loai_khach lk ON k.ma_loai_khach = lk.ma_loai_khach
JOIN hop_dong_chi_tiet hdct ON hdct.ma_hop_dong = h.ma_hop_dong
JOIN dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
GROUP BY hdct.ma_dich_vu_di_kem,hdct.ma_hop_dong
HAVING dvdk.ten_dich_vu_di_kem IN (
SELECT dvdk.ten_dich_vu_di_kem
FROM dich_vu_di_kem AS dvdk
INNER JOIN hop_dong_chi_tiet AS hdct ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
GROUP BY hdct.ma_dich_vu_di_kem
HAVING COUNT(*) =1);
-- SQL 15 Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan,
-- so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
SELECT  nv.ma_nhan_vien,nv.ho_ten,td.ten_trinh_do,bp.ten_bo_phan,nv.so_dien_thoai,nv.dia_chi
FROM nhan_vien nv
JOIN hop_dong hd ON hd.ma_nhan_vien = nv.ma_nhan_vien
JOIN trinh_do td ON td.ma_trinh_do = nv.ma_trinh_do
JOIN bo_phan bp ON  bp.ma_bo_phan = nv.ma_bo_phan
WHERE (YEAR(hd.ngay_lam_hop_dong) BETWEEN 2020 AND 2021)
GROUP BY hd.ma_nhan_vien
HAVING COUNT(hd.ma_nhan_vien) <=3;





