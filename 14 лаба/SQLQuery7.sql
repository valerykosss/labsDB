--����������� ��������, ��������������� �����������: AFTER-������� �������� ������ ����������, 
--� ������ �������� ����������� ��������, ���������������� �������.
go 
create trigger Pulp_Tran 
on PULPIT after INSERT, DELETE, UPDATE  
as declare @c int = (select count (*) from PULPIT); 	 
if (@c>18) 
begin
raiserror('����� ���������� ������ �� ����� ���� > 18', 10, 1);
rollback; 
end; 
return;          
insert into PULPIT(PULPIT) values ('���');