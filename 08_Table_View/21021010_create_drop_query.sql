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

drop table  buyTbl;
drop table userTbl;

create table userTbl --부모
(
	userID		char(8)			not null	primary key,
	userName	nvarchar(10)	not null,	
	birthYear	int				not null	default year(getdate()),
	addr		nchar(2)		not null	default '서울',
	mobile1		char(3)			null,
	mobile2		char(8)			null,
	height		smallint		null,
	email		varchar(150)	not null	unique, 
	mDate		date			null
);
go

create table buyTbl --자식
(
	num			int				not null	primary key		identity(1,1), 
	userID		char(8)			not null	foreign key references userTbl(userID),
	prodName	nchar(6)		not null,
	groupName	nchar(4)		null,
	price		int				not null,
	amount		smallint		not null
);
go