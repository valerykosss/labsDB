-- �������� ������� ���, ����� ���������� ������, ���������� �����, ���������� ��������� � ���������� �������������� 
--����������� ���������� ���������� ���������.
use UNIVER_lab4


--����������� ���������������� ��������� ������� FACULTY_REPORT
go
create function FACULTY_REPORT(@c int) returns @fr table
([���������] varchar(50), [���������� ������] int, [���������� �����]  int, 
[���������� ���������] int, [���������� ��������������] int)
as begin 
	declare cc CURSOR static for 
	select FACULTY from FACULTY 
		where dbo.COUNT_STUDENTS(FACULTY, default) > @c; 
	declare @f varchar(30);
	open cc;  
	fetch cc into @f;
	while @@fetch_status = 0
	begin
		insert @fr values(@f,  (select count(PULPIT) from PULPIT where FACULTY = @f),
						(select count(IDGROUP) from GROUPS where FACULTY = @f),   dbo.COUNT_STUDENTS(@f, default),
						(select count(PROFESSION) from PROFESSION where FACULTY = @f)   ); 
		fetch cc into @f;  
	end;   
	return; 
end;

--���������� ������
go
create function PULPIT_COUNT(@faculty varchar(50)) returns int  
as begin 
	declare @rc int=(select count(PULPIT) from PULPIT
		where PULPIT.FACULTY = @faculty);
	return @rc;
end;


--���������� �����
go
create function GROUP_COUNT(@faculty varchar(50)) returns int
as begin
	declare @rc1 int=(select count(IDGROUP) from GROUPS 
		where GROUPS.FACULTY = @faculty);
	return @rc1;
end;



--���������� ��������������
go
create function PROFESSION_COUNT(@faculty varchar(50)) returns int
as begin
	declare @rc2 int=(select count(PROFESSION) from PROFESSION 
		where PROFESSION.FACULTY = @faculty);
	return @rc2; 
end;



--���������� ���������
go
create function STUDENTS_COUNT(@faculty nvarchar(20)=NULL, @prof varchar(20)=NULL) returns int
as begin
	declare @rc2 int=(select count(IDSTUDENT)
	from STUDENT join GROUPS
	on STUDENT.IDGROUP = GROUPS.IDGROUP
	join FACULTY
	on GROUPS.FACULTY = FACULTY.FACULTY
		where FACULTY.FACULTY = isnull(@faculty, FACULTY.FACULTY) and
			  GROUPS.PROFESSION=isnull(@prof, GROUPS.PROFESSION));
	return @rc2;
end; 

--���������� ������� �� ���������� ���������
go
create function FACULTY_REPORT1(@c int) returns @fr table
([���������]varchar(50), [���������� ������]int, [������c��� �����]int,
[���������� ���������]int, [���������� ��������������]int)
as begin
	declare cc CURSOR static for
	select FACULTY from FACULTY 
		where dbo.STUDENTS_COUNT(FACULTY, default)>@c;
	declare @f varchar(30);
	open cc;
	fetch cc into @f;
	while @@fetch_status=0 
	begin
		insert @fr values(@f, dbo.PULPIT_COUNT(@f), dbo.GROUP_COUNT(@f), dbo.STUDENTS_COUNT(@f,default), dbo.PROFESSION_COUNT(@f))
		fetch cc into @f; 
	end;
	close cc;
	return;
end;


go
select * from dbo.FACULTY_REPORT1(-1); --� ������� ���������� ���������

