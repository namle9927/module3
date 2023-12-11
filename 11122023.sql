use thuctap;
create table khoa(
makhoa char(10),
tenkhoa char(30),
dienthoai char(10),
);
create table giangvien(
magv int,
hotengv char(30),
luong decimal(5,2),
makhoa
),






-- # tao csdl- tao 1 lan cho 1 ung dung
-- create database if not exists democsdl; 
-- #create database demosd1;
-- # tao bang
-- use democsdl;
-- create table catalogs(
-- id bigint,
-- name varchar(100),
-- description text,
-- status bit
-- ); 
-- # xoa bang
-- #drop table if exists calatogs;
-- -- alter table catalogs 
-- -- add column imageUrl text;
-- -- alter table catalogS
-- -- drop column imageurl;
-- -- alter table catalogs
-- -- modify column imageurl varchar(255);
#cach 1
-- create database namle;
-- use namle;
-- create table class(
-- id bigint, 
-- name varchar(100)
-- );
-- create table teacher(
-- id bigint,
-- name varchar(100),
-- age bigint,
-- country varchar(100)
-- );
-- #cach 2
-- CREATE SCHEMA `namle2` ;
-- CREATE TABLE `namle2`.`class` (
--   `id` BIGINT NULL,
--   `name` VARCHAR(45) NULL);
--   CREATE TABLE `namle2`.`teacher` (
--   `id` BIGINT NULL,
--   `name` VARCHAR(45) NULL,
--   `age` BIGINT NULL,
--   `country` VARCHAR(45) NULL);
create database session2;
use session2;
create table person(
-- id bigint not null unique, 
id bigint primary key auto_increment, -- id tu tang
name varchar(100),
age bigint,
sex bit
);
-- them data vao bang
insert into person(id,name,age,sex) values 
('Nguyen Nam',20,1),
('Le Nam',23,1); 
  SELECT * FROM session2.person;
--  primary key
--   foreign kry 
-- 1 dah muc co nhieu sp 
-- 1 sp chi co 1 danh muc
create table Catalog(
id int primary key auto_increment,
name varchar(100) unique not null,
description text
);
create table Product(
id int primary key auto_increment,
name varchar(100) unique not null,
description text,
price  double check(price>0),
stock int,
status bit default 1,
catalog_id int not null,
constraint fk_01 foreign key(catalog_id) references catalog(id),
constraint check_stock check(stock>0)
);
insert into catalog(name, description)
values
('ao','ao ssd'),
('dsdsdsd','sdsdsd');
insert into product(name,description, price, stock,catalog_id ) values
('quan nu','ko co gi',12,34,2);
  
  create table class (
  id int primary key auto_increment,
  name varchar(100) not null unique
  );
  create table student(
  id int primary key auto_increment,
  name varchar(100) not null unique,
  age int check(age>0) default 10,
  class_id int not null,
  constraint fk02 foreign key(class_id)references class(id)
  );
  insert into class (id,name) values
  (1,'1A');
  insert into student(id,name,class_id)values
  (1,'mick',1),
  (2,'key',1)
  ;
  update student set  name = 'loo' where id = 2;
  delete from student where id=1;
  select * from student;
  
  create database quanlybanhang;
  use quanlybanhang;
  create table customer(
  cId bigint primary key,
  cName varchar(100),
  cAge int check( cAge > 0)
  );
  create table OrderInfo(
  oId bigint primary key,
  cId bigint,
  oDate date,
  oTotalPrice double,
  constraint fk02 foreign key(cId) references customer(cId) 
  );
  create table product(
  pId bigint primary key,
  pName varchar(100) not null,
  pPrice double
  );
  create table OrderDetail(
  oId bigint,
  pId bigint,
  OderQTY varchar(100),
  constraint fko3 foreign key(oId) references orderInfo(oId),
  constraint fko4 foreign key(pId) references product(pId)
  );

# Session 2 - Thiết kế CSDL
# Các Ràng buộc (Constraint) 
-- NOT NULL 
-- UNIQUE
use session2;

create table Person(
-- id int not null unique, 
id int primary key auto_increment, -- id tự tăng và không cần nhập
name varchar(100),
age int ,
sex bit  
); 

-- Thêm dữ liệu vào bảng 
insert into Person(name,age,sex) values
('Nguyễn Văn A',20,1),
('Nguyễn Văn B',22,0)
;
insert into Person(id,name,age,sex) values
(null,'Nguyễn Văn A',20,1); 
# Error Code: 1062. Duplicate entry '1' for key 'person.PRIMARY'


-- lỗi : Error Code: 1062. Duplicate entry '1' for key 'person.id'
-- lỗi : Error Code: 1048. Column 'id' cannot be null
-- lấy dữ liệu của 1 bảng
select * from person;


-- PRIMARY KEY
-- FOREIGN KEY
-- CHECK, DEFAULT


-- CATALOG (1) và PRODUCT(n) 
-- 1 danh mục có mấy sản phẩm (1 -> n)
-- 1 sản phẩm thì thuộc mấy danh muc (1 -> 1)

create table Catalog(
id int primary key auto_increment,
name varchar(100) unique not null,
description text
);

create table Product (
id int auto_increment,
name varchar(100) unique not null,
description text,
price double check (price > 0) ,
stock int,
status bit default 1,
catalog_id int not null,  -- là 1 khóa ngoại tham chiếu tới khóa chính của bảng catalog
constraint fk_01 foreign key(catalog_id) references catalog(id) ,
constraint check_stock check(stock >0),
primary key(id)
);


insert into catalog(name , description) 
values
('áo', ' áo hàng 2nd '),
('quần', '  hàng 2nd '),
('trang sức', '  hàng 2nd ');





insert into product (name, description, price, stock, catalog_id)
values
('Quần jean nữ','không có gì',100,99, 2);
-- Error Code: 3819. Check constraint 'check_stock' is violated.

-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`session02`.`product`, CONSTRAINT `fk_01` FOREIGN KEY (`catalog_id`) REFERENCES `catalog` (`id`))


-- thêm / xóa rang buộc
alter table product 
drop constraint fk_01; 

alter table product 
add constraint fk_02 foreign key(catalog_id) references catalog(id);



-- cập nhật danh mục số 3 tên là giày
update catalog set name = 'giày',description = 'nothing'  where id= 3;

-- xóa danh mục có id  = 3
delete from catalog where id = 3;
select * from person where age>20;
select * from person where age not in (20,21,22);
select * from person where age between 20 and 22;
select * from person where sex = 1 and age>22;
select * from person where name like'%nguyen%';
select * from product;
INSERT INTO `session2`.`product` (`id`, `name`, `description`, `price`, `stock`, `status`, `catalog_id`) VALUES ('2', 'quan nam ', 'hhjhjhjh', '13', '32', '0', '1');
-- tao database quan li diem thi
create database quanlydiemthi;
use quanlydiemthi;
-- tao bang student, subject va mark
create table student(
studentId varchar(4) primary key not null,
studentName varchar(100) not null,
birthday date not null,
gender bit not null,
address text not null,
phoneNumber varchar(45) unique
);
create table subject(
subjectId varchar(4) primary key not null,
subjectName varchar(45) not null,
priority int(11) not null
);
create table mark(
subjectId varchar(4) not null,
studentId varchar(4) not null,
point double not null,
constraint fk1 foreign key (studentId) references student(studentId),
constraint fk2 foreign key (subjectId) references subject(subjectId)  
);

-- them du lieu vao cac bang
insert 	into student values('S001','Nguyen The Anh','1999-01-11',1,'Ha Noi','984678082');
insert 	into student values('S002','Dang Bao Tram','1999-12-22',0,'Lao Cai','953635333');
insert 	into student values('S003','Tran Ha Phuong','2000-05-05',0,'Nghe An','934646489');
insert 	into student values('S004','Do Tien Manh','1999-03-26',1,'Ha Noi','985644365');
insert 	into student values('S005','Pham Duy Nhat','1998-10-04',1,'Tuyen Quang','98754674');
insert 	into student values('S006','Mai Van Thai','2002-06-22',1,'Nam Dinh','925743569');
insert 	into student values('S007','Giang Gia Han','1996-01-22',0,'Phu Tho','947641276');
insert 	into student values('S008','Nguyen Ngoc Bao My','1999-08-07',0,'Ha Nam','954656444');
insert 	into student values('S009','Nguyen Tien Dat','1998-01-11',1,'Tuyen Quang','987855334');
insert 	into student values('S010','Nguyen Thieu Quang','2000-09-18',1,'Ha Noi','984786644');
insert into subject values('MH01','Toan',2);
insert into subject values('MH02','Vat Ly',2);
insert into subject values('MH03','Hoa',1);
insert into subject values('MH04','Ngu Van',1);
insert into subject values('MH05','Tieng Anh',2);
alter table mark rename column point_toan to point;
alter table mark drop column point_ly;
alter table mark drop column point_hoa ;
alter table mark drop column point_van ;
alter table mark drop column point_anh ;
insert into mark values('MH01','S001',8.5);
insert into mark values('MH02','S001',7);
insert into mark values('MH03','S001',9);
insert into mark values('MH04','S001',9);
insert into mark values('MH05','S001',5);

insert into mark values('MH01','S002',9);
insert into mark values('MH02','S002',8);
insert into mark values('MH03','S002',6.5);
insert into mark values('MH04','S002',8);
insert into mark values('MH05','S002',6);

insert into mark values('MH01','S003',7.5);
insert into mark values('MH02','S003',6.5);
insert into mark values('MH03','S003',8);
insert into mark values('MH04','S003',7);
insert into mark values('MH05','S003',7);

insert into mark values('MH01','S004',6);
insert into mark values('MH02','S004',7);
insert into mark values('MH03','S004',5);
insert into mark values('MH04','S004',6.5);
insert into mark values('MH05','S004',8);

insert into mark values('MH01','S005',5.5);
insert into mark values('MH02','S005',8);
insert into mark values('MH03','S005',7.5);
insert into mark values('MH04','S005',8.5);
insert into mark values('MH05','S005',9);

insert into mark values('MH01','S006',8);
insert into mark values('MH02','S006',10);
insert into mark values('MH03','S006',9);
insert into mark values('MH04','S006',7.5);
insert into mark values('MH05','S006',6.5);

insert into mark values('MH01','S007',9.5);
insert into mark values('MH02','S007',9);
insert into mark values('MH03','S007',6);
insert into mark values('MH04','S007',9);
insert into mark values('MH05','S007',4);

insert into mark values('MH01','S008',10);
insert into mark values('MH02','S008',8.5);
insert into mark values('MH03','S008',8.5);
insert into mark values('MH04','S008',6);
insert into mark values('MH05','S008',9.5);

insert into mark values('MH01','S009',7.5);
insert into mark values('MH02','S009',7);
insert into mark values('MH03','S009',9);
insert into mark values('MH04','S009',5);
insert into mark values('MH05','S009',10);

insert into mark values('MH01','S010',6.5);
insert into mark values('MH02','S010',8);
insert into mark values('MH03','S010',5.5);
insert into mark values('MH04','S010',4);
insert into mark values('MH05','S010',7);

-- Cập nhật dữ liệu [10 điểm]:
-- Sửa tên sinh viên có mã `S004` thành “Đỗ Đức Mạnh”.
-- Sửa tên và hệ số môn học có mã `MH05` thành “NgoạiNgữ” và hệ số là 1.
-- Cập nhật lại điểm của học sinh có mã `S009` thành (MH01 : 8.5, MH02 : 7,MH03 : 5.5, MH04 : 6,
-- MH05 : 9). 
UPDATE student SET studentname = 'Do Duc Manh' WHERE studentId = 'S004';
update subject set subjectName = 'Ngoai ngu' where subjectId = 'mh05';
UPDATE mark
SET point = CASE 
    WHEN subjectId = 'MH01' THEN 8.5
    WHEN subjectId = 'MH02' THEN 7
    WHEN subjectId = 'MH03' THEN 5.5
    WHEN subjectId = 'MH04' THEN 6
    WHEN subjectId = 'MH05' THEN 9
END
WHERE studentId = 'S009' AND subjectId IN ('MH01', 'MH02', 'MH03', 'MH04', 'MH05');
-- Xoá dữ liệu[10 điểm]:
-- Xoá toàn bộ thông tin của học sinh có mã `S010` bao gồm điểm thi ở bảng MARK và thông tin học sinh
-- này ở bảng STUDENT.
DELETE FROM mark WHERE StudentId='S010';
DELETE FROM student WHERE StudentId='S010';
-- Lấy ra tất cả thông tin của sinh viên trong bảng Student
select * from student;
-- Hiển thị tên và mã môn học của những môn có hệ số bằng 1.
select subjectName, subjectId from subject where priority  = 1;
-- Hiển thị thông tin học sinh bào gồm: mã học sinh, tên học sinh, tuổi (bằng năm hiện tại trừ
-- năm sinh) , giới tính (hiển thị nam hoặc nữ) và quê quán của tất cả học sinh.
select studentName `tên sinh viên`
,studentId `mã sinh viên` 
,year(curdate()) - year(birthday) `tuổi` 
,if(gender=1,'Nam','Nữ') `Giới tính` 
,phoneNumber `Số điện thoai`,
address `Dia chi`
from student;

-- Hiển thị thông tin bao gồm: tên học sinh, tên môn học , điểm thi của tất cả học sinh của môn
-- Toán và sắp xếp theo điểm giảm dần.
select studentName `Ten hoc sinh`,  point `Diem thi Toan`
from student
inner join mark
on student.studentId = mark.studentId
where subjectId = 'MH01'
order by  point desc;
-- Thống kê số lượng học sinh theo giới tính ở trong bảng (Gồm 2 cột: giới tính và số lượng).
select if(gender=1,'nam','nu') `gioi tinh`, count(studentId) `So luong`
from student
group by gender;
-- Tính tổng điểm và điểm trung bình của các môn học theo từng học sinh (yêu cầu sử dụng hàm
-- để tính toán) , bảng gồm mã học sinh, tên hoc sinh, tổng điểm và điểm trung bình.
select s.studentName,s.studentId, avg(m.point) from student s join mark m 
on s.studentId = m.studentId
group by s.studentId
-- having avg(m.point)>7.5
order by avg(m.point) desc;