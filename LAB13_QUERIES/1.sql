--����������� ��������� ������� � ������ COUNT_STUDENTS, ������� ��������� ����������
--��������� �� ����������, ��� �������� �������� ���������� ���� VARCHAR(20) � ������ @faculty. 
--������������ ���������� ���������� ������ FACULTY, GROUPS, STUDENT.
use UNIVER_lab4
go
create function COUNT_STUDENTS(@faculty nvarchar(40)) returns int
as begin declare @rc int = 0;
set @rc=(select count(IDSTUDENT) 
from STUDENT join GROUPS
on STUDENT.IDGROUP = GROUPS.IDGROUP
join FACULTY 
on GROUPS.FACULTY = FACULTY.FACULTY
where FACULTY.FACULTY = @faculty);
return @rc;
end; 

go
declare @f int=dbo.COUNT_STUDENTS('��');
print '���������� ��������� �� ���������� �� = ' + cast(@f as varchar(4));

select FACULTY [����������],
dbo.COUNT_STUDENTS(FACULTY) [���������� ��������� �� �����������] from FACULTY;

--drop function COUNT_STUDENTS


--������ ��������� � ����� ������� � ������� ��������� ALTER � ���, ����� ������� ��������� 
--������ �������� @prof ���� VARCHAR(20), ������������ ������������� ���������. ��� ���������� 
--���������� �������� �� ��������� NULL.
go
alter function COUNT_STUDENTS(@faculty nvarchar(20)=NULL, @prof varchar(20)=NULL) returns int
as begin declare @rc int = 0;
set @rc=(SELECT count(IDSTUDENT) 
from STUDENT join GROUPS
on STUDENT.IDGROUP = GROUPS.IDGROUP
join FACULTY
on GROUPS.FACULTY = FACULTY.FACULTY
where FACULTY.FACULTY = isnull(@faculty, FACULTY.FACULTY) and
	  GROUPS.PROFESSION=isnull(@prof, GROUPS.PROFESSION));
return @rc;
end; 

--����� ��������� ������� ��� ���������� ���������� �� ���������
go
select FACULTY.FACULTY [����������],
GROUPS.PROFESSION [�������������],
dbo.COUNT_STUDENTS(FACULTY.FACULTY, GROUPS.PROFESSION) [���������� ��������� �� �����������]
from FACULTY join GROUPS on FACULTY.FACULTY=GROUPS.FACULTY
group by FACULTY.FACULTY, GROUPS.PROFESSION order by [���������� ��������� �� �����������] desc

--����� ��������� ������� � ����������� �������� �� ��������� ��� ������� ���������
select FACULTY [����������],
dbo.COUNT_STUDENTS(FACULTY, default) [���������� ��������� �� �����������] from FACULTY;

--����� ������� �� ���������� �� ��������� ��� ���� ����������
print '����� ���������: '+ cast(dbo.COUNT_STUDENTS(default, default) as varchar(4));
