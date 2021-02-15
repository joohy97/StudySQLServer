use sqlDB;
go

create or alter procedure plusNew
	@p1 int,
	@p2 int,
	@pout int output
as
	select @pout = @p1 + @p2;
go

declare @newResult int;
set @newResult = 0;
exec plusNew 3, 4, @newResult output;
print @newResult;