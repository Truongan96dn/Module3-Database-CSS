create database furama_management;
use furama_management;
create table vi_tri(
ma_vi_tri int primary key,
ten_vi_tri varchar(50));
insert into vi_tri value (1, "Quản lý"),
                        (2,"Nhân viên");
select *from vi_tri;
create table trinh_do(
ma_trinh_do int primary key,
ten_trinh_do varchar(50));
insert into trinh_do value (1, "Trung Cấp"),
(2,"Cao Đẳng"),(3,"Đại Học"),(4,"Sau Đại Học");
select *from trinh_do;
create table bo_phan(
ma_bo_phan int primary key,
ten_bo_phan varchar(50));
insert into bo_phan value(1,"Sale-Marketing"),
(2,"Hành Chính"),(3,"Phục vụ"),(4,"Quản Lý");
select *from bo_phan;
create table loai_khach(
ma_loai_khach int primary key,
ten_loai_khach varchar(50));
insert into loai_khach value(1,"Diamond"),
(2,"Platinium"),(3,"Gold"),(4,"Silver"),(5,"Member");
select *from loai_khach;
create table kieu_thue(
ma_kieu_thue int primary key,
ten_kieu_thue varchar(50));
insert into kieu_thue value(1,"year"),
(2,"month"),(3,"day"),(4,"hour");
select *from kieu_thue;
create table loai_dich_vu(
ma_loai_dich_vu int primary key,
ten_loai_dich_vu varchar(50));
insert into loai_dich_vu value(1,"Villa"),
(2,"House"),(3,"Room");
select *from loai_dich_vu;
create table nhan_vien(
ma_nhan_vien int primary key,
ho_ten varchar(50),
ngay_sinh date,
so_cmnd varchar(50),
luong double,
so_dien_thoai varchar(50),
email varchar(50),
dia_chi varchar(50),
ma_vi_tri int ,foreign key(ma_vi_tri)references vi_tri(ma_vi_tri),
ma_trinh_do int , foreign key(ma_trinh_do)references trinh_do(ma_trinh_do),
ma_bo_phan int , foreign key(ma_bo_phan)references bo_phan(ma_bo_phan));
insert into nhan_vien values(1,'Nguyễn Văn An','1970-11-07','456231786',10000000,'0901234121','annguyen@gmail.com','295 Nguyễn Tất Thành, Đà Nẵng',1,3,1),
(2,'Lê Văn Bình','1997-04-09','654231234',7000000,'0934212314','binhlv@gmail.com','22 Yên Bái, Đà Nẵng',1,2,2),
(3,'Hồ Thị Yến','1995-12-12','999231723',14000000,'0412352315','thiyen@gmail.com','K234/11 Điện Biên Phủ, Gia Lai',1,3,2),
(4,'Võ Công Toản','1980-04-04','123231365',17000000,'0374443232','toan0404@gmail.com','77 Hoàng Diệu, Quảng Trị',1,4,4),
(5,'Nguyễn Bỉnh Phát','1999-12-09','454363232',6000000,'0902341231','phatphat@gmail.com','43 Yên Bái, Đà Nẵng',2,1,1),
(6,'Khúc Nguyễn An Nghi','2000-11-08','964542311',7000000,'0978653213','annghi20@gmail.com','294 Nguyễn Tất Thành, Đà Nẵng',2,2,3),
(7,'Nguyễn Hữu Hà','1993-01-01','534323231',8000000,'0941234553','nhh0101@gmail.com','4 Nguyễn Chí Thanh, Huế',2,3,2),
(8,'Nguyễn Hà Đông','1989-09-03','234414123',9000000,'0642123111','donghanguyen@gmail.com','111 Hùng Vương, Hà Nội',2,4,4),
(9,'Tòng Hoang','1982-09-03','256781231',6000000,'0245144444','hoangtong@gmail.com','213 Hàm Nghi, Đà Nẵng',2,4,4),
(10,'Nguyễn Công Đạo','1994-01-08','755434343',8000000,	'0988767111','nguyencongdao12@gmail.com','6 Hoà Khánh, Đồng Nai',2,3,2);
select *from nhan_vien;
create table khach_hang(
ma_khach_hang int primary key,
ho_ten varchar(50),
ngay_sinh date,
gioi_tinh bit(1),
so_cmnd varchar(50),
so_dien_thoai varchar(50),
email varchar(50),
dia_chi varchar(50),
ma_loai_khach int, foreign key(ma_loai_khach)references loai_khach(ma_loai_khach));
insert into khach_hang values
(1,'Nguyễn Thị Hào','1970-11-07',0,'643431213','0945423362','thihao07@gmail.com','23 Nguyễn Hoàng, Đà Nẵng',5),
(2,'Phạm Xuân Diệu','1992-08-08',1,'865342123','0954333333','xuandieu92@gmail.com','K77/22 Thái Phiên, Quảng Trị',3),
(3,'Trương Đình Nghệ','1990-02-27',1,'488645199','0373213122','nghenhan2702@gmail.com','K323/12 Ông Ích Khiêm, Vinh',1),
(4,'Dương Văn Quan','1981-07-08',1,'543432111','0490039241','duongquan@gmail.com','K453/12 Lê Lợi, Đà Nẵng',1),
(5,'Hoàng Trần Nhi Nhi','1995-12-09',0,'795453345','0312345678','nhinhi123@gmail.com','224 Lý Thái Tổ, Gia Lai',4),
(6,'Tôn Nữ Mộc Châu','2005-12-06',0,'732434215','0988888844','tonnuchau@gmail.com','37 Yên Thế, Đà Nẵng',4),
(7,'Nguyễn Mỹ Kim','1984-04-08',0,'856453123','0912345698','kimcuong84@gmail.com','K123/45 Lê Lợi, Hồ Chí Minh',1),
(8,'Nguyễn Thị Hào','1999-04-08',0,'965656433','0763212345','haohao99@gmail.com','55 Nguyễn Văn Linh, Kon Tum',3),
(9,'Trần Đại Danh','1994-07-01',1,'432341235','0643343433','danhhai99@gmail.com','24 Lý Thường Kiệt, Quảng Ngãi',1),
(10,'Nguyễn Tâm Đắc','1989-07-01',1,'344343432','0987654321','dactam@gmail.com','22 Ngô Quyền, Đà Nẵng',2);
select *from khach_hang;
create table dich_vu(
ma_dich_vu int primary key,
ten_dich_vu varchar(50),
dien_tich double,
chi_phi_thue double,
so_nguoi_toi_da int,
tieu_chuan_phong varchar(50),
mo_ta_tien_nghi_khac varchar(50),
dien_tich_ho_boi double,
so_tang int,
dich_vu_mien_phi_di_kem varchar(50),
ma_kieu_thue int, foreign key(ma_kieu_thue)references kieu_thue(ma_kieu_thue),
ma_loai_dich_vu int ,foreign key(ma_loai_dich_vu)references loai_dich_vu(ma_loai_dich_vu));
insert into dich_vu values
(1,'Villa Beach Front',25000,1000000,10,'vip','Có hồ bơi',500,4,null,3,1),
(2,'House Princess 01',14000,5000000,7,'vip','Có thêm bếp nướng',null,3,null,2,2),
(3,'Room Twin 01',5000,1000000,2,'normal','Có tivi',null,null,'1 Xe máy, 1 Xe đạp',4,3),
(4,'Villa No Beach Front',22000,9000000,8,'normal','Có hồ bơi',300,3,null,3,1),
(5,'House Princess 02',10000,4000000,5,'normal','Có thêm bếp nướng',null,2,null,3,2),
(6,'Room Twin 02',3000,900000,2,'normal','Có tivi',null,null,'1 Xe máy',4,3);
select * from dich_vu;
create table dich_vu_di_kem(
ma_dich_vu_di_kem int primary key,
ten_dich_vu_di_kem varchar(50),
gia double,
don_vi varchar(50),
trang_thai varchar(50));
insert into dich_vu_di_kem value(1,"Karaoke",10000,"giờ","tiện nghi,hiện tại"),
(2,"Thuê xe máy ",10000,"chiếc","hỏng 1 xe"),
(3,"Thuê xe đạp",20000,"chiếc","tốt"),
(4,"Buffet buổi sáng",15000,"suất","đầy đủ đồ ăn,tráng miệng"),
(5,"Buffet buổi trưa",90000,"suất","đầy đủ đồ ăn,tráng miệng"),
(6,"Buffet buổi tối",16000,"suất","đầy đủ đồ ăn,tráng miệng");
select *from dich_vu_di_kem;
create table hop_dong(
ma_hop_dong int primary key,
ngay_lam_hop_dong date,
ngay_ket_thuc date,
tien_dat_coc double,
ma_nhan_vien int, foreign key(ma_nhan_vien)references nhan_vien(ma_nhan_vien),
ma_khach_hang int, foreign key(ma_khach_hang)references khach_hang(ma_khach_hang),
ma_dich_vu int,foreign key (ma_dich_vu)references dich_vu(ma_dich_vu));
insert into hop_dong value(1,"2023-11-04","2023-12-04",0,3,1,3),
(2,"2023-01-04","2023-05-04",200000,7,3,1),
(3,"2023-06-04","2023-10-04",500000,3,4,2),
(4,"2023-12-03","2023-12-03",1000000,7,5,5),
(5,"2021-12-09","2021-12-09",0,7,2,6),
(6,"2021-01-08","2021-05-08",600000,7,7,6),
(7,"2023-02-06","2023-12-06",700000,7,4,4),
(8,"2023-02-03","2023-03-02",1000000,3,4,1),
(9,"2023-11-04","2023-12-04",300000,3,4,3),
(10,"2022-11-06","2022-12-06",50000,10,3,5);
select * from hop_dong;
create table hop_dong_chi_tiet(
ma_hop_dong_chi_tiet int primary key,
so_luong int,
ma_hop_dong int,
ma_dich_vu_di_kem int);
insert into hop_dong_chi_tiet value(1,5,2,4),
(2,8,3,5),
(3,7,2,6),
(4,1,3,1),
(5,12,3,2),
(6,3,1,2),
(7,2,12,2);
select * from hop_dong_chi_tiet;


