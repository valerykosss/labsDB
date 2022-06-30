--����������� ��������, ��������������� ���������� ��������� SAVE TRAN 
declare @point varchar(150);   --����. ����� ����� 32
begin try
	begin tran --������ ����� ����������
		set @point='p1'; save tran @point;  --����������� ����� p1
		insert PROGRESS values ('����', 1025, '2013-01-10', 10);
		set @point='p2'; save tran @point;    --����������� ����� p2
		insert FACULTY values ('���', '��������� ������ ���������, ���������������� � �������');
	commit tran;   --�������� ����������
end try

begin catch
	print '������: '+case when error_number()=547
						and patindex ('%FACULTY_FK%', error_message())>0 
					then '�������� � ������������ FOREIGN KEY'
					else '����������� ������: '+cast(error_number() as varchar(5)) +error_message()
					end;
	if @@TRANCOUNT>0
		begin
			print '����������� �����: '+@point;
			rollback tran @point;    --����� � ����������� �����
			commit tran;     --�������� ���������, ����������� �� ����������� �����
		end;
end catch;

select * from FACULTY;