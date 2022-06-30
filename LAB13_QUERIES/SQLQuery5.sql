-- Изменить функцию так, чтобы количество кафедр, количество групп, количество студентов и количество специальностей 
--вычислялось отдельными скалярными функциями.
use UNIVER
go
--количество кафедр
create function PULPIT_COUNT(@faculty varchar(50)) returns int  
as 
begin 
declare @rc int=(select count(PULPIT) from PULPIT
where PULPIT.FACULTY = @faculty);
return @rc;
end;
--количество групп
go
create function GROUP_COUNT(@faculty varchar(50)) returns int
as 
begin
declare @rc1 int=(select count(IDGROUP) from GROUPS 
where GROUPS.FACULTY = @faculty);
return @rc1;
end;
--количество специальностей
go
create function PROFESSION_COUNT(@faculty varchar(50)) returns int
as 
begin
declare @rc2 int=(select count(PROFESSION) from PROFESSION 
where PROFESSION.FACULTY = @faculty);
return @rc2; 
end;
--количество студентов
go
create function STUDENTS_COUNT(@faculty nvarchar(20)=NULL, @prof varchar(20)=NULL) returns int
as 
begin
declare @rc2 int=(select count(IDSTUDENT)
from STUDENT join GROUPS
on STUDENT.IDGROUP = GROUPS.IDGROUP
join FACULTY
on GROUPS.FACULTY = FACULTY.FACULTY
where FACULTY.FACULTY = isnull(@faculty, FACULTY.FACULTY) and
GROUPS.PROFESSION=isnull(@prof, GROUPS.PROFESSION));
return @rc2;
end; 

go
create function FACULTY_REPORT(@c int) returns @fr table
([Факультет]varchar(50), [Количество кафедр]int, [Количеcтво групп]int,
[Количество студентов]int, [Количество специальностей]int)
as 
begin
declare cc CURSOR static for
select FACULTY from FACULTY 
where dbo.STUDENTS_COUNT(FACULTY, default)>@c;
declare @f varchar(30);
open cc;
fetch cc into @f;
while @@FETCH_STATUS=0 
begin
insert @fr values(@f, dbo.PULPIT_COUNT(@f), dbo.GROUP_COUNT(@f), dbo.STUDENTS_COUNT(@f,default), dbo.PROFESSION_COUNT(@f))
fetch cc into @f; 
end;
close cc;
return;
end;

go
select * from dbo.FACULTY_REPORT(-1); --в скобках количество студентов

