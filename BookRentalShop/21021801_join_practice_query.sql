--조인 연습
SELECT r.rentalIdx
      --,r.memberIdx
	  ,m.memberName
      --,r.bookIdx
	  --,b.cateIdx
	  ,c.cateIdx
	  ,b.bookName
	  ,b.author
      ,format(r.rentalDt, 'yyyy-MM-dd') as rentalDt
      ,format(r.returnDt, 'yyyy-MM-dd') as returnDt
      ,dbo.ufn_getState(r.rentalState) as '대여상태'
  FROM dbo.rentalTbl as r
 right join memberTbl as m
	on r.memberIdx = m.memberIdx
 left join booksTbl as b
	on r.bookIdx = b.bookIdx
 left join cateTbl as c
	on c.cateIdx = b.cateIdx
 where r.rentalIdx is null;

-- 책 정보 추가
 insert into booksTbl
 (
	cateIdx,
	bookName,
	author,
	company,
	releaseDate,
	ISBN,
	price
 )
 values
 (
 	'N0002',
	'순수하지 않은 감각',
	'요안나',
	'로코코',
	'2019-10-02',
	'9791135445705',
	12500
 );

-- 책 정보 수정
begin tran;

select * from booksTbl

update booksTbl
	set descriptions = '부명그룹의 브레인이자 핵심 TF팀 리더, 강태욱 수석.'
		,regDate = '2021-02-18'
where bookIdx = 12; --업데이트 할 땐 where 절 있는 지 꼮꼭꼭곡꼬꼭ㄱ꼭 확인!!!!!!!!!!

rollback;
commit;

-- 카테고리 추가
begin tran;

insert into cateTbl /*(cateIdx, cateName)*/ values ('I0001', '대화/협상'),
												   ('I0002', '성공/처세'),
												   ('I0003', '시간관리');
select * from cateTbl;

rollback;
commit;

--카테고리 삭제
begin tran;

delete from cateTbl where cateIdx = 'I0003'
delete from cateTbl where cateIdx in ('I0001', 'I0002');

delete from cateTbl where cateIdx = 'I0001' or cateIdx = 'I0002';

select * from cateTbl;

rollback;
commit;
