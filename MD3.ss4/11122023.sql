-- create view view1 as 
-- select s.studentId, s.studentName, m.point from student s join mark m on s.studentId = m.studentId
-- join;



-- create  index index_studentName on student(studentName); 

-- create  index index_studentName_phoneNumber on student(studentName,phoneNumber);

-- do toc do truy van
explain analyze select * from users where name like "Maxie Thiel";
-- -> Filter: (users.`name` like 'Maxie Thiel')  (cost=103 rows=111) (actual time=1.49..1.64 rows=1 loops=1)
--      -> Table scan on users  (cost=103 rows=998) (actual time=0.0788..1.48 rows=998 loops=1)
 
create index indexName on users(name);
-- -> Index range scan on users using indexName over (name = 'Maxie Thiel'), with index condition: (users.`name` like 'Maxie Thiel')  (cost=0.71 rows=1) (actual time=0.112..0.116 rows=1 loops=1)

-- tao thu tuc
delimiter // -- cap phat vung nho
create procedure insert_student(id_new varchar(4), name_new varchar(100), birthday_new date, gen_new bit, address_new text, phone_new varchar(45))
begin 
 insert into student values(id_new,name_new,birthday_new,gen_new,address_new,phone_new);
end;
-- goi thu tuc 
call insert_student('S099','Pham Quang Nui', '1999-11-11',1,'Tuyen Quang','0903545344');

-- tao thu tuc tinh diem trung cua hojc sinh theo maHS va tra ve gia tri do
delimiter // -- cap phat vung nho
create procedure cal_student_avg(stu_id varchar(4), out dtb double, out hoc_luc varchar(50))
begin 
select avg(point) into dtb  from mark m where m.studentId = stu_id;
set hoc_luc = 
case 
when dtb<6.5 then  'trung binh' 
when dtb<7 then   'kha'
when dtb<9 then 'gioi'
else  'xuat xac'
end;
end;
-- goi procedure
call cal_student_avg ('S001',@dtb,@hoc_luc);
select @dtb,@hoc_luc;

-- tao trigger
-- tao thu tuc kiem tra hoc sinh du 14 tuoi ko 
create trigger before_insert_into_student
before insert on student
for each row
begin 
if year(new.birthday)<13 then 
signal sqlstate '4500' set message_text = 'chua du 14';
end if;
end;

-- BTVN
create database Products;
use Products;
create table Products(
Id int primary key auto_increment,
productCode int,
productName varchar(45),
productPrice double check (productPrice > 0) ,
productAmount int,
productDescription varchar(100),
productStatus bit
);
insert into Products value(
1,001,'quan dai','2000',10,'xuat xu trung quoc',1
);
insert into Products value(
2,002,'quan dui','3000',11,'xuat xu nhat ban',0
);
insert into Products value(
3,003,'quan lung','4000',12,'xuat xu han quoc',1
);
create unique index id1 on products(productcode);
create unique index keyid on products(productName,productPrice);
explain analyze select * from products where productName like "quan";
ALTER TABLE products
DROP INDEX keyid;
-- truoc khi tao index
-- -> Filter: (products.productName like 'quan')  (cost=0.55 rows=1) (actual time=0.0622..0.0622 rows=0 loops=1)
--  -> Table scan on products  (cost=0.55 rows=3) (actual time=0.0518..0.0574 rows=3 loops=1)
 
-- sau khi tao index
-- -> Index range scan on products using keyid over (productName = 'quan'), with index condition: (products.productName like 'quan')  (cost=0.71 rows=1) (actual time=0.064..0.064 rows=0 loops=1)
-- tao view

CREATE VIEW view1 AS
SELECT productCode, productName, productPrice, if (productStatus=1,'An','Hien') 'trang thai'
FROM products;
-- sua doi view
CREATE OR REPLACE VIEW view1 AS
SELECT productName,  if (productStatus=1,'An','Hien') 'trang thai'
FROM products;
-- xoa view
DROP VIEW view1;


-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter // -- cap phat vung nho
create procedure productInfo()
begin 
SELECT * FROM products.products;
end;
-- goi thu tuc 
call productInfo();

-- Tạo store procedure thêm một sản phẩm mới
delimiter // -- cap phat vung nho
create procedure insert_product(id_new int, code_new int, name_new varchar(45), price_new double, amount_new int, description_new varchar(100), status_new bit)
begin 
 insert into products values(id_new,code_new,name_new,price_new,amount_new,description_new,status_new);
end;
-- goi thu tuc 
call insert_product(4,004,'quan lung ngan','6000',16,'xuat xu my',1);
-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter // -- cap phat vung nho
create procedure update_product(updateId int, code_new int, name_new varchar(45), price_new double, amount_new int, description_new varchar(100), status_new bit)
begin 
UPDATE products
SET productCode = code_new, productName = name_new, productPrice = price_new, productAmount = amount_new, productDescription = description_new, productStatus = status_new
WHERE id = updateId ;
end;
-- goi thu tuc 
call update_product(4,004,'quan lung da','6000',30,'xuat xu my',1);
-- Tạo store procedure xoá sản phẩm theo id
delimiter // -- cap phat vung nho
create procedure delete_product(deleteId int)
begin 
DELETE FROM products WHERE id = deleteId;
end;
-- goi thu tuc 
call delete_product(4);