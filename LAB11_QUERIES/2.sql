--�����. ����������� ��������, ��������������� �������� ����������� ����� ����������.
begin try
	begin tran  --������ ����� ����������
		insert PROFESSION values ('1-47 01 02', '��', '������ ����������� � ���-�������', '�����������-��������');
		insert PROGRESS values ('����', 1002, '2013-01-10', 8);
		commit tran;  --�������� ����������
	end try
	begin catch
		print '������: '+case
		when error_number()=2627 and patindex('%PROFESSION_PK%', error_message())>0  --������� ������� ������� ���������
		then '������������ ������'
		else '����������� ������: '+cast(error_number() as varchar(5))+error_message()
	end;
	if @@TRANCOUNT>0 rollback tran; --���������� ������� ����������� ����������, ����>0, �� ���������� �� ���������
end catch;



