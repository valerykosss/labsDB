create table TR_AUDIT
(
ID int identity,
STMT varchar(20) check (STMT in('INS', 'DEL', 'UPD')),
TRNAME varchar(50),
CC varchar(300)
)
--������� �������
--����������� AFTER-������� � ������ TR_TEACHER_INS ��� ������� TEACHER, ����������� �� ������� INSERT. 
--������� ������ ���������� ������ �������� ������ � ������� TR_AUDIT. � ������� �� ���������� �������� 
--�������� �������� ������. 
go
create trigger TR_TEACHER_INS 
on TEACHER after INSERT
as 
declare @a1 char(10), @a2 varchar(100), @a3 char(1), @a4 char(20), @in varchar(300);
print '�������� �������';
set @a1=(select [TEACHER] from inserted);
set @a2=(select [TEACHER_NAME] from inserted);
set @a3=(select [GENDER] from inserted);
set @a4=(select [PULPIT] from inserted);
set @in=@a1+' '+@a2+' '+@a3+' '+@a4;
insert into TR_AUDIT(STMT, TRNAME, CC)
values ('INS', 'TR_TEACHER_INS', @in);
return;

insert into TEACHER values ('���', '�������� ����� ����������', '�', '����');

go
select * from TR_AUDIT;
--delete TEACHER where TEACHER='���'
--delete TEACHER where TEACHER='����'
--drop table TR_AUDIT;
--drop trigger TR_TEACHER_INS
