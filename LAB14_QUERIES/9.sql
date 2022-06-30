--������� DDL-�������, ����������� �� ��� DDL-������� � �� UNIVER. ������� ������ ��������� 
--��������� ����� ������� � ������� ������������. 
go	
create  trigger DDL_UNIVER_lab4 on database 
				for DDL_DATABASE_LEVEL_EVENTS  
as   
declare @t varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/EventType)[1]', 'varchar(50)');
declare @t1 varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/ObjectName)[1]', 'varchar(50)');
declare @t2 varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/ObjectType)[1]', 'varchar(50)');
if @t1='FACULTY'
begin
	print '��� �������: '+@t;
	print '��� �������: '+@t1;
	print '��� �������: '+@t2;
	raiserror( N'�������� � ����� ������ UNIVER_lab4 ���������', 16, 1);  
	rollback;    
end;

drop table FACULTY;
drop trigger UNIVER_lab4;