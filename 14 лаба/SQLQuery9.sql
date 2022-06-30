--������� DDL-�������, ����������� �� ��� DDL-������� � �� UNIVER. ������� ������ ��������� 
--��������� ����� ������� � ������� ������������. 
go	
create  trigger DDL_UNIVER on database 
for DDL_DATABASE_LEVEL_EVENTS  
as   
declare @t varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/EventType)[1]', 'varchar(50)');
declare @t1 varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/ObjectName)[1]', 'varchar(50)');
declare @t2 varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/ObjectType)[1]', 'varchar(50)'); 
print '��� �������: '+@t;
print '��� �������: '+@t1;
print '��� �������: '+@t2;
raiserror( N'�������� � ����� ������ UNIVER ���������', 16, 1);  
rollback;    

drop table PROGRESS;
undo drop table PROGRESS

