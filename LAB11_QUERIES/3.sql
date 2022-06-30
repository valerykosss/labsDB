--Разработать сценарий, демонстрирующий применение оператора SAVE TRAN 
declare @point varchar(150);   --макс. длина имени 32
begin try
	begin tran --начало явной транзакции
		set @point='p1'; save tran @point;  --контрольная точка p1
		insert PROGRESS values ('ОАиП', 1025, '2013-01-10', 10);
		set @point='p2'; save tran @point;    --контрольная точка p2
		insert FACULTY values ('ЛиД', 'Факультет лесной инженерии, материаловедения и дизайна');
	commit tran;   --фиксация транзакции
end try

begin catch
	print 'ошибка: '+case when error_number()=547
						and patindex ('%FACULTY_FK%', error_message())>0 
					then 'конфликт с ограничением FOREIGN KEY'
					else 'неизвестная ошибка: '+cast(error_number() as varchar(5)) +error_message()
					end;
	if @@TRANCOUNT>0
		begin
			print 'контрольная точка: '+@point;
			rollback tran @point;    --откат к контрольной точке
			commit tran;     --фиксация изменений, выполненных до контрольной точки
		end;
end catch;

select * from FACULTY;