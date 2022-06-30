create table TR_AUDIT
(
ID int identity,
STMT varchar(20) check (STMT in('INS', 'DEL', 'UPD')),
TRNAME varchar(50),
CC varchar(300)
)
--создать таблицу
--Разработать AFTER-триггер с именем TR_TEACHER_INS для таблицы TEACHER, реагирующий на событие INSERT. 
--Триггер должен записывать строки вводимых данных в таблицу TR_AUDIT. В столбец СС помещаются значения 
--столбцов вводимой строки. 
go
create trigger TR_TEACHER_INS 
on TEACHER after INSERT
as 
declare @a1 char(10), @a2 varchar(100), @a3 char(1), @a4 char(20), @in varchar(300);
print 'Операция вставки';
set @a1=(select [TEACHER] from inserted);
set @a2=(select [TEACHER_NAME] from inserted);
set @a3=(select [GENDER] from inserted);
set @a4=(select [PULPIT] from inserted);
set @in=@a1+' '+@a2+' '+@a3+' '+@a4;
insert into TR_AUDIT(STMT, TRNAME, CC)
values ('INS', 'TR_TEACHER_INS', @in);
return;

insert into TEACHER values ('ЛКН', 'Лукьянов Артем Дмитриевич', 'м', 'ИСИТ');

go
select * from TR_AUDIT;
--delete TEACHER where TEACHER='ЛКН'
--delete TEACHER where TEACHER='ЛВНЦ'
--drop table TR_AUDIT;
--drop trigger TR_TEACHER_INS
