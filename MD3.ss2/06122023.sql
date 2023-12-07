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