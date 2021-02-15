use sqlDB;
go

/*
create table indexTbl(
	a int not null primary key,
	b int unique,
	c int not null unique,
	d int
);
*/

create table indexTbl2(
	a int not null unique,
	b int unique,
	c int not null unique,
	d int
);