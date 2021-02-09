use sqlDB;
go

declare @myVar1 int;
declare @myVar2 smallint, @myVar3 decimal(5,2);
declare @myVar4 char(20);

set @myVar1 = 154234521;
set @myVar2 = 32450;
set @myVar3 = 3.14;
set @myVar4 = '가수 이름 ==>  ';

select @myVar1;
select @myVar2 + @myVar3;
select @myVar4, userName from userTbl where height > 180;

declare @myVar5 tinyint;
set @myVar5 = 3;

select top(@myVar5) userName, height from userTbl order by height desc;

--형 변환
select avg(convert(float, amount)) '평균구매개수' from buyTbl;
select TRY_CONVERT(float, amount) as amount from buyTbl;


select '2021년 2월 9일';
select parse('2021년 2월 9일' as date);
select parse('2021년 12월 39일' as date); --오류
select try_parse('2021년 12월 39일' as date); --null

select parse('123.45' as float);

--스칼라 함수(단일 리턴)
select GETDATE() 날짜;

select year(GETDATE()) as 년도;
select month(GETDATE()) as 월;
select day(GETDATE()) as 일;

select round(3.141592, 3);
select round(1234.5, -1);
select rand()*100;

--문자열 함수
select ascii('a'), ascii('A');
select char(98), char(66);
select unicode('가')


--자주 쓰이는 함수
select concat('SQL', 'Server', 2019);
select charindex('Server', 'SQL Server 2019'); --5 (1부터 시작)

select left('SQL Server 2019', 3), right('SQL Server 2019',4);
select SUBSTRING('HelloWorld', 6, 5);
select len('안녕하세요');

select LOWER('ABCDefg'), UPPER('ABCDefg');
select ltrim('  Hello World  ') 'ltrim', rtrim('  Hello World  ') 'rtrim', trim('  Hello World  ') 'trim';
select len(ltrim('  Hello World  ')) 'ltrim', len(rtrim('  Hello World  ')) 'rtrim', len(trim('  Hello World  ')) 'trim';
select REPLACE('SQL Server 2016', '2016', '2019');

--자주x5 쓰이는 함수
select format(getdate(), ''); --기본
select format(getdate(), 'dd/MM/yyyy');
select format(getdate(), 'yyyy-MM-dd hh:mm:ss');
select format(getdate(), 'yyyy-MM-dd hh:mm:ss:ms');
select format(getdate(), '');
select format(getdate(), '');
select format(getdate(), '');
select format(getdate(), '');
select format(getdate(), '');
select format(getdate(), '');
select format(getdate(), '');