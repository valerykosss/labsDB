use UNIVER_lab4;
print '@@ROWCOUNT(число обработанных строк)			  : '+ cast(@@ROWCOUNT as varchar(12));
print '@@VERSION(версия SQL Server)                   : '+ cast(@@VERSION as varchar(12));   
print '@@SPID (идентификатор процесса, назначенный сервером текущему подключению)				  : '+ cast(@@SPID as varchar(12));
print '@@ERROR (код последней ошибки)				  : '+ cast(@@ERROR as varchar(12));
print '@@SERVERNAME (имя сервера)           : '+ cast(@@SERVERNAME as varchar(12));
print '@@TRANCOUNT (возвращает уровень вложенности транзакции)		      : '+ cast(@@TRANCOUNT as varchar(12));
print '@@FETCH_STATUS (проверка результата считывания строк результирующего набора)         : '+ cast(@@FETCH_STATUS as varchar(12));
print '@@NESTLEVEL(уровень вложенности текущей процедуры)	          : '+ cast(@@NESTLEVEL as varchar(12));