﻿CREATE DATABASE QLCB
USE QLCB
GO
CREATE TABLE KHACHHANG(
	MAKH CHAR(6) PRIMARY KEY,
	TENKH NVARCHAR (20),
	DIACHI NVARCHAR(50),
	NGSINH DATE,
	SDT CHAR(10),
)
CREATE TABLE LOAIHL(
	MALOAI CHAR(6) PRIMARY KEY,
	TENLOAI NVARCHAR(50),
	GIA FLOAT 
)
CREATE TABLE NHANVIEN_MB(
	MANV CHAR(6) PRIMARY KEY,
	TENNV NVARCHAR (20),
	DIACHI NVARCHAR(50),
	NGSINH DATE,
	GIOITINH NVARCHAR(5),
	SDT CHAR(10),
	VITRI NVARCHAR(20),
)
CREATE TABLE NHANVIEN_PHONGVE(
	MANV CHAR(6) PRIMARY KEY,
	TENNV NVARCHAR (50),
	DIACHI NVARCHAR(50),
	NGSINH DATE,
	GIOITINH NVARCHAR(5),
	SDT CHAR(10),
)
CREATE TABLE LOAIMB(
	MALOAI CHAR(6) PRIMARY KEY,
	TENLOAI NVARCHAR(20)
)
CREATE TABLE MAYBAY(
	MAMB CHAR(6) PRIMARY KEY,
	MALOAI CHAR(6) REFERENCES LOAIMB
)
CREATE TABLE CHUYENBAYTINH(
	MACB CHAR(6) PRIMARY KEY,
	TG_CATCANH TIME,
	TG_HACANH TIME,
	NOIDI NVARCHAR(50),
	NOIDEN NVARCHAR (50)
)

CREATE TABLE CHUYENBAY(
	MACB CHAR(6) REFERENCES CHUYENBAYTINH,
	NGCHUYENBAY DATE,
	SOGHETRONG INT,
	TRANGTHAI  NVARCHAR(20) ,
	GHICHU NVARCHAR(200),
	VITRI NVARCHAR(200),
	MAMB CHAR(6) REFERENCES MAYBAY,
	PRIMARY KEY(MACB,NGCHUYENBAY)
)
CREATE TABLE HANGGHE(
	MAHG CHAR(7) PRIMARY KEY,
	TENHG NVARCHAR(50),	
	HOANTIEN NVARCHAR(100),
	TIENICH NVARCHAR (200)
)
CREATE TABLE LOAIHL_HANGGHE(
	MALOAI CHAR(6) REFERENCES LOAIHL,
	MAHG CHAR(7) REFERENCES HANGGHE,
	KL_TOIDA FLOAT
	PRIMARY KEY(MALOAI, MAHG)
)

CREATE TABLE VE(
	MAVE CHAR(6) PRIMARY KEY,
	SOGHE CHAR(3) ,
	MAHG CHAR(7) REFERENCES HANGGHE,
	GIA FLOAT,
	MAKH CHAR(6) REFERENCES KHACHHANG,
	MACB CHAR(6),
	NGCHUYENBAY DATE,
	MANV CHAR(6) REFERENCES NHANVIEN_PHONGVE,
	NGMUA DATE,
	FOREIGN KEY (MACB,NGCHUYENBAY) REFERENCES CHUYENBAY
)



CREATE TABLE HANHLY(
	MAHL CHAR(6) PRIMARY KEY,
	MALOAI CHAR(6) REFERENCES LOAIHL,
	KHOILUONG FLOAT,
	MAVE CHAR(6) REFERENCES VE,
	MANV CHAR(6) REFERENCES NHANVIEN_PHONGVE,
	NGMUA DATE,
)
CREATE TABLE PHANCONG(
	MANV CHAR(6) ,
	MACB CHAR(6),
	NGCHUYENBAY DATE,
	PRIMARY KEY(MANV,MACB,NGCHUYENBAY),
	FOREIGN KEY(MANV) REFERENCES NHANVIEN_MB,
	FOREIGN KEY (MACB,NGCHUYENBAY) REFERENCES CHUYENBAY
)
---INSERT
GO
SET DATEFORMAT DMY
--khach hang
INSERT INTO KHACHHANG VALUES
('0001',  N'Phạm Anh Vũ', N'223 Nguyen Trai', '22/1/2000','0000001'),
('0002',  N'Trần Quốc Trung', N'Quận 1', '23/4/1999','0000002'),
('0003',  N'Nguyễn Thị Diệu Bình', N'Quận 2', '4/1/2003','0000003'),
('0004',  N'Đặng Thị Thanh Trúc', N'Quận 3', '3/12/2002','0000004'),
('0005',  N'Trần Văn Vũ', N'Phú Yên', '4/2/2000','083762'),
('0006',  N'Lê Thị Hoàng Châu', N'Bình Tân', '2/12/2001','0983728'),
('0007',  N'Trần Trung Quân', N'Hà Tĩnh', '21/5/2003','03837'),
('0008',  N'Phạm Thanh Quyên', N'Quận 12', '4/8/2001','07363004'),
('0009',  N'Lê Thị Kiều Vân', N'Nha Trang', '2/4/2001','0393827'),
('0010',  N'Huỳnh Tấn Phát', N'Hóc Môn', '4/1/1999','083736'),
('0011',  N'Nguyễn Thành Đăng', N'Hóc Môn', '4/2/1999','0093736'),
('0012',  N'Nguyễn Tấn Phát', N'Đà Lạt', '4/11/1999','0773628'),
('0013',  N'Phan Công Thành', N'Hải Phòng', '24/11/1999','072622'),
('0014',  N'Dương Công Hiếu', N'Quảng Bình', '14/4/1998','063722'),
('0015',  N'Dương Minh', N'Hà Nam', '4/1/1999','083736')


INSERT INTO LOAIHL VALUES
('L001',N'Xách tay',0),
('L002',N'Ký gửi miễn cước',0),
('L003',N'Ký gửi tính cước loại 1',181000),
('L004',N'Ký gửi tính cước loại 2',310000)

--hanh ly
INSERT INTO LOAIMB VALUES
('L001',N'Boeing 787'),
('L002',N'Airbus A330'),
('L003',N'Airbus A321'),
('L004',N'Airbus A350'),
('L005',N'ATR 72-500')

INSERT INTO MAYBAY VALUES
('MB001','L001'),
('MB002','L001'),
('MB003','L002'),
('MB004','L002'),
('MB005','L002'),
('MB006','L003'),
('MB007','L004'),
('MB008','L004'),
('MB009','L005'),
('MB0010','L005')
--CHUYENBAY

INSERT INTO CHUYENBAYTINH VALUES 
('VN4897','5:45:00','7:55:00' ,N'TPHCM', N'Hà Nội'),
('VN4892','5:30:00','7:35:00' ,N'TPHCM', N'Hà Nội'),
('VN175','14:00:00','15:20:00' ,N'TPHCM', N'Đà Nẵng'),
('VN4824','7:55:00','9:15:00' ,N'TPHCM', N'Đà Nẵng'),
('VN112','8:00:00','9:20:00' ,N'TPHCM', N'Đà Nẵng'),
('VN125','2:00:00','3:25:00' ,N'Đà Nẵng', N'TPHCM'),
('VN240','7:00:00','9:15:00' ,N'TPHCM', N'Hà Nội'),
('VN210','10:00:00','12:10:00' ,N'TPHCM', N'Đà Nẵng'),
('VN1551','05:45:00','08:00:00' ,N'Hà Nội', N'Nha Trang'),
('VN1552','07:05:00','09:05:00' ,N'Hà Nội', N'Nha Trang'),
('VN1370','05:55:00','07:45:00' ,N'TPHCM', N'Huế'),
('VN1372','10:25:00','11:55:00' ,N'TPHCM', N'Huế')


INSERT INTO CHUYENBAY  VALUES
('VN4897','1/7/2023',200,N'Chưa hoàn thành',NULL,NULL,'MB001'),
('VN4897','2/7/2023',200,N'Chưa hoàn thành',NULL,NULL,'MB001'),
('VN4897','3/7/2023',200,N'Chưa hoàn thành',NULL,NULL,'MB001'),
('VN4892','1/7/2023',200,N'Chưa hoàn thành',NULL,NULL,'MB002'),
('VN4892','2/7/2023',200,N'Chưa hoàn thành',NULL,NULL,'MB002'),
('VN175','1/7/2023',200,N'Chưa hoàn thành',NULL,NULL,'MB003'),
('VN175','10/7/2023',200,N'Chưa hoàn thành',NULL,NULL,'MB003'),
('VN175','17/7/2023',200,N'Chưa hoàn thành',NULL,NULL,'MB003'),
('VN125','1/7/2023',200,N'Chưa hoàn thành',NULL,NULL,'MB006'),
('VN125','10/7/2023',200,N'Chưa hoàn thành',NULL,NULL,'MB006'),
('VN1551','12/7/2023',200,N'Chưa hoàn thành',NULL,NULL,'MB006'),
('VN1551','14/7/2023',200,N'Chưa hoàn thành',NULL,NULL,'MB006'),
('VN1552','4/7/2023',200,N'Chưa hoàn thành',NULL,NULL,'MB005'),
('VN1552','11/7/2023',200,N'Chưa hoàn thành',NULL,NULL,'MB005'),
('VN1370','22/7/2023',200,N'Chưa hoàn thành',NULL,NULL,'MB008'),
('VN1370','25/7/2023',200,N'Chưa hoàn thành',NULL,NULL,'MB008'),
('VN1372','2/7/2023',200,N'Chưa hoàn thành',NULL,NULL,'MB009'),
('VN1370','4/7/2023',200,N'Chưa hoàn thành',NULL,NULL,'MB009'),
('VN125','17/6/2023',200,N'Hoàn thành',NULL,NULL,'MB006'),
('VN4892','1/6/2023',200,N'Hoàn thành',NULL,NULL,'MB003'),
('VN4892','5/6/2023',200,N'Hoàn thành',NULL,NULL,'MB003'),
('VN4892','12/6/2023',200,N'Hoàn thành',NULL,NULL,'MB003'),
('VN240','1/6/2023',200,N'Hoàn thành',NULL,NULL,'MB007'),
('VN240','2/6/2023',200,N'Hoàn thành',NULL,NULL,'MB008'),
('VN240','3/6/2023',200,N'Hoàn thành',NULL,NULL,'MB007'),
('VN112','2/6/2023',200,N'Hoàn thành',NULL,NULL,'MB009'),
('VN112','7/6/2023',200,N'Hoàn thành',NULL,NULL,'MB009'),
('VN210','5/6/2023',200,N'Hoàn thành',NULL,NULL,'MB0010')


INSERT INTO HANGGHE VALUES
('VNPTLH',N'Phổ thông linh hoạt',N'Thu phí 500000',N'Bữa ăn trên máy bay,quầy thủ tục ưu tiên, lối lên máy bay ưu tiên, chọn chỗ trước, đổi vé miễn phí'),
('VNPTTC',N'Phổ thông tiêu chuẩn',N'Thu phí 500000',N'Bữa ăn trên máy bay, chọn chỗ trước, đổi vé miễn phí'),
('VNPTTK',N'Phổ thông tiết kiệm',N'Thu phí 500000',N'Bữa ăn trên máy bay'),
('VNPTSTK',N'Phổ thông siêu tiết kiệm',N'Không hoàn vé',N'Không có'),
('VNPTDB',N'Phổ thông đặc biệt',N'Hoàn vé miễn phí',N'Bữa ăn trên máy bay,quầy thủ tục ưu tiên, lối lên máy bay ưu tiên, chọn chỗ trước, đổi vé miễn phí'),
('VNTG',N'Thương gia',N'Hoàn vé miễn phí',N'Bữa ăn cao cấp trên máy bay,quầy thủ tục ưu tiên, lối lên máy bay ưu tiên, chọn chỗ trước, đổi vé miễn phí')

INSERT INTO LOAIHL_HANGGHE VALUES
('L001','VNPTSTK',12),
('L001','VNPTTK',12),
('L001','VNPTTC',12),
('L001','VNPTLH',12),
('L001','VNPTDB',18),
('L001','VNTG',18)

INSERT INTO LOAIHL_HANGGHE VALUES
('L002','VNPTSTK',23),
('L002','VNPTTK',23),
('L002','VNPTTC',23),
('L002','VNPTLH',23),
('L002','VNPTDB',23),
('L002','VNTG',32)
INSERT INTO LOAIHL_HANGGHE VALUES
('L003','VNPTSTK',10),
('L003','VNPTTK',10),
('L003','VNPTTC',10),
('L003','VNPTLH',10),
('L003','VNPTDB',10),
('L003','VNTG',10)
INSERT INTO LOAIHL_HANGGHE VALUES
('L004','VNPTSTK', 23),
('L004','VNPTTK', 23),
('L004','VNPTTC', 23),
('L004','VNPTLH', 23),
('L004','VNPTDB', 23),
('L004','VNTG', 23)
INSERT INTO NHANVIEN_MB VALUES
('NV001',N'Nguyễn Hồ Lan Trinh',N'Hà Nội','16/2/2000',N'Nữ','0000922',N'Tiếp viên'),
('NV002',N'Nguyễn Quang Huy',N'Quận 1','2/2/1999',N'Nam','3764673',N'Tiếp viên'),
('NV003',N'Lê Thị Thu Nga',N'Quận 2','3/2/1999',N'Nữ','000013',N'Phi Công'),
('NV004',N'Cao Thanh Trúc',N'Quận 3','12/3/1998',N'Nữ','001200',N'Phi công'),
('NV005',N'Lê Tiến Đạt',N'Quận 12','9/2/1996',N'Nam','282882',N'Phi công'),
('NV006',N'Phạm Hoài Vũ',N'Hà Tĩnh','16/5/2003',N'Nam','083738',N'Phi công'),
('NV007',N'Phạm Minh Triết',N'Hà Nội','9/1/1996',N'Nam','09373',N'Tiếp viên'),
('NV008',N'Đặng Đình Dũng',N'Quận 12','9/7/2000',N'Nam','083722',N'Tiếp viên'),
('NV009',N'Võ Trần Mai Phương',N'Quận 5','2/5/2001',N'Nữ','0939282',N'Tiếp viên'),
('NV010',N'Trần Xuân An',N'Quận 12','12/2/1996',N'Nam','093838',N'Tiếp viên'),
('NV011',N'Phạm Bảo',N'Hóc Môn','1/2/1997',N'Nam','09287',N'Tiếp viên')


INSERT INTO NHANVIEN_PHONGVE VALUES
('NV0001',N'Dương Đình Vũ',N'Hà Nội','16/2/2003',N'Nam','04774828'),
('NV0002',N'Phạm Khánh Mai Vy',N'Quy Nhơn','7/6/2003',N'Nữ','095854'),
('NV0003',N'Vũ Thế Anh',N'Quận 6','8/2/2001',N'Nam','0827828'),
('NV0004',N'Lê Thị Yến Oanh',N'Quận 6','11/7/2000',N'Nữ','0387328'),
('NV0005',N'Phan Huỳnh Thiên Trang',N'Quận 2','1/2/2003',N'Nữ','0982661')

--ve
SET DATEFORMAT DMY
INSERT INTO VE VALUES ('V001','A01','VNTG',10000000,'0001','VN4897','1/7/2023','NV0001','1/5/2023')
INSERT INTO VE VALUES ('V002','A02','VNTG',10000000,'0002','VN4897','1/7/2023','NV0002','1/5/2023')
INSERT INTO VE VALUES ('V003','A12','VNTG',10000000,'0003','VN4897','1/7/2023','NV0001','2/5/2023')
INSERT INTO VE VALUES ('V004','A01','VNPTTC',1500000,'0001','VN4897','2/7/2023','NV0001','1/6/2023')
INSERT INTO VE VALUES ('V005','B01','VNPTTK',900000,'0004','VN175','1/7/2023','NV0001','3/6/2023')
INSERT INTO VE VALUES ('V006','B02','VNPTTK',900000,'0005','VN175','1/7/2023','NV0001','1/6/2023')
INSERT INTO VE VALUES ('V007','B03','VNPTTK',900000,'0006','VN4892','1/7/2023','NV0002','22/6/2023')
INSERT INTO VE VALUES ('V008','C01','VNPTTK',900000,'0007','VN210','5/6/2023','NV0003','3/6/2023')
INSERT INTO VE VALUES ('V009','A02','VNPTTK',900000,'0001','VN210','5/6/2023','NV0004','2/6/2023')
INSERT INTO VE VALUES ('V010','A03','VNPTTK',900000,'0008','VN240','1/6/2023','NV0005','1/6/2023')
INSERT INTO VE VALUES ('V011','D01','VNPTTK',900000,'0009','VN240','2/6/2023','NV0002','1/6/2023')
INSERT INTO VE VALUES ('V012','D02','VNPTTK',900000,'0010','VN240','2/6/2023','NV0002','1/6/2023')
INSERT INTO VE VALUES ('V013','A02','VNPTTK',900000,'0004','VN112','2/6/2023','NV0004','1/6/2023')
INSERT INTO VE VALUES ('V014','C01','VNPTTK',900000,'0005','VN112','2/6/2023','NV0003','1/5/2023')
INSERT INTO VE VALUES ('V015','B02','VNPTTK',900000,'0010','VN112','2/6/2023','NV0005','1/5/2023')
INSERT INTO VE VALUES ('V016','E04','VNPTTK',900000,'0007','VN112','2/6/2023','NV0002','1/5/2023')
INSERT INTO VE VALUES ('V017','E04','VNPTTK',900000,'0007','VN112','2/6/2023','NV0001','1/6/2022')
INSERT INTO VE VALUES ('V018','D04','VNTG',10000000,'0015','VN1370','4/7/2023','NV0002','5/6/2023')
INSERT INTO VE VALUES ('V019','B04','VNPTDB',5000000,'0014','VN1370','4/7/2023','NV0003','4/6/2023')
INSERT INTO VE VALUES ('V020','A01','VNTG',11000000,'0013','VN1370','4/7/2023','NV0002','10/6/2023')
INSERT INTO VE VALUES ('V021','A02','VNPTTK',1000000,'0012','VN112','7/6/2023','NV0001','1/6/2023')



INSERT INTO HANHLY VALUES
('H0001',N'L001',6,'V001','NV0001','1/5/2023'),
('H0002',N'L002',20,'V001','NV0001','1/5/2023'),
('H0003',N'L002',0,'V002','NV0002','1/5/2023'),
('H0004',N'L002',15,'V003','NV0001','2/5/2023'),
('H0005',N'L001',0,'V004','NV0001','1/6/2023'),
('H0006',N'L001',0,'V005','NV0001','3/6/2023'),
('H0007',N'L001',0,'V006','NV0001','1/6/2023'),
('H0008',N'L001',0,'V007','NV0002','22/6/2023'),
('H0009',N'L002',20,'V007','NV0002','22/6/2023'),
('H0010',N'L002',8,'V008','NV0003','3/6/2023'),
('H0011',N'L002',17,'V008','NV0003','3/6/2023'),
('H0012',N'L001',7,'V009','NV0004','2/6/2023'),
('H0013',N'L001',8,'V010','NV0005','1/6/2023'),
('H0014',N'L003',9,'V010','NV0001','1/6/2023'),
('H0015',N'L001',10,'V011','NV0002','1/6/2023')



--PHANCONG
SET DATEFORMAT DMY
INSERT INTO PHANCONG VALUES
('NV001','VN4897','1/7/2023'),
('NV002','VN4897','1/7/2023'),
('NV003','VN4897','1/7/2023'),
('NV004','VN4892','1/7/2023'),
('NV005','VN4892','1/7/2023'),
('NV006','VN4892','1/7/2023')
INSERT INTO PHANCONG VALUES
('NV003','VN112','2/6/2023'),
('NV004','VN112','2/6/2023'),
('NV007','VN112','2/6/2023'),
('NV008','VN112','2/6/2023'),
('NV009','VN112','2/6/2023'),
('NV010','VN112','2/6/2023')
INSERT INTO PHANCONG VALUES
('NV004','VN240','1/6/2023'),
('NV005','VN240','1/6/2023'),
('NV001','VN240','1/6/2023'),
('NV002','VN240','1/6/2023'),
('NV008','VN240','1/6/2023')
INSERT INTO PHANCONG VALUES
('NV006','VN4897','2/7/2023'),
('NV005','VN4897','2/7/2023'),
('NV001','VN4897','2/7/2023'),
('NV002','VN4897','2/7/2023'),
('NV008','VN4897','2/7/2023')

--------------------------------------------------------------------------
------------------------------------------------------------------------------


--trigger
--1. RÀNG BUỘC VỀ GIỚI HẠN KHỐI LƯỢNG HÀNH LÝ :
--HÀNH LÝ XÁCH TAY: 
-----------PHỔ THÔNG LINH HOẠT, PHỔ THÔNG TIÊU CHUẨN, PHỔ THÔNG TIẾT KIỆM,PHỔ THÔNG SIÊU TIẾT KIỆM: 12KG 
-----------PHỔ THÔNG ĐẶC BIỆT, THƯƠNG GIA: 18KG
--HÀNH LÝ KÝ GỬI
-----MIỄN CƯỚC: 
		--PHỔ THÔNG, PHỔ THÔNG ĐẶC BIỆT 23KG
		--THƯƠNG GIA: 32KG
GO
CREATE TRIGGER CHECK_KLHL ON HANHLY
FOR INSERT, UPDATE
AS BEGIN
	DECLARE @MAHL CHAR(6),@MAHG CHAR(6), @KLHL FLOAT, @KLTD FLOAT
	SELECT @MAHL=I.MAHL,@MAHG=V.MAHG
	FROM inserted I , VE V
	WHERE V.MAVE=I.MAVE
	SELECT 	@KLHL=H.KHOILUONG,@KLTD=LH.KL_TOIDA
	FROM LOAIHL_HANGGHE LH, HANHLY H
	WHERE H.MAHL=@MAHL AND LH.MALOAI = H.MALOAI  AND @MAHG=LH.MAHG

	IF	( @KLHL> @KLTD)
			BEGIN
			ROLLBACK TRANSACTION
			RAISERROR('KHỐI LƯỢNG HÀNH LÝ KHÔNG HỢP LỆ',16,1)
			END
		END 
--KIEM TRA

-- H0001 LÀ HÀNH LÝ L001 (XÁCH TAY), THUỘC VÉ V001 
--CÓ HẠNG LÀ THƯƠNG GIA ,KHỐI LƯỢNG KHÔNG ĐƯỢC QUÁ 18KG
SELECT * FROM HANHLY, VE WHERE HANHLY.MAVE = VE.MAVE AND HANHLY.MAHL='H0001'
UPDATE HANHLY
SET KHOILUONG=19
WHERE MAHL='H0001' --LOI
UPDATE HANHLY
SET KHOILUONG=15
WHERE MAHL='H0001'-- THANH CONG
--H0006 LÀ HÀNH LÝ L001 (XÁCH TAY),THUỘC VÉ V005, 
--CÓ HẠNG GHẾ LÀ PHỔ THÔNG TIẾT KIỆM, KHỐI LƯỢNG KHÔNG ĐƯỢC QUÁ 12KG
SELECT * FROM HANHLY, VE WHERE HANHLY.MAVE = VE.MAVE AND HANHLY.MAHL='H0006'
UPDATE HANHLY
SET KHOILUONG=11
WHERE MAHL='H0006'-- THANH CONG

UPDATE HANHLY
SET KHOILUONG=13
WHERE MAHL='H0006'-- lỗi

--XÓA
DROP TRIGGER CHECK_KLHL


--2.NGÀY MUA VÉ PHẢI NHỎ HƠN HOẶC BẰNG NGÀY BAY
GO
CREATE TRIGGER CHECK_NGMUA
ON VE
FOR INSERT, UPDATE
AS BEGIN
	DECLARE @NGMUA DATE, @NGBAY DATE
	SELECT @NGMUA=I.NGMUA ,@NGBAY=I.NGCHUYENBAY
	FROM  INSERTED I
	IF (@NGMUA > @NGBAY)
	BEGIN
		ROLLBACK TRANSACTION
		RAISERROR (N'NGÀY MUA VÉ KHÔNG ĐƯỢC LỚN HƠN NGÀY BAY',16,1)
	END
END
--TEST
SELECT *FROM VE
UPDATE VE SET NGMUA='2025-1-1' WHERE MAVE='V001'--LOI
UPDATE VE SET NGMUA='2023-5-1' WHERE MAVE='V001'--THÀNH CÔNG

--XÓA
DROP TRIGGER CHECK_NGMUA

------------------------------------------------------------------------------
--3.TRIGGER CẬP NHẬT SỐ LƯỢNG GHẾ TRỐNG KHI CÓ KHÁCH HÀNG ĐẶT, HỦY VÉ
GO
CREATE TRIGGER UPDATE_SLGHE  ON VE 
FOR INSERT	
AS
BEGIN
	DECLARE @MACB CHAR(6) ,@NGCB DATE
	SELECT @MACB=I.MACB , @NGCB=I.NGCHUYENBAY
	FROM INSERTED I
	BEGIN 
		UPDATE CHUYENBAY
		SET SOGHETRONG=SOGHETRONG-1
		WHERE CHUYENBAY.MACB = @MACB AND CHUYENBAY.NGCHUYENBAY=@NGCB
	END
	end
GO
CREATE TRIGGER UPDATE_SLGHE1 ON VE
FOR DELETE
AS BEGIN
	DECLARE @MACB CHAR(6) ,@NGCB DATE
	SELECT @MACB=I.MACB , @NGCB=I.NGCHUYENBAY
	FROM deleted I
	UPDATE CHUYENBAY
	SET SOGHETRONG=SOGHETRONG+1
	WHERE CHUYENBAY.MACB = @MACB AND CHUYENBAY.NGCHUYENBAY=@NGCB
	end
--TEST 
SET DATEFORMAT DMY
INSERT INTO VE VALUES ('V017','E04','VNPTTK',900000,'0007','VN4897','2/7/2023','NV0002','1/1/2023')
DELETE FROM VE WHERE MAVE='V017'
--XÓA
DROP TRIGGER UPDATE_SLGHE
DROP TRIGGER UPDATE_SLGHE1

UPDATE CHUYENBAY SET SOGHETRONG=200



--------------------------------------------------------------------------
------------------------------------------------------------------------------
--proc

--1. ĐƯA VÀO THÔNG TIN NƠI ĐI , NƠI ĐẾN VÀ NGÀY. XUẤT RA CÁC CHUYẾN BAY TỪ NƠI ĐI VÀ ĐẾN NGÀY HÔM ĐÓ
--> ĐỐI TƯỢNG SỬ DỤNG: NHÂN VIÊN VÀ KHÁCH HÀNG
GO
CREATE PROCEDURE PROC_CB 
	@SBDI NVARCHAR (50), @SBDEN NVARCHAR(50), @NGCB DATE
AS BEGIN
IF EXISTS (	SELECT *
			FROM CHUYENBAYTINH CT, CHUYENBAY C
			WHERE CT.MACB=C.MACB AND CT.NOIDI=@SBDI AND CT.NOIDEN=@SBDEN AND C.NGCHUYENBAY=@NGCB)
			BEGIN
				SELECT C.MACB, C.NGCHUYENBAY,CT.TG_CATCANH,CT.TG_HACANH
				FROM CHUYENBAYTINH CT, CHUYENBAY C
				WHERE CT.MACB=C.MACB AND CT.NOIDI=@SBDI AND CT.NOIDEN=@SBDEN AND C.NGCHUYENBAY=@NGCB
			END
			ELSE BEGIN
			PRINT (N'KHÔNG TÌM THẤY CHUYẾN BAY NÀO')
			END
		END
-- THUC THI VA KIEM TRA
SET DATEFORMAT DMY
DECLARE @SBDI NVARCHAR (50), @SBDEN NVARCHAR(50), @NGCB DATE
SET @SBDI=N'TPHCM' SET @SBDEN=N'Hà Nội' SET @NGCB='1/7/2023'
EXEC PROC_CB @SBDI, @SBDEN, @NGCB
--XOA
DROP PROC PROC_CB

--2.ĐƯA VÀO MACB VÀ NGCHUYENBAY, CHO BIẾT TỔNG TIỀN THU ĐƯỢC(BAO GỒM TIỀN VÉ VÀ HÀNH LÝ)TỪ CHUYẾN BAY ĐÓ, NẾU 
--KHÔNG TÌM THẤY TRẢ VỀ 0
--> ĐỐI TƯỢNG SỬ DỤNG: NHÂN VIÊN
GO
CREATE PROCEDURE PROC_TOTAL_MONEY
	@MACB CHAR(6), @NGCHUYENBAY DATE, @TOTAL MONEY OUTPUT
AS BEGIN
	IF EXISTS ( SELECT * 
				FROM CHUYENBAY
				WHERE MACB=@MACB AND NGCHUYENBAY=@NGCHUYENBAY)
				BEGIN
					SELECT @TOTAL=SUM(VE.GIA) + SUM(L.GIA)
					FROM VE, HANHLY H, LOAIHL L
					WHERE VE.MAVE=H.MAVE AND H.MALOAI=L.MALOAI AND VE.MACB=@MACB AND VE.NGCHUYENBAY=@NGCHUYENBAY
				END
				ELSE BEGIN
					SET @TOTAL=0
				END
			END
--THUC THI VA KIEM TRA---------------
SET DATEFORMAT DMY
DECLARE @MACB CHAR(6), @NGCHUYENBAY DATE, @TOTAL MONEY
SET @MACB='VN4892' SET @NGCHUYENBAY='1/7/2023'			
EXEC PROC_TOTAL_MONEY @MACB, @NGCHUYENBAY, @TOTAL OUTPUT
PRINT (N'TỔNG TIỀN THU ĐƯỢC CỦA CHUYẾN BAY ') + @MACB +(N' NGÀY ') + 
CAST(@NGCHUYENBAY AS NVARCHAR)+N' LÀ: '
+CAST(@TOTAL AS NVARCHAR)
--XOA
DROP PROC PROC_TOTAL_MONEY
--3. THAM SỐ VÀO LÀ MAKH, XEM LỊCH SỬ MUA VÉ CỦA KHÁCH HÀNG
--> sử dụng cho khách hàng và nhân viên 
GO 
CREATE PROCEDURE LS_VE
	@MAKH CHAR(6)
AS BEGIN
	IF EXISTS ( SELECT *
				FROM KHACHHANG
				WHERE MAKH=@MAKH)
		BEGIN
			SELECT MAVE, SOGHE, MAHG, GIA, MACB, NGCHUYENBAY, NGMUA
			FROM VE
			WHERE MAVE IN (	SELECT VE.MAVE
							FROM VE , KHACHHANG K
							WHERE K.MAKH= VE.MAKH AND K.MAKH=@MAKH)
		END
	END
--TEST
EXEC LS_VE '0001'
--XOA
DROP PROC LS_VE
--4. KHI CÓ SỰ CỐ CHUYẾN BAY BỊ HỦY, BỊ DELAY, NHẬP VÀO THÔNG TIN CHUYẾN BAY CŨ VÀ MỚI
--ĐỂ CHUYỂN HẾT THÔNG TIN HÀNH KHÁCH QUA CHUYẾN BAY MỚI.
--> đối tượng sử dụng: NHÂN VIÊN
GO
CREATE PROCEDURE DOI_CB 
	@CB_CU CHAR (6), @NGBAY_CU DATE, @CB_MOI CHAR(6), @NGBAY_MOI DATE
AS BEGIN
	IF EXISTS (	SELECT *
				FROM CHUYENBAY
				WHERE MACB=@CB_CU AND NGCHUYENBAY=@NGBAY_CU
				)BEGIN 
				IF EXISTS (
				SELECT *
				FROM CHUYENBAY
				WHERE MACB=@CB_MOI AND NGCHUYENBAY=@NGBAY_MOI)
				BEGIN
					UPDATE  VE SET MACB=@CB_MOI, NGCHUYENBAY=@NGBAY_MOI WHERE NGCHUYENBAY=@NGBAY_CU AND MACB=@CB_CU
					END
				END 
END
--KIEM TRA
EXEC DOI_CB 'VN112','2023-06-02','VN125','2023-06-17'
SELECT * FROM CHUYENBAY
SELECT *FROM VE WHERE MACB='VN112' AND NGCHUYENBAY='2023-06-02'
SELECT *FROM VE WHERE MACB='VN125' AND NGCHUYENBAY='2023-06-17'
--KHÔI PHỤC
EXEC DOI_CB 'VN125','2023-06-17','VN112','2023-06-02'

--XOA
DROP PROC DOI_CB




--------------------------------------------------------------------------
------------------------------------------------------------------------------


--FUNCTION
--1. HÀM CHO BIẾT TỔNG TIỀN ĐÃ BỎ RA CỦA KHÁCH HÀNG( BẢO GỒM VÉ VÀ HÀNH LÝ)
--THAM SỐ VÀO LÀ MÃ KHÁCH HÀNG
--> KHÁCH HÀNG XEM TIỀN MÌNH ĐÃ DÙNG
-->NHÂN VIÊN DÙNG
GO
CREATE FUNCTION TONGTIEN_KH
	(@MAKH CHAR(6))	
	RETURNS FLOAT
AS BEGIN
	DECLARE @TONG FLOAT
	IF EXISTS (SELECT * FROM KHACHHANG WHERE MAKH=@MAKH)
	BEGIN
			IF EXISTS (	SELECT *
						FROM KHACHHANG K, VE V
						WHERE K.MAKH=V.MAKH AND K.MAKH=@MAKH)
			BEGIN
			SELECT @TONG=SUM(TIEN.GIA)
			FROM (	SELECT K.MAKH, H.MAHL AS MA, L.GIA, H.NGMUA
				FROM HANHLY H,KHACHHANG K,LOAIHL L,VE V
				WHERE  K.MAKH=V.MAKH AND V.MAVE=H.MAVE AND H.MALOAI=L.MALOAI
				UNION
				SELECT K.MAKH, V.MAVE AS MA, V.GIA, V.NGMUA
				FROM KHACHHANG K,VE V
				WHERE  K.MAKH=V.MAKH ) AS TIEN
			WHERE @MAKH=TIEN.MAKH
			END
			ELSE SET @TONG=0
	END
	ELSE SET @TONG=0
	RETURN @TONG
END;
--KIỂM TRA
SELECT SUM(V.GIA) AS GIAVE
FROM KHACHHANG K, VE V
WHERE K.MAKH=V.MAKH AND K.MAKH='0001'

SELECT SUM(L.GIA) AS GIAHL
FROM KHACHHANG K, VE V,HANHLY H, LOAIHL L
WHERE K.MAKH=V.MAKH AND V.MAVE=H.MAVE AND H.MALOAI=L.MALOAI AND K.MAKH='0001'
SELECT DBO.TONGTIEN_KH ('0001') AS TONGTIEN
--XÓA
DROP FUNCTION DBO.TONGTIEN_KH

--2. trả về DOANH THU bán được trong tháng của 1 nhân viên theo tên nhân viên, SDT,tháng và năm nhập vào
GO
CREATE FUNCTION DOANHTHU_NV
	(@TENNV NVARCHAR(50),@SDT CHAR(10), @MONTH INT, @YEAR INT)	
	RETURNS FLOAT
AS BEGIN
	DECLARE @TONG FLOAT
	IF (@MONTH >0 AND @MONTH <=12) BEGIN
	IF EXISTS (SELECT * FROM NHANVIEN_PHONGVE WHERE TENNV=@TENNV AND SDT =@SDT)
	BEGIN
		SELECT	@TONG=SUM(TIEN.GIA)
		FROM	(SELECT NV.MANV, MAHL, L.GIA, H.NGMUA
				FROM HANHLY H,NHANVIEN_PHONGVE NV,LOAIHL L
				WHERE  H.MANV=NV.MANV AND H.MALOAI=L.MALOAI
				UNION
				SELECT NV.MANV, V.MAVE, V.GIA, V.NGMUA
				FROM NHANVIEN_PHONGVE NV, VE V
				WHERE NV.MANV=V.MANV
				) AS TIEN, NHANVIEN_PHONGVE NV
		WHERE TIEN.MANV=NV.MANV AND NV.TENNV=@TENNV AND NV.SDT=@SDT AND MONTH(TIEN.NGMUA)=@MONTH AND YEAR(TIEN.NGMUA)=@YEAR
	END
	END
	ELSE SET @TONG=0
	RETURN @TONG
END;
SELECT *FROM NHANVIEN_PHONGVE

--KIEM TRA
SELECT DBO.DOANHTHU_NV (N'Dương Đình Vũ','04774828',6,2023) AS TONGTIEN
--TIỀN VÉ DO Dương Đình Vũ BÁN
SELECT SUM(GIA)
FROM VE 
WHERE MANV='NV0001' AND MONTH(NGMUA)=6 AND YEAR (NGMUA)=2023
--TIỀN HÀNH LÝ DO Dương Đình Vũ BÁN
SELECT SUM(L.GIA)
FROM  HANHLY H, LOAIHL L
WHERE H.MANV='NV0001'  AND H.MALOAI=L.MALOAI AND MONTH(H.NGMUA)=6 AND YEAR (H.NGMUA)=2023

--XOA 
DROP FUNCTION DBO.DOANHTHU_NV

--3. TRẢ VỀ TỔNG DOANH THU THEO THÁNG NHẬP VÀ NĂM NHẬP  VÀO
GO
CREATE FUNCTION DOANHTHU
	(@THANG INT, @NAM INT)
	RETURNS FLOAT 
AS BEGIN
	DECLARE @MONEY FLOAT
	IF (@THANG>0 AND @THANG <=12)
	BEGIN
		SELECT @MONEY=SUM(TB.GIA)
		FROM (
			SELECT V.MACB, V.NGCHUYENBAY,V.MAVE, V.GIA
			FROM  VE V
			WHERE  MONTH(V.NGMUA)=6 AND YEAR (V.NGMUA)=2023
			UNION 
			SELECT V.MACB,V.NGCHUYENBAY,H.MAHL ,L.GIA
			FROM HANHLY H,VE V,LOAIHL L
			WHERE H.MALOAI=L.MALOAI AND H.MAVE=V.MAVE AND MONTH(H.NGMUA)=6 AND YEAR (H.NGMUA)=2023
			) AS TB
	END
	ELSE 
	SET @MONEY=0
	RETURN @MONEY
END;

--KIỂM TRA
SELECT dbo.DOANHTHU (6,2023) AS DOANHTHU
--XOA
DROP FUNCTION DOANHTHU


--4. THAM SỐ VÀO LÀ MÃ CHUYẾN BAY VÀ NGÀY CHUYẾN BAY, CHO BIẾT VỊ TRÍ HIỆN TẠI CỦA CHUYẾN BAY
--> ĐỐI TƯỢNG SỬ DỤNG: NHÂN VIÊN, PHI CÔNG, TIẾP VIÊN
GO
CREATE FUNCTION VITRI
	(@MACB CHAR(6), @NGCB DATE)
RETURNS NVARCHAR (200)
AS BEGIN
	DECLARE @VT NVARCHAR (200)
	IF EXISTS (	SELECT *
				FROM CHUYENBAY C
				WHERE C.MACB=@MACB AND C.NGCHUYENBAY=@NGCB)
	BEGIN
	SELECT @VT=C.VITRI
	FROM CHUYENBAY C
	WHERE C.MACB=@MACB AND C.NGCHUYENBAY=@NGCB
	END
	RETURN @VT
END;


--VIEW CRYSTAL REPORT
--TẠO VIEW THỐNG KÊ DANH SÁCH NHỮNG KHÁCH HÀNG(MAKH, TENKH) VÀ TỔNG TIỀN KHÁCH HÀNG BỎ RA, SẮP XẾP GIẢM DẦN
--TẠO VIEW CHO BIẾT CÁC 

GO
CREATE VIEW KH_SLVE_VIEW
AS 
SELECT K.MAKH, K.TENKH , DBO.TONGTIEN_KH(K.MAKH) AS TONGTIEN
FROM KHACHHANG K
ORDER BY TONGTIEN DESC OFFSET 0 ROWS
--KIEMTRA
SELECT * FROM VE
SELECT *FROM KH_SLVE_VIEW
--XOA
DROP VIEW KH_SLVE_VIEW

--VIEW 
--THỐNG KÊ DANH SÁCH BÁN VÉ CỦA NHÂN VIÊN, NHÂN VIÊN NÀO BÁN CHẠY TRONG THÁNG
GO
CREATE VIEW DS_NV
AS 
SELECT NV.MANV, NV.TENNV,DBO.DOANHTHU_NV(NV.TENNV,NV.SDT,6,2023) AS TIEN
FROM NHANVIEN_PHONGVE NV
ORDER BY TIEN DESC OFFSET 0 ROWS

SELECT * FROM DS_NV



--------------------------------------------------------------------------
------------------------------------------------------------------------------

--PHÂN QUYỀN
--KHACHHANG:
--Tìm kiếm thông tin chuyến bay
--Mua ve, Huy ve
--Xem thông tin vé đã mua
--Xem thông tin hạng ghế
--XEM THÔNG TIN VỀ GIÁ HÀNH LÝ, KHỐI LƯỢNG TỐI ĐA
---NHANVIEN:
--Dặt hủy vé
--Sửa vé
--Them sửa thông tin chuyến bay, máy bay
--Tạo báo cáo tổng số vé  theo từng chuyến bay theo tháng
--TẠO LOGIN
USE MASTER 
CREATE LOGIN KH1 WITH PASSWORD ='21522804'
CREATE USER KH1 FOR LOGIN KH1
CREATE ROLE KHACHHANG
USE QLCB
EXEC SP_ADDROLEMEMBER 'DB_DATAWRITER','KHACHHANG'
EXEC SP_ADDROLEMEMBER 'DB_DATAREADER','KHACHHANG'
EXEC SP_ADDROLEMEMBER 'KHACHHANG','KH1'

DENY UPDATE, DELETE ON HANHLY TO KHACHHANG 
DENY INSERT, UPDATE, DELETE ON LOAIHL TO KHACHHANG
DENY INSERT, UPDATE, DELETE ON LOAIHL_HANGGHE TO KHACHHANG
DENY INSERT, UPDATE, DELETE ON HANGGHE TO KHACHHANG
DENY UPDATE ON VE TO KHACHHANG
DENY INSERT, UPDATE, DELETE ON CHUYENBAYTINH TO KHACHHANG
DENY INSERT, UPDATE, DELETE ON CHUYENBAY TO KHACHHANG
DENY UPDATE, DELETE,SELECT ON KHACHHANG TO KHACHHANG
DENY SELECT, INSERT, UPDATE, DELETE ON LOAIMB TO KHACHHANG
DENY SELECT, INSERT, UPDATE, DELETE ON MAYBAY TO KHACHHANG
DENY SELECT, INSERT, UPDATE, DELETE ON NHANVIEN_MB TO KHACHHANG
DENY SELECT, INSERT, UPDATE, DELETE ON NHANVIEN_PHONGVE TO KHACHHANG
DENY SELECT, INSERT, UPDATE, DELETE ON PHANCONG TO KHACHHANG
--TEST
--1. xem thông tin chuyến bay
--thông tin chuyến bay (CHỈ ĐƯỢC XEM)
SELECT * FROM CHUYENBAY
SELECT * FROM CHUYENBAYTINH
INSERT INTO CHUYENBAY VALUES ('VN4897','7/7/2023',200,N'Chưa hoàn thành',NULL,NULL,'MB001')
DELETE FROM CHUYENBAY WHERE MACB='VN4897' AND NGCHUYENBAY ='1/7/2023'
UPDATE  CHUYENBAY SET TRANGTHAI=N'CHƯA'
INSERT INTO CHUYENBAYTINH VALUES ('VN48','5:45:00','7:55:00' ,N'TPHCM', N'Hà Nội')
DELETE FROM CHUYENBAYTINH
UPDATE CHUYENBAYTINH SET NOIDI=N' ĐÀ LẠT'

--2. KHÁCH HÀNG CHỈ ĐƯỢC XEM THÔNG TIN HÀNH LÝ HÀNH LÝ (BAO GỒM HANHLY, LOAIHL, LOAIFL_HANGGHE)
SELECT * FROM LOAIHL
SELECT * FROM HANHLY
SELECT * FROM LOAIHL_HANGGHE

--2. KHÁCH HÀNG CÓ THỂ MUA, HỦY VÉ CỦA MÌNH, XEM THÔNG TIN VÉ, XEM THÔNG TIN HẠNG GHẾ
--VE
SELECT * FROM VE
INSERT INTO VE VALUES ('V091','A02','VNPTTK',1000000,'0012','VN112','7/6/2023','NV0001','1/6/2023')
DELETE FROM VE WHERE MAVE='V0001'
UPDATE VE SET SOGHE='AK'

--HẠNG GHẾ (CHỈ ĐƯỢC XEM)
SELECT * FROM HANGGHE
INSERT INTO HANGGHE VALUES ('VNT',N'Thương gia',N'Hoàn vé miễn phí',N'Bữa ăn cao cấp trên máy bay,quầy thủ tục ưu tiên, lối lên máy bay ưu tiên, chọn chỗ trước, đổi vé miễn phí')
DELETE FROM HANGGHE
UPDATE HANGGHE SET HOANTIEN='KSJ' 
--3. KHÁCH HÀNG CÓ THỂ THÊM THÔNG TIN CÁ NHÂN, XEM THÔNG TIN CÁ NHÂN CỦA MÌNH
SELECT * FROM KHACHHANG
INSERT INTO KHACHHANG VALUES('0111',  N'Phạm Anh Vũ', N'223 Nguyen Trai', '22/1/2000','0000001')
DELETE FROM KHACHHANG WHERE MAKH='0001'


---	NHANVIEN:
CREATE LOGIN NV WITH PASSWORD ='21522885'
CREATE USER NV FOR LOGIN NV

--1. QUẢN LÝ THÔNG TIN CỦA VÉ MÁY BAY (CÓ THỂ THÊM, XOÁ, SỬA, XEM)
--2. QUẢN LÝ THÔNG TIN KHÁCH HÀNG (CÓ THỂ THÊM, XOÁ, SỬA, XEM)
--3. QUẢN LÝ THÔNG TIN CHUYẾN  BAY (CÓ THỂ THÊM, XOÁ, SỬA, XEM)
--4. QUẢN LÝ THÔNG TIN HÀNH LÝ(CÓ THỂ THÊM, XOÁ, SỬA, XEM)
--5. QUẢN LÝ THÔNG TIN CỦA MÁY BAY (CÓ THỂ THÊM, XOÁ, SỬA, XEM)
--6. XEM DANH SÁCH NHÂN VIÊN (KHÔNG THỂ THÊM, XOÁ, SỬA, XEM)
--7. XEM DANH SÁCH PHÂN CÔNG (KHÔNG THỂ THÊM, XOÁ, SỬA, XEM)

CREATE LOGIN NV WITH PASSWORD ='21522885'
CREATE USER NV FOR LOGIN NV
CREATE ROLE NHANVIEN


EXEC SP_ADDROLEMEMBER 'DB_DATAWRITER','NHANVIEN'
EXEC SP_ADDROLEMEMBER 'DB_DATAREADER','NHANVIEN'
EXEC SP_ADDROLEMEMBER 'NHANVIEN','NV'
DENY SELECT,INSERT, UPDATE, DELETE ON NHANVIEN_PHONGVE TO NHANVIEN
DENY SELECT,INSERT, UPDATE, DELETE ON NHANVIEN_MB TO NHANVIEN
DENY INSERT, UPDATE, DELETE ON PHANCONG TO NHANVIEN


--1. KHÔNG THỂ XEM DANH SÁCH NHÂN VIÊN 
SELECT * FROM NHANVIEN_MB
INSERT INTO NHANVIEN_MB VALUES ('NV111',N'Nguyễn Hồ Lan Trinh',N'Hà Nội','16/2/2000',N'Nữ','0000922',N'Tiếp viên')
UPDATE NHANVIEN_MB SET TENNV= N'A' WHERE MANV='NV001'
DELETE FROM NHANVIEN_MB WHERE MANV='NV111'
SELECT * FROM NHANVIEN_PHONGVE
INSERT INTO NHANVIEN_PHONGVE VALUES 
('NV111',N'Nguyễn Hồ Lan Trinh',N'Hà Nội','16/2/2000',N'Nữ','0000922')
UPDATE NHANVIEN_PHONGVE SET TENNV= N'A' WHERE MANV='NV111'
DELETE FROM NHANVIEN_PHONGVE WHERE MANV='NV111'

--2. XEM DANH SÁCH PHÂN CÔNG (CÓ THỂ THÊM, XOÁ, SỬA, XEM)
SELECT * FROM PHANCONG
INSERT INTO PHANCONG VALUES ('NV009','VN4897','2/7/2023')

--3. QUẢN LÝ THÔNG TIN CỦA VÉ MÁY BAY (CÓ THỂ THÊM, XOÁ, SỬA, XEM)
SELECT * FROM VE
SET DATEFORMAT DMY
INSERT INTO VE VALUES ('V121','A02','VNPTTK',1000000,'0012','VN112','7/6/2023','NV0001','1/6/2023')
UPDATE VE SET GIA = 0 WHERE MAVE='V121'
DELETE FROM VE WHERE MAVE='V121'

SELECT * FROM HANGGHE
INSERT INTO HANGGHE VALUES ('VNDB',N'Phổ thông ',N'Thu phí 500000',N'Bữa ăn trên máy bay')
UPDATE HANGGHE SET TENHG=N'VNDB' WHERE MAHG='VNDB'
DELETE FROM HANGGHE WHERE MAHG='VNDB'

--4. QUẢN LÝ THÔNG TIN KHÁCH HÀNG (CÓ THỂ THÊM, XOÁ, SỬA, XEM)
SELECT * FROM VE
INSERT INTO KHACHHANG VALUES ('1111',  N'Phạm Vũ', N'223 Nguyen Trai', '22/1/2000','0000001')
UPDATE KHACHHANG SET TENKH= N'H VU' WHERE MAKH='1111'
DELETE FROM KHACHHANG WHERE MAKH='1111'

--5. QUẢN LÝ THÔNG TIN CHUYẾN  BAY (CÓ THỂ THÊM, XOÁ, SỬA, XEM)
SELECT * FROM CHUYENBAYTINH
INSERT INTO CHUYENBAYTINH VALUES  ('VN1','6:10:00','7:55:00' ,N'TPHCM', N'Hà Nội')
UPDATE CHUYENBAYTINH SET TG_CATCANH= '6:00:00' WHERE MACB='VN1'
DELETE FROM CHUYENBAYTINH WHERE MACB='VN1'

SELECT * FROM CHUYENBAY
INSERT INTO CHUYENBAY  VALUES ('VN175','1/1/2023',200,N'Chưa hoàn thành',NULL,NULL,'MB001')
UPDATE CHUYENBAY SET TRANGTHAI= N'Hoàn Thành' WHERE MACB='VN1'
DELETE FROM CHUYENBAY WHERE MACB='VN175' AND NGCHUYENBAY='1/1/2023'

--6. QUẢN LÝ THÔNG TIN HÀNH LÝ(CÓ THỂ THÊM, XOÁ, SỬA, XEM)
SELECT * FROM LOAIHL
INSERT INTO LOAIHL VALUES ('L004',N'Xách tay',0),
UPDATE LOAIHL SET GIA= 1 WHERE MACB='L004'
DELETE FROM LOAIHL WHERE MALOAI='L004'

SELECT * FROM HANHLY
INSERT INTO HANHLY VALUES ('H111',N'L001',6,'V001')
UPDATE HANHLY SET KHOILUONG= 1 WHERE MAHL='H111'
DELETE FROM HANHLY WHERE MAHL='H111'

--7. QUẢN LÝ THÔNG TIN CỦA MÁY BAY (CÓ THỂ THÊM, XOÁ, SỬA, XEM)
SELECT * FROM MAYBAY
INSERT INTO MAYBAY VALUES('MB111','L001')
UPDATE MAYBAY SET MALOAI= 'L002' WHERE MAMB='MB111'
DELETE FROM MAYBAY WHERE MAMB='L004'
SET DATEFORMAT DMY
SELECT * FROM LOAIMB
INSERT INTO LOAIMB VALUES ('L111',N'Boeing 787')
UPDATE LOAIMB SET TENLOAI= N'BOEING' WHERE MALOAI='L111'
DELETE FROM LOAIMB WHERE MALOAI='L111'
DELETE FROM PHANCONG WHERE MANV='NV006' AND MACB='VN4897' AND NGCHUYENBAY='2/7/2023'




------BACKUP
BACKUP DATABASE QLCB TO DISK= 'D:\doan_lt\QLCB.BAK'
------DELETE
DROP DATABASE QLCB
------RESTORE
RESTORE DATABASE QLCB FROM DISK = 'D:\doan_lt\QLCB.BAK'

