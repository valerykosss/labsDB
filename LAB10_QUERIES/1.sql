DECLARE @subj char(20), @disc char(300)=''
--объ€вление курсора
DECLARE DiciplineListCurs CURSOR 
						  for SELECT SUBJECT FROM SUBJECT WHERE PULPIT='»—и“' ;
--открытие курсора
OPEN DiciplineListCurs;

--считывает одну строку из результирующего набора
--и продвигает указатель на следующую строку.
FETCH DiciplineListCurs INTO @subj;
print '—писок дисциплин на кафедре »—и“';
while @@fetch_status=0
	begin 
		set @disc=RTRIM(@subj)+','+@disc;
		FETCH DiciplineListCurs into @subj;
	end;
print @disc;
--закрытие курсора
CLOSE DiciplineListCurs;