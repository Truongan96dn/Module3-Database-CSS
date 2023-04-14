USE furama_management;
-- SQL 6
SELECT
dich_vu.ma_dich_vu,
dich_vu.ten_dich_vu,
dich_vu.dien_tich,
dich_vu.chi_phi_thue,
loai_dich_vu.ten_loai_dich_vu,
hop_dong.ngay_lam_hop_dong
FROM
dich_vu
LEFT JOIN loai_dich_vu ON loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu
LEFT JOIN hop_dong ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
WHERE NOT (hop_dong.ngay_lam_hop_dong LIKE "2021-01-%" OR hop_dong.ngay_lam_hop_dong LIKE "2021-02-%" OR hop_dong.ngay_lam_hop_dong LIKE "2021-03-%"); 
-- SQL 7