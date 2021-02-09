select * from userTbl
select * from buyTbl

select * from userTbl where userID = 'JYP';
select * from buyTbl where userID = 'JYP';

select * from buyTbl where userID = 'BBK';



--inner join
select * 
from buyTbl
inner join userTbl
on buyTbl.userID = userTbl.userID;


select userTbl.userName, userTbl.addr,concat(userTbl.mobile1, userTbl.mobile2) mobile,
buyTbl.prodName, buyTbl.price, buyTbl.amount
from buyTbl
inner join userTbl
on buyTbl.userID = userTbl.userID
where buyTbl.userID='JYP';


select u.userName, u.addr,concat(u.mobile1, '-', left(u.mobile2,4), '-', right(u.mobile2,4)) as mobile,
b.prodName, b.price, b.amount
from buyTbl as b
inner join userTbl as u
on b.userID = u.userID
where b.userID='JYP';