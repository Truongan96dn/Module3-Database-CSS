USE furama_management;
-- SQL 6 Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại
-- dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
SELECT
dich_vu.ma_dich_vu,
dich_vu.ten_dich_vu,
dich_vu.dien_tich,
dich_vu.chi_phi_thue,
loai_dich_vu.ten_loai_dich_vu
FROM
dich_vu
LEFT JOIN loai_dich_vu ON loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu
LEFT JOIN hop_dong ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
WHERE NOT (hop_dong.ngay_lam_hop_dong LIKE "2021-01-%" OR hop_dong.ngay_lam_hop_dong LIKE "2021-02-%" OR hop_dong.ngay_lam_hop_dong LIKE "2021-03-%")
GROUP BY dich_vu.ma_dich_vu;
-- SQL 7 Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue,
-- ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.

SELECT d.ma_dich_vu,d.ten_dich_vu,d.dien_tich,d.so_nguoi_toi_da,d.chi_phi_thue,l.ten_loai_dich_vu
FROM dich_vu d
JOIN loai_dich_vu l ON l.ma_loai_dich_vu = d.ma_loai_dich_vu
JOIN hop_dong h ON d.ma_dich_vu = h.ma_dich_vu
WHERE (YEAR(h.ngay_lam_hop_dong) = 2020) AND
    (d.ma_dich_vu NOT IN (SELECT 
            d.ma_dich_vu
        FROM
            dich_vu d
                JOIN
            loai_dich_vu ON d.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
                JOIN
            hop_dong h ON d.ma_dich_vu = h.ma_dich_vu
        WHERE
            YEAR(h.ngay_lam_hop_dong) = 2021))
GROUP BY d.ma_dich_vu;
-- SQL 8 Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
-- cach 1
SELECT ho_ten
FROM khach_hang
group by ho_ten;
-- cach 2
SELECT DISTINCT(ho_ten) FROM khach_hang;
-- cach 3
SELECT ho_ten,	count(ho_ten) FROM khach_hang
GROUP BY ho_ten;
-- SQL 9 Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
SELECT MONTH(hop_dong.ngay_lam_hop_dong) AS thang, COUNT(hop_dong.ma_hop_dong) AS so_luong_khach_dat_phong
FROM hop_dong
WHERE YEAR(hop_dong.ngay_lam_hop_dong) = 2021
GROUP BY thang
ORDER BY thang;
-- SQL 10 Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm ma_hop_dong,
-- ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
SELECT	hop_dong.ma_hop_dong, 
		hop_dong.ngay_lam_hop_dong, 
        hop_dong.ngay_ket_thuc,
        hop_dong.tien_dat_coc, 
        IFNULL(SUM(hop_dong_chi_tiet.so_luong),0) AS so_luong_dich_vu_di_kem
FROM hop_dong
LEFT JOIN hop_dong_chi_tiet ON hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
GROUP BY hop_dong.ma_hop_dong
ORDER BY ma_hop_dong;

