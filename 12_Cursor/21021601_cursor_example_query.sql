use sqlDB;
go

declare cur_usertbl cursor local
	for select userName, height from userTbl;

open cur_userTbl;

declare @userName nchar(8);
declare @height smallint;
declare @cnt int = 0;
declare @totalHeight int = 0;

fetch next from cur_usertbl into @userName, @height; --커서값 읽어서 @height 변수에 할당

while @@FETCH_STATUS = 0
begin
	set @cnt += 1;
	set @totalHeight += @height;
	print concat('회원 : ', @userName, '키 : ', @height);
	fetch next from cur_usertbl into @userName, @height;
	--print @@fetch_status;
end

print @totalHeight;
print @cnt;
print concat('회원 키 평균 : ', @totalHeight / @cnt);
