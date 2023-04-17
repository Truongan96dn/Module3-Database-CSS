USE furama_management;
-- SQL 16
SELECT * FROM nhan_vien nv
LEFT JOIN hop_dong hd ON hd.ma_nhan_vien = nv.ma_nhan_vien;
