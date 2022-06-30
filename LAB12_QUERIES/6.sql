--Процедура добавляет две строки. 
--Добавление строки в таблицу AUDITORI-UM_TYPE и вызов процедуры PAUDITORI-UM_INSERT должны выполняться 
--в рамках одной явной транзакции с уровнем изолированности SERIALIZABLE. 
create procedure PAUDITORIUM_INSERTX
@audit char(30),
@auditName nvarchar(50),
@auditCapacity int=0,
@auditType char(10),
@auditTypeName nvarchar(50)
as declare @rc int=1;                            
begin try
	set transaction isolation level SERIALIZABLE;
	begin tran
	insert into AUDITORIUM_TYPE (AUDITORIUM_TYPE, AUDITORIUM_TYPENAME)
			values (@auditType, @auditTypeName)
	exec @rc=PAUDITORIUM_INSERT @audit, @auditName, @auditCapacity, @auditType;
	commit tran;
	return @rc;
end try
begin catch
	print 'номер ошибки: '+cast(error_number() as varchar(6));
	print 'сообщение: '+error_message();
	print 'уровень: '+cast(error_severity() as varchar(6));
	print 'метка: '+cast(error_state() as varchar(8));
	print 'номер строки: '+cast(error_line() as varchar(8));
	if error_procedure() is not null
		print 'имя процедуры: '+error_procedure();
	if @@TRANCOUNT>0 
		rollback tran;
	return -1;
end catch;

declare @r int;
exec @r=PAUDITORIUM_INSERTX @audit='205-4', @auditName='205-4', @auditCapacity=200, 
	 @auditType='ЛА', @auditTypeName='Лабораторная аудитория';
print 'код ошибки = '+cast(@r as varchar(3));

drop procedure PAUDITORIUM_INSERTX
