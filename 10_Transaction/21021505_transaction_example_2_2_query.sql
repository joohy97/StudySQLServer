use sqldb;
go

update bankBook set uMoney = uMoney - 600 where uName = N'구매자';
update bankBook set uMoney = uMoney + 600 where uName = N'판매자';
--구매 오류 발생 : 구매자의 잔액은 그대로, 판매자의 잔액은 +600

/*
begin tran
	update bankBook set uMoney = uMoney - 600 where uName = N'구매자';
	--오류발생, 수행 안됨
commit tran
begin tran
	update bankBook set uMoney = uMoney + 600 where uName = N'판매자';
	--정상 수행
commit tran
*/

select * from bankbook