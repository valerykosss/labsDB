--Создать таблицу TR_AUDIT.
--Разработать AFTER-триггер с именем TR_TEACHER_INS для таблицы TEACHER, реагирующий на событие INSERT. 
--Триггер должен записывать строки вводимых данных в таблицу TR_AUDIT. 
--В столбец СС помещаются значения столбцов вводимой строки.

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
create trigger TR_TEACHER_INS on TEACHER after INSERT
as declare @a1 char(10), @a2 varchar(100), @a3 char(1), @a4 char(20), @in varchar(300);
print 'Операция вставки';
set @a1=(select [TEACHER] from INSERTED);
set @a2=(select [TEACHER_NAME] from INSERTED);
set @a3=(select [GENDER] from INSERTED);
set @a4=(select [PULPIT] from INSERTED);
set @in=@a1+' '+@a2+' '+@a3+' '+@a4;
insert into TR_AUDIT(STMT, TRNAME, CC) values ('INS', 'TR_TEACHER_INS', @in);
return;


go
insert into TEACHER values ('НВСЛСК', 'Новосельская Ольга Александровна', 'ж', 'ИСиТ');
select * from TR_AUDIT;
--delete TEACHER from TEACHER where TEACHER.TEACHER='НВСЛСК'

--drop table TR_AUDIT;
--drop trigger TR_TEACHER_INS