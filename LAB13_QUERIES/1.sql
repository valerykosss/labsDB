--Разработать скалярную функцию с именем COUNT_STUDENTS, которая вычисляет количество
--студентов на факультете, код которого задается параметром типа VARCHAR(20) с именем @faculty. 
--Использовать внутреннее соединение таблиц FACULTY, GROUPS, STUDENT.
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
declare @f int=dbo.COUNT_STUDENTS('ИТ');
print 'Количество студентов на факультете ИТ = ' + cast(@f as varchar(4));

select FACULTY [Факультеты],
dbo.COUNT_STUDENTS(FACULTY) [Количество студентов на факультетах] from FACULTY;

--drop function COUNT_STUDENTS


--Внести изменения в текст функции с помощью оператора ALTER с тем, чтобы функция принимала 
--второй параметр @prof типа VARCHAR(20), обозначающий специальность студентов. Для параметров 
--определить значения по умолчанию NULL.
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

--вызов скалярной функции без применения параметров по умолчанию
go
select FACULTY.FACULTY [Факультеты],
GROUPS.PROFESSION [Специальности],
dbo.COUNT_STUDENTS(FACULTY.FACULTY, GROUPS.PROFESSION) [Количество студентов на факультетах]
from FACULTY join GROUPS on FACULTY.FACULTY=GROUPS.FACULTY
group by FACULTY.FACULTY, GROUPS.PROFESSION order by [Количество студентов на факультетах] desc

--вызов скалярной функции с применением значения по умолчанию для второго параметра
select FACULTY [Факультеты],
dbo.COUNT_STUDENTS(FACULTY, default) [Количество студентов на факультетах] from FACULTY;

--вызов функции со значениями по умолчанию для двух параметров
print 'Всего студентов: '+ cast(dbo.COUNT_STUDENTS(default, default) as varchar(4));
