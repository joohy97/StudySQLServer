use sqldb;
go

update bankBook set uMoney = uMoney - 500 where uName = N'구매자';
update bankBook set uMoney = uMoney + 500 where uName = N'판매자';

/*
begin tran
	update bankBook set uMoney = uMoney - 500 where uName = N'구매자';
commit tran
begin tran
	update bankBook set uMoney = uMoney + 500 where uName = N'판매자';
commit tran
*/