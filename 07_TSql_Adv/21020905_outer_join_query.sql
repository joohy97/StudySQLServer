select s.id, s.stdName, c.clubName, c.buildingNum
from StdTbl as s
left outer join ClubRegTbl as r
on s.id = r.std_id
full outer join ClubTbl as c
on c.id = r.club_id;