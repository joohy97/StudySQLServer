use sqlDB;
go

create or alter proc usp_return
	@userName nvarchar(10)
as
	declare @userID char(8);
	select @userID = userID
	from userTbl
	where userName = @userName;

	if (@userID <> '') return 1; -- 이름이 있으면 1 반환
	else return 0; -- 이름이 없으면 0 반환
go

declare @retVal int;
exec @retVal = usp_return '은지원';
print @retVal