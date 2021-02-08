--testTbl insert
use sqlDB;
go

--DML > select
select * from testTbl1;

--DML > insert
insert into testTbl1 values (1, '홍길동', 25);
insert into testtbl1 (id, userName) values (2, '성명건');
insert into testTbl1 (age, id) values (30, 4);
insert into testTbl1 (id, userName) values (3, '성시경');
insert into testTbl1 (id, userName) values (5, '성시경');
insert into testTbl1 (id, userName) values (6, '성시경');


select * from BikeStores.sales.order_items;

select * from ShopDB.dbo.memberTbl;

--sales.order_items 테이블 복사
CREATE TABLE [sales_order_items](
	[order_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[list_price] [decimal](10, 2) NOT NULL,
	[discount] [decimal](4, 2) NOT NULL
);

insert into sales_order_items
select * from BikeStores.sales.order_items;


select * from sales_order_items;


--update
select * from testTbl1;

update testTbl1
set userName = '성수경',
age = 30
where id = 5;

delete from testTbl1 where id = 6;