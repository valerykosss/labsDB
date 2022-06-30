--Изменить процедуру PSUBJECT, добавив 2 параметра.
--Процедура PSUBJECT должна формировать результирующий набор, соответствующий заданному параметром @p. 
--Кроме того, процедура должна формировать значение выходного параметра @с, равное количеству строк в результирующем наборе,
--а также возвращать значение к точке вызова, равное общему количеству дисциплин (количеству строк в таблице SUBJECT). 

alter procedure PSUBJECT 
@p varchar(20)=NULL,
@c int output
as
begin
declare @k int=(select count(*) from SUBJECT);
print 'параметры: @p = '+@p+', @c = '+cast(@c as varchar(3));
select * from SUBJECT where PULPIT=@p;
set @c=@@ROWCOUNT;--значение выходного параметра
return @k;
end;

declare @m int=0, @n int=0;
exec @m=PSUBJECT @p='ИСиТ', @c=@n output;
print 'кол-во дисциплин всего = '+cast(@m as varchar(3));
print 'кол-во дисциплин, соответствующих кафедре ИСиТ = ' + cast(@n as varchar(3));

