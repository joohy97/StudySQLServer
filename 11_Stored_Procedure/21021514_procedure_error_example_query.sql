﻿use sqlDB;
go

create or alter procedure usp_error
	@userID char(8),
	@userName nvarchar(10),
	@birthYear int = 1900,
	@addr nchar(2) = '서울',
	@mobile1 char(3) = null,
	@mobile2 char(8) = null,
	@height smallint = 170,
	@mDate date = '2021-02-15'
as
	declare @err int;
	insert into userTbl values
		(@userID,
		 @userName,
		 @birthYear,
		 @addr,
		 @mobile1,
		 @mobile2,
		 @height,
		 @mDate);
	
	select @err = @@ERROR;
	
	if @err != 0
	begin
		print '###' + @userName + '을(를) INSERT에 실패했습니다.' + '###';
	end

	return @err;
go

exec usp_error 'WDT', '우당탕', 1988, '부산', '019', '55556666', 190, '2021-02-14';
exec usp_error 'WDD', '우당탕';