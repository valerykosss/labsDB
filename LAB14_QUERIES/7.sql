--Разработать сценарий, демонстрирующий утверждение: AFTER-триггер является частью транзакции, 
--в рамках которого выполняется оператор, активизировавший триггер.
go 
create trigger FacultyTrigger 
on FACULTY after INSERT, DELETE, UPDATE  
as declare @c int = (select count (*) from FACULTY); 	 
if (@c>7) 
begin
	raiserror('Количество факультетов не может быть > 7', 10, 1);
	rollback; 
end; 
return; 
         
insert into PULPIT(PULPIT) values ('Военная кафедра');
--drop trigger FacultyTrigger 