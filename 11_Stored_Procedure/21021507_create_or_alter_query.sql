use sqlDB;
go

create procedure usp_users --프로시저 생성
as
	select userID, userName, birthYear from userTbl;
go

alter procedure usp_users --프로시저 수정
as
	select userID, userName, birthYear from userTbl;
go

create or alter procedure usp_users -- 프로시저 생성 또는 수정
as
	select userID, userName, birthYear from userTbl;
go


exec usp_users; --프로시저 호출
