declare @var1 int; --변수 선언
set @var1 = 100; --값 대입

if @var1 = 100 --@var1이 100이면(==이 아님 주의!)
	begin
		select '@var1은 100이다'; --print하면 메세지로, select하면 테이블로 결과 출력
	end
else
	begin
		print '@var1은 100이 아니다';
	end

