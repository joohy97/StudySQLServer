use sqlDB;
go

create view uv_userTbl
as
	select userID, userName, addr from userTbl;
go
