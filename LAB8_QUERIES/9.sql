begin try
DECLARE @delim int=333,  @delit int=0, @chastn float;
set @chastn =  @delim/@delit;

end try
begin catch
	print ERROR_NUMBER()--��� ��������� ������
	print ERROR_MESSAGE()--��������� �� �����
	print ERROR_LINE()--��� ��������� ������
	print ERROR_PROCEDURE()--��� ��������� ��� NULL
	print ERROR_SEVERITY()--������� ����������� ������
	print ERROR_STATE()--����� ������
end catch