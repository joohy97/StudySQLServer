--union
select ClubName as bName, buildingNum as bLocation from ClubTbl
union
select StdName, region from StdTbl;

--union all
select StdName, region from StdTbl
union all
select StdName, region from StdTbl;

--except
select StdName, region from StdTbl
union all
select StdName, region from StdTbl;