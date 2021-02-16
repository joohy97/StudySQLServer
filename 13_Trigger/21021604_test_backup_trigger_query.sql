USE [sqlDB]
GO

UPDATE [dbo].[userTbl]
   SET [userName] = '관운장'

 WHERE [userID] = 'JKW';
GO

delete from userTbl
where userID = 'JKW';
go
-- backup 테이블에 idx를 대신 기본키로 만들면 오류 없이 실행 가능
