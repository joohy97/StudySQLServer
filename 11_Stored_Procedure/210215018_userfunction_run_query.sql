use sqlDB;
go

select *,
	dbo.ufn_getAge(birthYear) as 나이,
	dbo.ufn_getZodiac(birthYear) as 띠
from userTbl;
