--����������� ��������� ������� FFACPUL, ���������� ������ ������� ������������������ �� ������� ����. 
--������� ��������� ��� ���������, �������� ��� ���������� (������� FACULTY.FACULTY) 
--� ��� ������� (������� PULPIT.PULPIT). ���������� SELECT-������ c ����� ������� ����������� ����� ��������� FACULTY � PULPIT. 

go
create function FFACPUL(@f varchar(50), @p varchar(50)) returns table
as return 
select FACULTY.FACULTY, PULPIT.PULPIT
from FACULTY left outer join PULPIT
on FACULTY.FACULTY=PULPIT.FACULTY
where FACULTY.FACULTY=isnull(@f, FACULTY.FACULTY)
and
PULPIT.PULPIT=isnull(@p, PULPIT.PULPIT);


go
--������ ���� ������ �� ���� �����������
select * from dbo.FFACPUL(NULL, NULL);
--������ ���� ������ ��������� ����������
select * from dbo.FFACPUL('���', NULL);
--�����, ������. ������, �����. �������� �������
select * from dbo.FFACPUL(NULL, '����');
--������, �����. �������� ������� �� �������� ����������
select * from dbo.FFACPUL('���', '����');