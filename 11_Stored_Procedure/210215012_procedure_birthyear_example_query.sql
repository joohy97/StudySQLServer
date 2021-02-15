use sqlDB;
go

create or alter procedure usp_ifelse
	@userName nvarchar(10)
as
	declare @birthYear int;
	select @birthYear = birthYear
	from userTbl
	where userName = @userName;

	if (@birthYear >= 1980)
	begin
		print '아직 젊군요 ..!';
	end

	else
	begin
		print '나이가 지긋 ...';
	end
go

exec usp_ifelse '이승기'