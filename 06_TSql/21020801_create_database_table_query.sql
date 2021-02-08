--DB ����
use tempdb;
go

create database sqlDB;
go

--���̺� ����
use sqlDB;
go
create table userTbl -- ȸ�����̺�
(
	userID char(8) not null primary key, --����� ���̵�
	userName nvarchar(10) not null, --�̸� : name�� Ű����� ����ϸ� ���� ����.
	birthYear int not null, --����⵵
	addr nchar(2) not null, --����(2���ڸ� �Է�)
	mobile1 char(3), --�޴��� ����(010, 016 ��)
	mobile2 char(8), --�޴��� ������ ��ȣ
	height smallint, --Ű
	mDate date --ȸ�� ������
);
go

create table buyTbl --�������̺�
(
	num int identity not null primary key, --����(PK)
	userID char(8) not null --����� ���̵�(FK) 
		foreign key references userTbl(userID), --FK ����
	prodName nvarchar(20) not null, --��ǰ��
	groupName nchar(4), --�з�
	price int not null, --�ܰ�
	amount smallint not null --����

);
go