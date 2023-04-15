USE furama_management;
-- SQL 6
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
-- SQL 7
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
-- SQL 8
-- cach 1
SELECT ho_ten
FROM khach_hang
group by ho_ten;
-- cach 2
SELECT DISTINCT(ho_ten) FROM khach_hang;
-- cach 3
SELECT ho_ten,	count(ho_ten) FROM khach_hang
GROUP BY ho_ten;
-- SQL 9
SELECT MONTH(hop_dong.ngay_lam_hop_dong) AS thang, COUNT(hop_dong.ma_hop_dong) AS so_luong_khach_dat_phong
FROM hop_dong
WHERE YEAR(hop_dong.ngay_lam_hop_dong) = 2021
GROUP BY thang
ORDER BY thang;
-- SQL 10
SELECT	hop_dong.ma_hop_dong, 
		hop_dong.ngay_lam_hop_dong, 
        hop_dong.ngay_ket_thuc,
        hop_dong.tien_dat_coc, 
        IFNULL(SUM(hop_dong_chi_tiet.so_luong),0) AS so_luong_dich_vu_di_kem
FROM hop_dong
LEFT JOIN hop_dong_chi_tiet ON hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
GROUP BY hop_dong.ma_hop_dong
ORDER BY ma_hop_dong;

