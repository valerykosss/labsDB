begin tran  --������� ����������
	insert PROGRESS values ('��', 1024, '2013-06-04', 8);
	begin tran  --��������� ����������
		update PROGRESS set NOTE=8 where IDSTUDENT=1019;
		commit;--��������� ����������
		if @@TRANCOUNT>0 rollback; --������� ����������
	select 
		(select count(*) from PROGRESS where IDSTUDENT=1019 and NOTE=8) '��������� ����������',
		(select count(*) from PROGRESS where IDSTUDENT=1024) '������� ����������';