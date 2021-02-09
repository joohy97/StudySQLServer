/*
select * from StdTbl;
select * from ClubTbl;
select * from ClubRegTbl;
*/

select *
from StdTbl as s
inner join ClubRegTbl as r
on s.id = r.std_id
inner join ClubTbl as c
on c.id = r.club_id;

--innerjoin(내부조인)
select s.id, s.stdName, c.clubName, c.buildingNum
from StdTbl as s
inner join ClubRegTbl as r
on s.id = r.std_id
inner join ClubTbl as c
on c.id = r.club_id;


--innerjoin 약식
select s.id, s.stdName, c.clubName, c.buildingNum
from StdTbl as s, ClubRegTbl as r, ClubTbl as c
where s.id=r.std_id and r.club_id = c.id;


--outerjoin(외부조인)
select s.id, s.stdName, c.clubName, c.buildingNum
from StdTbl as s
left outer join ClubRegTbl as r
on s.id = r.std_id
left outer join ClubTbl as c
on c.id = r.club_id;

--userTbl / buyTbl
select u.userName, u.addr, b.prodName, b.price
from userTbl as u
left outer join buyTbl as b
on u.userID = b.userID;

select * from buyTbl