USE [sqlDB]
GO
/****** Object:  StoredProcedure [dbo].[usp_users]    Script Date: 2021-02-15 오후 2:11:41 ******/
create or ALTER   procedure usp_users4
	@txtValue nvarchar(10),
	@outValue int output
as
	insert into testTbl values (@txtValue);
	select @outValue = IDENT_CURRENT('testTbl'); --testTbl의 현재 identity값(id) 리턴
go
