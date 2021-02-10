begin try
	insert into userTbl values ('LSG', '이상구', 1988, '경기', null, null, 170, getdate());
	print '저장 성공';
end try

begin catch
	print '저장 실패';
end catch