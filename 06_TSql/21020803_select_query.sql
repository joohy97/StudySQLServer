use sqlDB;
go

--userTbl에서 이름이 김경호인 사람 조회
select * from userTbl
where userName = '김경호';

--userTbl에서 1970년 이후 출생이면서 키 182 이상인 사람의 아이디, 이름 조회
select userID, userName
from userTbl
where birthYear >=1970 and height >= 182;

--userTbl에서 1970년 이후 출생 또는 키 182 이상인 사람의 아이디, 이름 조회
select userID, userName
from userTbl
where birthYear >=1970 or height >= 182;

--키가 180~183 사이(180이상이면서 183이하)인 사람의 아이디, 이름 조회 : between
select userID, userName
from userTbl
where height between 180 and 183;
--where height >=180 or height <= 183;

--지역이 경남, 전남, 경북인 사람의 아이디, 이름, 주소 조회 : in
select userID, userName, addr
from userTbl
where addr in ('경남', '전남', '경북');
--where addr = '경남' or addr = '전남' or addr = '경북';

--이름이 김으로 시작하는(첫 글자가 '김'인)사람의 아이디, 이름, 주소 조회 : like (%는 여러글자)
select userID, userName, addr
from userTbl
where userName like '김%';

--이름이 종신으로 끝나는(끝 글자가 '종신'인)사람의 아이디, 이름, 주소 조회 : like (_는 한글자)
select userID, userName, addr
from userTbl
where userName like '_종신';

--SubQuery 연습
--키가 177 이상인 사람의 이름과 키 조회
select userName, height
from userTbl
where height > 177;

--(이름이 김경호인 사람의 키)보다 키가 큰 사람의 이름과 키 조회
select userName, height
from userTbl
where height > 
	(
		select height 
		from userTbl
		where userName = '김경호' 
	);

--하위쿼리가 두 개의 값을 반환할때 any, all, some
--any : or 조건과 비슷. 여러 개의 결과 중 한 가지만 만족해도 출력
--all : and 조건과 비슷. 여러 개의 결과를 모두 만족시키는 것 출력
--some : any와 동일한 의미.
--in (subquery) 와 any (subquery)는 동일한 의미.
select userName, height
from userTbl
where height >= all
	(
		select height 
		from userTbl
		where addr = '경남' 
	);

--order by : 정렬
select userName, mDate
from userTbl
order by mDate desc; --asc:오름차순, 기본값 /desc:내림차순

select *
from userTbl
order by userID desc;

--distinct : 중복값 제거
select distinct addr
from userTbl;

--top(n) : 상위 n개 조회, 표준 아님
select top(5) *
from userTbl
order by mDate desc;

--offset n : 상위 n개 행을 제외한 결과 조회
select userID, userName, birthYear
from userTbl
order by birthYear offset 4 rows;

--select into : 테이블 복사
select * into buyTbl2 from buyTbl; --buyTbl2에는 기본키 없음(제약조건은 복사 안됨)
select userID, prodName into buyTbl3 from buyTbl;

--group by
select userID, amount
from buyTbl
order by userID;

select userID, sum(amount) as '합계'
from buyTbl
group by userID;

--min, max
select min(height) as '최소키'
from userTbl;
select max(height) as '최대키'
from userTbl;

--select할때 집계함수가 포함 되어 있으면 집계함수가 없는 칼럼에 대해 group by절을 쓰거나 집계함수를 써야 함

--select userID, min(height) as '최소키', max(height) as '최대키'
--from userTbl;

select userID, min(height) as '최소키', max(height) as '최대키'
from userTbl
group by userID;

select userID, userName
from userTbl
where height = (select min(height) from userTbl) or height = (select max(height) from userTbl);

--총 데이터 개수 구하기
select count(*) from userTbl; --10
select count(*) from buyTbl; --12

--group by의 조건, having 절
select userID, sum(price * amount) as '아이디별 구매금액'
from buyTbl
--where sum(price * amount) > 1000
group by userID
having sum(price * amount) > 1000

--rollup / cube
select num, groupName, sum(price * amount) as '구매금액'
from buyTbl
group by rollup(groupName, num);

--userID, groupName 가지고 cube 다차원 합계
select userID, groupName, sum(price * amount) as '구매금액'
from buyTbl
group by cube(groupName, userID);

--CTE
select userID, sum(price * amount) as 'total'
from buyTbl
group by userID
order by total desc;

--CTE활용
with cte_tmp(userID, total)
as
(
	select userID, sum(price * amount) as 'total'
	from buyTbl
	group by userID
)
select * from cte_tmp order by total desc;

