begin tran  --внешняя транзакция
	insert PROGRESS values ('КГ', 1024, '2013-06-04', 8);
	begin tran  --внутрення транзакция
		update PROGRESS set NOTE=8 where IDSTUDENT=1019;
		commit;--внутрення транзакция
		if @@TRANCOUNT>0 rollback; --внешняя транзакция
	select 
		(select count(*) from PROGRESS where IDSTUDENT=1019 and NOTE=8) 'внутрення транзакция',
		(select count(*) from PROGRESS where IDSTUDENT=1024) 'внешняя транзакция';