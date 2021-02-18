create or alter view uv_notRentalMember
as
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
go