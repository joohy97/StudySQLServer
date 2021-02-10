﻿declare @curDate date;
declare @curYear varchar(4);
declare @curMonth varchar(2);
declare @curDay varchar(2);
declare @sql varchar(2000);

set @curDate = getDate();
set @curYear = year(@curDate);
set @curMonth = month(@curDate);
set @curDay = day(@curDate);

print @curYear;
--print @curMonth;
--print replicate('0', 2 - len(@curMonth)) + @curMonth;
--print format(@curDate, 'MM');
print right(('00' + @curMonth),2);
print @curDay;
print format(@curDate, 'yyyy-MM-dd');

set @sql = 'create table backup_' + format(@curDate, 'yyyy_MM_dd');
set @sql += '(id int not null primary key, bName varchar(100) not null);';

exec(@sql);