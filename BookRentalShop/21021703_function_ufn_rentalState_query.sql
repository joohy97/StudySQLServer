﻿-- 책 대여 상태 리턴 함수
create or alter function ufn_getState(@rentalState char(1))
returns nvarchar(5)
as
begin
	declare @result nvarchar(5);
	set @result = case @rentalState
						when '1' then '대여중'
						when '2' then '반납'
						when '3' then '연체중'
						when '4' then '분실'
						else '미정'
				  end;
	return @result;
end
go
