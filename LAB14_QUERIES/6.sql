--Создать для таблицы TEACHER три AFTER-триггера с именами: TR_TEACHER_ DEL1, TR_TEACHER_DEL2 и TR_TEACHER_ DEL3. 
--Триггеры должны реагировать на событие DELETE и формировать соответствующие строки в таблицу TR_AUDIT.  
--Получить список триггеров таблицы TEACHER. 
go
create table TR_AUDIT
(
	ID int identity, --номер
	
	--В STMT триггер должен поместить событие, на которое он среагировал
	STMT varchar(20) 
		check (STMT in ('INS', 'DEL', 'UPD')), --DML-оператор
	
	TRNAME varchar(50), --имя триггера
	CC varchar(300) --комментарий
)  


go
create trigger TR_TEACHER_DEL1 on TEACHER after DELETE  
as declare @a1 char(10), @a2 varchar(100), @a3 char(1), @a4 char(20), @in varchar(300);
print 'TR_TEACHER_DEL1';
set @a1=(select [TEACHER] from DELETED);
set @a2=(select [TEACHER_NAME] from DELETED);
set @a3=(select [GENDER] from DELETED);
set @a4=(select [PULPIT] from DELETED);
set @in=@a1+' '+@a2+' '+@a3+' '+@a4;
insert into TR_AUDIT(STMT, TRNAME, CC)
			values ('DEL', 'TR_TEACHER_DEL1', @in);
return;



go
create trigger TR_TEACHER_DEL2 on TEACHER after DELETE  
as declare @a1 char(10), @a2 varchar(100), @a3 char(1), @a4 char(20), @in varchar(300);
print 'TR_TEACHER_DEL2';
set @a1=(select [TEACHER] from DELETED);
set @a2=(select [TEACHER_NAME] from DELETED);
set @a3=(select [GENDER] from DELETED);
set @a4=(select [PULPIT] from DELETED);
set @in=@a1+' '+@a2+' '+@a3+' '+@a4;
insert into TR_AUDIT(STMT, TRNAME, CC)
			values ('DEL', 'TR_TEACHER_DEL2', @in);
return;



go
create trigger TR_TEACHER_DEL3 on TEACHER after DELETE  
as
declare @a1 char(10), @a2 varchar(100), @a3 char(1), @a4 char(20), @in varchar(300);
print 'TR_TEACHER_DEL3';
set @a1=(select [TEACHER] from DELETED);
set @a2=(select [TEACHER_NAME] from DELETED);
set @a3=(select [GENDER] from DELETED);
set @a4=(select [PULPIT] from DELETED);
set @in=@a1+' '+@a2+' '+@a3+' '+@a4;
insert into TR_AUDIT(STMT, TRNAME, CC)
			values ('DEL', 'TR_TEACHER_DEL3', @in);
return;


go
--список триггеров
select t.name, e.type_desc 
from sys.triggers  t join  sys.trigger_events e  
on t.object_id = e.object_id  
where OBJECT_NAME(t.parent_id) = 'TEACHER'

--Упорядочить выполнение триггеров для таблицы TEACHER, реагирующих на событие DELETE следующим образом: 
--первым должен выполняться триггер с именем TR_TEACHER_DEL3, последним – триггер TR_TEACHER_DEL2. 
exec  SP_SETTRIGGERORDER @triggername = 'TR_TEACHER_DEL', 
@order = 'First', @stmttype = 'DELETE';
exec  SP_SETTRIGGERORDER @triggername = 'TR_TEACHER_DEL2', 
@order = 'Last', @stmttype = 'DELETE';

--insert into TEACHER values ('НВСЛСК', 'Новосельская Ольга Александровна', 'ж', 'ИСиТ');
--delete TEACHER where TEACHER='НВСЛСК';
