use BookRentalShopDB;
go

/*
-- 회원 정보 조회 레벨 거꾸로, 이름순
select memberID, memberName, levels, mobile, email 
from memberTbl
where levels <> 'S'
order by levels desc, memberName;

-- 책정보 조회
select cateidx, bookName, author, interpreter, company, price
from booksTbl
order by price desc;

-- 책 카테고리 조회
select * from cateTbl;
*/

--시스템 함수 사용 쿼리
select memberID, 
	   concat(right(memberName,2), ', ', left(memberName, 1)) as '미국식이름', 
	   case levels
			when 'A' then '골드회원'
			when 'B' then '실버회원'
			when 'C' then '브론즈회원'
			when 'D' then '철회원'
			when 'S' then '관리자'
			else '비회원'
	   end as '회원레벨', 
	   mobile, 
	   upper(email) as '이메일'
from memberTbl
where levels <> 'S'
order by levels, memberName;