--Разработать сценарий, демонстрирующий утверждение: AFTER-триггер является частью транзакции, 
--в рамках которого выполняется оператор, активизировавший триггер.
go 
create trigger Pulp_Tran 
on PULPIT after INSERT, DELETE, UPDATE  
as declare @c int = (select count (*) from PULPIT); 	 
if (@c>18) 
begin
raiserror('Общее количество кафедр не может быть > 18', 10, 1);
rollback; 
end; 
return;          
insert into PULPIT(PULPIT) values ('ФХИ');