--Разработать функцию FCTEACHER. 
--Функция принимает один параметр, задающий код кафедры. Функция возвращает количество преподавателей 
--на заданной параметром кафедре. Если параметр равен NULL, то возвращается общее количество преподавателей. 
create function FCTEACHER(@p varchar(50)) returns int
as
begin
	declare @rc int=(select count(*) from TEACHER
	where PULPIT=isnull(@p, PULPIT));
	return @rc;
end;
go

select PULPIT, dbo.FCTEACHER(PULPIT)[Количество преподавателей]
from PULPIT

select dbo.FCTEACHER(NULL)[Всего преподавателей]