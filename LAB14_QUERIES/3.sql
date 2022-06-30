--Создать AFTER-триггер с именем TR_TEACHER_UPD для таблицы TEACHER, реагирующий на событие UPDATE. 
--Триггер должен записывать строку данных в таблицу TR_AUDIT для каждой изменяемой строки.
--В столбец СС помещаются значения столбцов изменяемой строки до и после изменения.
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
create trigger TR_TEACHER_UPD
on TEACHER after UPDATE
as declare @a1 char(10), @a2 varchar(100), @a3 char(1), @a4 char(20), @in varchar(300);
print 'Операция изменения';
set @a1=(select [TEACHER] from INSERTED);
set @a2=(select [TEACHER_NAME] from INSERTED);
set @a3=(select [GENDER] from INSERTED);
set @a4=(select [PULPIT] from INSERTED);
set @in=@a1+' '+@a2+' '+@a3+' '+@a4;
set @a1=(select [TEACHER] from DELETED);
set @a2=(select [TEACHER_NAME] from DELETED);
set @a3=(select [GENDER] from DELETED);
set @a4=(select [PULPIT] from DELETED);
set @in=@a1+' '+@a2+' '+@a3+' '+@a4;
insert into TR_AUDIT(STMT, TRNAME, CC)
values ('UPD', 'TR_TEACHER_UPD', @in);
return;


go
update TEACHER set TEACHER='НВСЛСК_О_А' where TEACHER='НВСЛСК';
select * from TR_AUDIT;

--drop trigger TR_TEACHER_UPD
