use sqlDB;
go

/*
exec usp_users '김경호';
exec usp_users2 1970, 170;
*/

declare @myValue int;
exec usp_users4 '테스트값 2', @myValue output;

print concat('현재 입력된 값 : ', @myValue);
select @myValue;