--DB 생성
use tempdb;
go

create database sqlDB;
go

--테이블 생성
use sqlDB;
go
create table userTbl -- 회원테이블
(
	userID char(8) not null primary key, --사용자 아이디
	userName nvarchar(10) not null, --이름 : name은 키워드라서 사용하면 좋지 않음.
	birthYear int not null, --출생년도
	addr nchar(2) not null, --지역(2글자만 입력)
	mobile1 char(3), --휴대폰 국번(010, 016 등)
	mobile2 char(8), --휴대폰 나머지 번호
	height smallint, --키
	mDate date --회원 가입일
);
go

create table buyTbl --구매테이블
(
	num int identity not null primary key, --순번(PK)
	userID char(8) not null --사용자 아이디(FK) 
		foreign key references userTbl(userID), --FK 설정
	prodName nvarchar(20) not null, --물품명
	groupName nchar(4), --분류
	price int not null, --단가
	amount smallint not null --수량

);
go