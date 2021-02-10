﻿create view uv_stdclubTbl
as
	select s.id, s.stdName, c.clubName, c.buildingNum
	from stdTbl as s
	inner join clubRegTbl as r
	on s.id = r.std_id
	inner join clubTbl as c
	on r.club_id = c.id;
go

select * from uv_stdclubTbl;