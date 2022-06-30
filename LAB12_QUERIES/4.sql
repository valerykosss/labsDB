--��������� PAUDITORIUM_INSERT ������ ���-������ �������� TRY/CATCH ��� ��������� ������. 
--� ������ ������������� ������, ��������� ������ ����������� ���������, ���������� ��� ������, 
--������� ����������� � ����� ��������� � ����������� �������� �����. 

create procedure PAUDITORIUM_INSERT
@audit CHAR(30),
@auditName NVARCHAR(50),
@auditCapacity INT=0,
@auditType CHAR(10)
as declare @rc int = 1;
begin try
	insert into AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_CAPACITY, AUDITORIUM_TYPE)
				values (@audit , @auditName, @auditCapacity, @auditType)
	return @rc;
end try
begin catch --��������� ������
	print '����� ������	: '+ cast(error_number() as varchar(6));
	print '���������	: '+ error_message();
	print '�������		: '+cast(error_severity() as varchar(6));
	print '�����		: '+cast(error_state() as varchar(8));
	print '����� ������	: '+cast(error_line() as varchar(8));
	if error_procedure() is not null
	print '��� ���������: '+error_procedure();
	return -1;
end catch;

declare @rc1 INT;
exec @rc1=PAUDITORIUM_INSERT @audit ='101-1', @auditName='101-1', @auditCapacity=40, @auditType='��-�';
print '��� ������: '+cast(@rc1 as varchar(3));

--delete AUDITORIUM where AUDITORIUM='101-1'
drop procedure PAUDITORIUM_INSERT