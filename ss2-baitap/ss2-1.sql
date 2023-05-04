CREATE DATABASE material_management;
USE material_management;
CREATE TABLE phieu_xuat (
    so_phieu_xuat INT PRIMARY KEY AUTO_INCREMENT,
    ngay_xuat DATE
);

CREATE TABLE vat_tu (
    ma_vat_tu INT PRIMARY KEY AUTO_INCREMENT,
    ten_vat_tu VARCHAR(45) NOT NULL
);

CREATE TABLE chi_tiet_phieu_xuat (
    so_phieu_xuat INT,
    ma_vat_tu INT,
    PRIMARY KEY (so_phieu_xuat , ma_vat_tu),
    FOREIGN KEY (so_phieu_xuat)
	REFERENCES phieu_xuat (so_phieu_xuat),
    FOREIGN KEY (ma_vat_tu)
	REFERENCES vat_tu (ma_vat_tu)
);

CREATE TABLE phieu_nhap (
    so_phieu_nhap INT PRIMARY KEY AUTO_INCREMENT,
    ngay_nhap DATE
);

CREATE TABLE chi_tiet_phieu_nhap (
    ma_vat_tu INT,
    so_phieu_nhap INT,
    PRIMARY KEY (ma_vat_tu , so_phieu_nhap),
    FOREIGN KEY (ma_vat_tu)
        REFERENCES vat_tu (ma_vat_tu),
    FOREIGN KEY (so_phieu_nhap)
        REFERENCES phieu_nhap (so_phieu_nhap)
);

CREATE TABLE don_dat_hang (
    so_don_hang INT PRIMARY KEY AUTO_INCREMENT,
    ngay_dat_hang DATE
);

CREATE TABLE chi_tiet_don_hang (
    ma_vat_tu INT,
    so_don_hang INT,
    PRIMARY KEY (ma_vat_tu , so_don_hang),
    FOREIGN KEY (ma_vat_tu)
	REFERENCES vat_tu (ma_vat_tu),
    FOREIGN KEY (so_don_hang)
	REFERENCES don_dat_hang (so_don_hang)
);

CREATE TABLE nha_cung_cap (
    ma_nha_cung_cap VARCHAR(20) PRIMARY KEY ,
    ten_nha_cung_cap VARCHAR(45) NOT NULL,
    dia_chi VARCHAR(45) NOT NULL,
    so_dien_thoai VARCHAR (15)UNIQUE
);

CREATE TABLE so_dien_thoai (
    so_dien_thoai VARCHAR(15) PRIMARY KEY AUTO_INCREMENT,
    ma_nha_cung_cap VARCHAR(20),
    FOREIGN KEY (ma_nha_cung_cap)
	REFERENCES nha_cung_cap (ma_nha_cung_cap)
);

ALTER TABLE don_dat_hang
ADD ma_nha_cung_cap INT ;

ALTER TABLE don_dat_hang
ADD CONSTRAINT fk_don_hang
FOREIGN KEY (ma_nha_cung_cap) REFERENCES nha_cung_cap(ma_nha_cung_cap);