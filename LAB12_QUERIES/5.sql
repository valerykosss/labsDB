--В отчет должны быть выведены краткие названия (поле SUBJECT) из таблицы SUBJECT в одну 
--строку через запятую (использовать встроенную функцию RTRIM). 

create procedure SUBJECT_REPORT @p CHAR(50)
as
declare @rc int=0;
begin try 
  declare @tv char(20), @t char(300)='';
  declare SubjCurs CURSOR for
  select SUBJECT from SUBJECT where PULPIT=@p;
  if not exists (select SUBJECT from SUBJECT where PULPIT=@p)
		raiserror('ошибка',11,1);
  else
		open SubjCurs;
		fetch SubjCurs into @tv;
		print 'Дисциплины: ';
		while @@FETCH_STATUS=0
		  begin
		   set @t=rtrim(@tv)+', '+@t;
		   set @rc=@rc+1;
		   fetch SubjCurs into @tv;
		  end;
  print @t;
  close SubjCurs;
  return @rc;
end try

begin catch
  print 'ошибка в параметрах'
  if error_procedure() is not null
    print 'имя процедуры: '+error_procedure();
  return @rc;
end catch;

declare @rc1 int;
exec @rc1=SUBJECT_REPORT @p='ИСиТ';
print 'Количество дисциплин = '+cast(@rc1 as varchar(3));

--drop procedure SUBJECT_REPORT
