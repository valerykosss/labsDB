--Разработать табличную функцию FFACPUL, результаты работы которой продемонстрированы на рисунке ниже. 
--Функция принимает два параметра, задающих код факультета (столбец FACULTY.FACULTY) 
--и код кафедры (столбец PULPIT.PULPIT). Использует SELECT-запрос c левым внешним соединением между таблицами FACULTY и PULPIT. 

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
--список всех кафедр на всех факультетах
select * from dbo.FFACPUL(NULL, NULL);
--список всех кафедр заданного факультета
select * from dbo.FFACPUL('ИЭФ', NULL);
--набор, содерж. строку, соотв. заданной кафедре
select * from dbo.FFACPUL(NULL, 'МиЭП');
--строка, соотв. заданной кафедре на заданном факультете
select * from dbo.FFACPUL('ИЭФ', 'МиЭП');