use UNIVER_lab4;
print '@@ROWCOUNT(����� ������������ �����)			  : '+ cast(@@ROWCOUNT as varchar(12));
print '@@VERSION(������ SQL Server)                   : '+ cast(@@VERSION as varchar(12));   
print '@@SPID (������������� ��������, ����������� �������� �������� �����������)				  : '+ cast(@@SPID as varchar(12));
print '@@ERROR (��� ��������� ������)				  : '+ cast(@@ERROR as varchar(12));
print '@@SERVERNAME (��� �������)           : '+ cast(@@SERVERNAME as varchar(12));
print '@@TRANCOUNT (���������� ������� ����������� ����������)		      : '+ cast(@@TRANCOUNT as varchar(12));
print '@@FETCH_STATUS (�������� ���������� ���������� ����� ��������������� ������)         : '+ cast(@@FETCH_STATUS as varchar(12));
print '@@NESTLEVEL(������� ����������� ������� ���������)	          : '+ cast(@@NESTLEVEL as varchar(12));