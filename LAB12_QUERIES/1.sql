--Разработать хранимую процедуру без параметров с именем PSUBJECT.
--К точке вызова процедура должна возвращать количество строк, выведенных в результирующий набор.
use UNIVER_lab4

CREATE PROCEDURE PSUBJECT --создание процедуры
as                    --хранится в БД
begin
declare @k int=(select count(*) from SUBJECT);
select * from SUBJECT;
return @k;            --код возврата
end;


declare @n int=0;
EXEC @n=PSUBJECT;     --вызов процедуры
print 'кол-во дисциплин='+cast(@n as varchar(3));

--drop procedure PSUBJECT;
--сначала запускать процедуру, потом declare и обращение к процедуре через EXEC