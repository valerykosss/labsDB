--Явная. Разработать сценарий, демонстрирующий свойство атомарности явной транзакции.
begin try
	begin tran  --начало явной транзакции
		insert PROFESSION values ('1-47 01 02', 'ИТ', 'Дизайн электронных и веб-изданий', 'программист-дизайнер');
		insert PROGRESS values ('ОАиП', 1002, '2013-01-10', 8);
		commit tran;  --фиксация транзакции
	end try
	begin catch
		print 'ошибка: '+case
		when error_number()=2627 and patindex('%PROFESSION_PK%', error_message())>0  --позиция первого символа подстроки
		then 'дублирование записи'
		else 'неизвестная ошибка: '+cast(error_number() as varchar(5))+error_message()
	end;
	if @@TRANCOUNT>0 rollback tran; --возвращает уровень вложенности транзакции, если>0, то транзакция не завершена
end catch;



