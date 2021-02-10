use sqlDB;
go

select b.userID, 
	   u.userName,
	   iif(sum(price * amount) is null, 0, sum(price * amount)) as '총 구매금액',
	   case
		when (sum(price * amount) >= 1500) then 'VVIP'
		when (sum(price * amount) >= 1000) then 'VIP'
		when (sum(price * amount) >= 1) then 'Person'
		else 'Gost'
	   end
	   as '회원등급'
from buyTbl as b right outer join userTbl as u
	 on b.userID = u.userID
group by b.userID, u.userName
order by sum(price * amount) desc;

select *
from userTbl;