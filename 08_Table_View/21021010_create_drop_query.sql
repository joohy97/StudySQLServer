/*
use sqlDB;
go
*/

--테이블 만들기
--create table testTbl (num int);

--테이블 삭제하기
--drop table testTbl;

/*
use tempdb;
go
drop database tableDB;
go
create database tableDB;
*/

use tableDB;
go
create table userTbl
(
	userID		char(8),
	userName	nvarchar(10),
	birthYear	int,
	addr		nchar(2),
	mobile1		char(3),
	mobile2		char(8),
	height		smallint,
	mDate		date
);
go
create table buyTbl
();
go