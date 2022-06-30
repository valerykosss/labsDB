--Разработать сценарий, демонстрирующий работу в режиме неявной транзакции.
set nocount on
	
if  exists (select * from  SYS.OBJECTS        -- таблица X есть?
	        where OBJECT_ID= object_id(N'DBO.X') )	            
drop table TableOne;           
declare @c int, @flag char = 'c';           -- commit или rollback?
SET IMPLICIT_TRANSACTIONS  ON   -- включ. режим неявной транзакции
CREATE table TableOne(K int );                         -- начало транзакции 
	INSERT TableOne values (1),(2),(3);
	set @c = (select count(*) from TableOne);
	print 'количество строк в таблице TableOne: ' + cast( @c as varchar(2));
	if @flag = 'c'  commit;                   -- завершение транзакции: фиксация 
	else   rollback;                                 -- завершение транзакции: откат  
SET IMPLICIT_TRANSACTIONS  OFF   -- выключ. режим неявной транзакции
	
if  exists (select * from  SYS.OBJECTS       -- таблица X есть?
	        where OBJECT_ID= object_id(N'DBO.TableOne') )
print 'таблица "TableOne" есть';  
else print 'таблицы "TableOne" нет'
