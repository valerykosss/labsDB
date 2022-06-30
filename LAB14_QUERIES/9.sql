--Создать DDL-триггер, реагирующий на все DDL-события в БД UNIVER. Триггер должен запрещать 
--создавать новые таблицы и удалять существующие. 
go	
create  trigger DDL_UNIVER_lab4 on database 
				for DDL_DATABASE_LEVEL_EVENTS  
as   
declare @t varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/EventType)[1]', 'varchar(50)');
declare @t1 varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/ObjectName)[1]', 'varchar(50)');
declare @t2 varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/ObjectType)[1]', 'varchar(50)');
if @t1='FACULTY'
begin
	print 'Тип события: '+@t;
	print 'Имя объекта: '+@t1;
	print 'Тип объекта: '+@t2;
	raiserror( N'Операции с базой данных UNIVER_lab4 запрещены', 16, 1);  
	rollback;    
end;

drop table FACULTY;
drop trigger UNIVER_lab4;