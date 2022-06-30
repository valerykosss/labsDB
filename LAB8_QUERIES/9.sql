begin try
DECLARE @delim int=333,  @delit int=0, @chastn float;
set @chastn =  @delim/@delit;

end try
begin catch
	print ERROR_NUMBER()--код последней ошибки
	print ERROR_MESSAGE()--сообщение об ошибк
	print ERROR_LINE()--код последней ошибки
	print ERROR_PROCEDURE()--имя процедуры или NULL
	print ERROR_SEVERITY()--уровень серьезности ошибки
	print ERROR_STATE()--метка ошибки
end catch