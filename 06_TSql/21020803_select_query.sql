use sqlDB;
go

--userTbl���� �̸��� ���ȣ�� ��� ��ȸ
select * from userTbl
where userName = '���ȣ';

--userTbl���� 1970�� ���� ����̸鼭 Ű 182 �̻��� ����� ���̵�, �̸� ��ȸ
select userID, userName
from userTbl
where birthYear >=1970 and height >= 182;

--userTbl���� 1970�� ���� ��� �Ǵ� Ű 182 �̻��� ����� ���̵�, �̸� ��ȸ
select userID, userName
from userTbl
where birthYear >=1970 or height >= 182;

--Ű�� 180~183 ����(180�̻��̸鼭 183����)�� ����� ���̵�, �̸� ��ȸ : between
select userID, userName
from userTbl
where height between 180 and 183;
--where height >=180 or height <= 183;

--������ �泲, ����, ����� ����� ���̵�, �̸�, �ּ� ��ȸ : in
select userID, userName, addr
from userTbl
where addr in ('�泲', '����', '���');
--where addr = '�泲' or addr = '����' or addr = '���';

--�̸��� ������ �����ϴ�(ù ���ڰ� '��'��)����� ���̵�, �̸�, �ּ� ��ȸ : like (%�� ��������)
select userID, userName, addr
from userTbl
where userName like '��%';

--�̸��� �������� ������(�� ���ڰ� '����'��)����� ���̵�, �̸�, �ּ� ��ȸ : like (_�� �ѱ���)
select userID, userName, addr
from userTbl
where userName like '_����';

--SubQuery ����
--Ű�� 177 �̻��� ����� �̸��� Ű ��ȸ
select userName, height
from userTbl
where height > 177;

--(�̸��� ���ȣ�� ����� Ű)���� Ű�� ū ����� �̸��� Ű ��ȸ
select userName, height
from userTbl
where height > 
	(
		select height 
		from userTbl
		where userName = '���ȣ' 
	);

--���������� �� ���� ���� ��ȯ�Ҷ� any, all, some
--any : or ���ǰ� ���. ���� ���� ��� �� �� ������ �����ص� ���
--all : and ���ǰ� ���. ���� ���� ����� ��� ������Ű�� �� ���
--some : any�� ������ �ǹ�.
--in (subquery) �� any (subquery)�� ������ �ǹ�.
select userName, height
from userTbl
where height >= all
	(
		select height 
		from userTbl
		where addr = '�泲' 
	);

--order by : ����
select userName, mDate
from userTbl
order by mDate desc; --asc:��������, �⺻�� /desc:��������

select *
from userTbl
order by userID desc;

--distinct : �ߺ��� ����
select distinct addr
from userTbl;

--top(n) : ���� n�� ��ȸ, ǥ�� �ƴ�
select top(5) *
from userTbl
order by mDate desc;

--offset n : ���� n�� ���� ������ ��� ��ȸ
select userID, userName, birthYear
from userTbl
order by birthYear offset 4 rows;

--select into : ���̺� ����
select * into buyTbl2 from buyTbl; --buyTbl2���� �⺻Ű ����(���������� ���� �ȵ�)
select userID, prodName into buyTbl3 from buyTbl;

--group by
select userID, amount
from buyTbl
order by userID;

select userID, sum(amount) as '�հ�'
from buyTbl
group by userID;

--min, max
select min(height) as '�ּ�Ű'
from userTbl;
select max(height) as '�ִ�Ű'
from userTbl;

--select�Ҷ� �����Լ��� ���� �Ǿ� ������ �����Լ��� ���� Į���� ���� group by���� ���ų� �����Լ��� ��� ��

--select userID, min(height) as '�ּ�Ű', max(height) as '�ִ�Ű'
--from userTbl;

select userID, min(height) as '�ּ�Ű', max(height) as '�ִ�Ű'
from userTbl
group by userID;

select userID, userName
from userTbl
where height = (select min(height) from userTbl) or height = (select max(height) from userTbl);

--�� ������ ���� ���ϱ�
select count(*) from userTbl; --10
select count(*) from buyTbl; --12