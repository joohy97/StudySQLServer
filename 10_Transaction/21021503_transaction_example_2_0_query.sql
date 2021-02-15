use sqldb;
go

create table bankBook(
	uName nvarchar(10),
	uMoney int,
	constraint CK_money
	check (uMoney >= 0)
);
go

insert into bankBook values (N'구매자', 1000);
insert into bankBook values (N'판매자', 0);

