--����������� ��������, ��������������� �����������: AFTER-������� �������� ������ ����������, 
--� ������ �������� ����������� ��������, ���������������� �������.
go 
create trigger FacultyTrigger 
on FACULTY after INSERT, DELETE, UPDATE  
as declare @c int = (select count (*) from FACULTY); 	 
if (@c>7) 
begin
	raiserror('���������� ����������� �� ����� ���� > 7', 10, 1);
	rollback; 
end; 
return; 
         
insert into PULPIT(PULPIT) values ('������� �������');
--drop trigger FacultyTrigger 