use sqldb;
go

/*
update bankBook set uMoney = uMoney - 600 where uName = N'판매자'; --판매자 잔액 원상복귀

begin tran
	update bankBook set uMoney = uMoney - 600 where uName = N'구매자';
	update bankBook set uMoney = uMoney + 600 where uName = N'판매자';
commit tran
--제약조건의 논리적 오류는 롤백 되지 않으므로 첫번째 업데이트에서 오류가 났지만 두번째 업데이트 실행

*/

--try catch 구문 이용
begin try
	begin tran
		update bankBook set uMoney = uMoney - 600 where uName = N'구매자';
		update bankBook set uMoney = uMoney + 600 where uName = N'판매자';
	commit tran
end try
begin catch
	rollback tran
end catch
--첫번째 업데이트에서 오류가 났으므로 try~catch에 의해 롤백되어 트랜잭션이 수행되지 않음


select * from bankbook
