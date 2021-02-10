use sqlDB;
go

declare @sql varchar(100);
set @sql = 'select * from userTbl where userID = ''EJW'';';
exec (@sql);