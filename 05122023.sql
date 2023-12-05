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
#cach 2
CREATE SCHEMA `namle2` ;
CREATE TABLE `namle2`.`class` (
  `id` BIGINT NULL,
  `name` VARCHAR(45) NULL);
  CREATE TABLE `namle2`.`teacher` (
  `id` BIGINT NULL,
  `name` VARCHAR(45) NULL,
  `age` BIGINT NULL,
  `country` VARCHAR(45) NULL);