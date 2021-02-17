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

-- 사용자 정의 함수 사용 쿼리
select memberID, 
	   concat(right(memberName,2), ', ', left(memberName, 1)) as '미국식이름', 
	   dbo.ufn_getLevel(levels) as '회원레벨', 
	   mobile, 
	   upper(email) as '이메일'
from memberTbl
where levels <> 'S'
order by levels, memberName;

--책 정보, 시스템 함수, 포맷 함수 쿼리
SELECT bookIdx
      ,cateIdx
      ,concat(N'책제목 > ', bookName) as bookName
      ,author
      ,isnull(interpreter, '(역자없음)') as '번역가'
      ,company
      ,format(releaseDate, 'yyyy년 MM월 dd일' ) as '출판일'
      ,format(price, '#,#원') as '가격'
  FROM booksTbl;

-- 책 정보 조인 조회
SELECT b.bookIdx
      --,b.cateidx
	  ,c.cateName
      ,b.bookName
      ,b.author
      ,b.interpreter
      ,b.company
  FROM booksTbl as b
 inner join cateTbl as c
	on b.cateIdx = c.cateIdx;

-- 대여 책 정보 조회 쿼리
SELECT r.rentalIdx
      --,r.memberIdx
	  ,m.memberName
      --,r.bookIdx
	  ,b.bookName
	  ,b.author
      ,format(r.rentalDt, 'yyyy-MM-dd') as '대여일'
      ,format(r.returnDt, 'yyyy-MM-dd') as '반납일'
      ,dbo.ufn_getState(r.rentalState) as '대여상태'
  FROM dbo.rentalTbl as r
 inner join booksTbl as b
	on r.bookIdx = b.bookIdx
 inner join memberTbl as m
	on r.memberIdx = m.memberIdx;

-- 책을 안빌린 회원 조회
SELECT r.rentalIdx
      --,r.memberIdx
	  ,m.memberName
      --,r.bookIdx
	  ,b.bookName
	  ,b.author
      ,format(r.rentalDt, 'yyyy-MM-dd') as '대여일'
      ,dbo.ufn_getState(r.rentalState) as '대여상태'
  FROM dbo.rentalTbl as r
 inner join booksTbl as b
	on r.bookIdx = b.bookIdx
 right outer join memberTbl as m
	on r.memberIdx = m.memberIdx
 where r.rentalIdx is null;

-- 대여점에 없는 소설 장르 조회
SELECT c.cateIdx
      ,c.cateName
	  ,b.bookName
  FROM cateTbl as c
 left outer join booksTbl as b
	on c.cateIdx = b.cateidx;
