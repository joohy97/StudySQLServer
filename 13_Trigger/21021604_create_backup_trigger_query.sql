use sqlDB;
go

create or alter trigger trg_backupUsertbl
on userTbl
--with encryption --암호화, 보안 : 수정 불가
after update, delete
as
	declare @modType nchar(2);

	if (COLUMNS_UPDATED() > 0) --업데이트 됐을 때
	begin
		set @modType = '수정';
	end
	else --삭제 됐을 때
	begin
		set @modType = '삭제';
	end

	insert into backup_userTbl
		SELECT [userID]
			  ,[userName]
			  ,[birthYear]
			  ,[addr]
			  ,[mobile1]
			  ,[mobile2]
			  ,[height]
			  ,[mDate]
			  ,@modType
			  ,getdate()
			  ,USER_NAME()
		  FROM deleted;
go
