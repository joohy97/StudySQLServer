use sqlDB;
go


create or alter trigger trg_testtbl
on testtbl
after insert, delete, update --삭제, 수정 후에 트리거 작동
as
	print '모래반지빵야빵야';
go


insert into testTbl values ('BTS');
--select * from testTbl where txt = '마마무';
update testTbl set txt = '뉴 마마무' where id = 3;
delete testTbl where id = 3;