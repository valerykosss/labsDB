--Разработать скалярную функцию с именем FSUBJECTS, принимающую параметр @p типа VARCHAR(20),
--значение которого задает код кафедры (столбец SUBJECT.PULPIT). 
--Функция должна возвращать строку типа VARCHAR(300) с перечнем дисциплин в отчете. 

go
create FUNCTION FSUBJECTS(@p nvarchar(20)) returns varchar(300)
as begin
declare @tv char(20);
declare @t varchar(300)='Дисциплины: ';
declare SubjectPulpitCursor CURSOR LOCAL static
for select SUBJECT from SUBJECT where PULPIT=@p;

open SubjectPulpitCursor;
fetch SubjectPulpitCursor into @tv;
while @@FETCH_STATUS=0
begin
	set @t = @t + ' ' + rtrim(@tv);
	fetch SubjectPulpitCursor into @tv;
end;
return @t;
end;

--drop FUNCTION FSUBJECTS

go
select  PULPIT, dbo.FSUBJECTS(PULPIT) [Дисциплины] from SUBJECT

select distinct  PULPIT, dbo.FSUBJECTS(PULPIT)[Дисциплины] from SUBJECT