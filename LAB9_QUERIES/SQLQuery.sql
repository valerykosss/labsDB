--1 задание
--определить индексы (кластериз-ые, некластериз-ые)
use UNIVER;
exec SP_HELPINDEX 'AUDITORIUM_TYPE' --получаем перечень индексов, связ. с табл.
exec SP_HELPINDEX 'AUDITORIUM'
exec SP_HELPINDEX 'FACULTY'
exec SP_HELPINDEX 'GROUPS'
exec SP_HELPINDEX 'PROFESSION'
exec SP_HELPINDEX 'PROGRESS'
exec SP_HELPINDEX 'PULPIT'
exec SP_HELPINDEX 'STUDENT'
exec SP_HELPINDEX 'SUBJECT'
exec SP_HELPINDEX 'TEACHER'

--создать временную локальную таблицу с 1000 строками
CREATE table  #temp_table_one
(ind int, 
field varchar(100) 
);
SET nocount on;		--не вывод сообщения о вводе строк
DECLARE @i int=0;
WHILE @i<1000
begin
INSERT #temp_table_one(ind, field)
values(floor(20000*RAND()), REPLICATE('строка',10));
IF (@i%100=0) print @i;  --вывести сообщение
SET @i=@i+1; 
end;

--план запроса и его стоимость

SELECT * FROM #temp_table_one where ind between 1500 and 2500 order by ind 

--чтобы объективно оценить время
checkpoint;  --фиксация БД; позволяет записать образы страниц из буферного кэша в файлы БД
DBCC DROPCLEANBUFFERS;  --очистить буферный кэш

--уменьшение стоимости, а после сканирование не по все таблице, а по части кластеризованного индекса
CREATE clustered index #temp_table_cl on #temp_table_one(ind asc)




--2 задание
create table #temp_table_two
(ind int, 
cc int identity(1,1),
field varchar(100)
);
set nocount on;           
declare @m int=0;
while   @m<20000       -- добавление в таблицу 20000 строк
begin
INSERT #temp_table_two(ind, field) values(floor(30000*RAND()), replicate('строка ', 10));
set @m=@m+1; 
end;

SELECT count(*)[количество строк] from #temp_table_two;
SELECT * from #temp_table_two

--составной неуникальный, некластеризованный индекс по двум столбцам
CREATE index #temp_table_two_nonclu on #temp_table_two(ind, cc)

--планы запросов и их стоимость
SELECT * from #temp_table_two where ind>1500 and cc<4500;
SELECT * from #temp_table_two order by ind,cc;

--если хотя бы одно из индексируемых значений зафиксировать, то
--оптимизатор применит индекс
SELECT * from  #temp_table_two where  ind = 556 and  CC > 3;



--3 задание
create table #temp_table_three
(ind int, 
cc int identity(1,1),
field varchar(100)
);
set nocount on;           
declare @n int=0;
while   @n<10000       -- добавление в таблицу 10000 строк
begin
INSERT #temp_table_three(ind, field) values(floor(30000*RAND()), replicate('строка ', 10));
set @n=@n+1; 
end;

--планы запроса и его стоимость
SELECT cc from #temp_table_three where ind>15000 

--некластеризованный индекс покрытия, уменьш. стоимость
CREATE index #temp_table_three_ind_x on #temp_table_three(ind) INCLUDE (cc)




--4 задание
create table #temp_table_four
(ind int, 
cc int identity(1,1),
field varchar(100)
);
set nocount on;           
declare @j int=0;
while   @j<20000       -- добавление в таблицу 10000 строк
begin
INSERT #temp_table_four(ind, field) values(floor(30000*RAND()), replicate('строка ', 10));
set @j=@j+1; 
end;

SELECT ind from #temp_table_four where ind between 5000 and 9999;
SELECT ind from #temp_table_four where ind>1000 and ind<5000;
SELECT ind from #temp_table_four where ind=8000;

--некластеризованный фильтруемый индекс, стоимость уменьшится
CREATE index #temp_table_four_where on #temp_table_four(ind) 
where (ind>=1000 and ind<5000);
--drop table #temp_table_four

--5 задание
--оценить уровень фрагментации
CREATE index #temp_table_four_ind on #temp_table_four(ind);

use tempdb;
SELECT name[Индекс], avg_fragmentation_in_percent[Фрагментация(%)]
FROM sys.dm_db_index_physical_stats(DB_ID(N'TEMPDB'),
OBJECT_iD(N'#temp_table_four'), NULL, NULL, NULL) ss JOIN sys.indexes ii 
on ss.object_id=ii.object_id and ss.index_id=ii.index_id
WHERE name is not null;

INSERT top(100000) #temp_table_four(ind, field) select ind, field from #temp_table_four;

--избавление от фрагментации
--снижает
ALTER index #temp_table_four_ind on #temp_table_four reorganize;
--убирает полностью
ALTER index #temp_table_four_ind on #temp_table_four rebuild with (online=off);



--6 задание
drop index #temp_table_four_ind on #temp_table_four;
CREATE index #temp_table_four_ind on #temp_table_four(ind)
with (fillfactor=65);  --процент заполнения индексных страниц нижнего уровня

INSERT top(50) INTO #temp_table_four(ind, field) select ind, field from #temp_table_four;

use tempdb;
SELECT name[Индекс], avg_fragmentation_in_percent[Фрагментация(%)]
FROM sys.dm_db_index_physical_stats(DB_ID(N'TEMPDB'),
OBJECT_iD(N'#temp_table_four'), NULL, NULL, NULL) ss JOIN sys.indexes ii 
on ss.object_id=ii.object_id and ss.index_id=ii.index_id
WHERE name is not null;