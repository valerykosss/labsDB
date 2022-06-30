DECLARE @x int=7, @z float, @t int=5;
IF (@t>@x) SET @z=SIN(@t)*SIN(@t)
ELSE IF (@t<@x) SET @z=4*(@t+@x)
ELSE IF (@t=@x) SET @z=1-EXP(@x-2)
PRINT 'z=' + cast(@z as varchar(5));

-------------------------------------

DECLARE @fio varchar(70) = 'Косс Валерия Александровна'

 print substring('Косс Валерия Александровна',1,4) + ' '
 +  substring('Косс Валерия Александровна',6,1)+'.'
 + substring('Косс Валерия Александровна',14,1) + '.'

--print substring(@fio,1, charindex(' ',@fio))
--+ substring(@fio,     charindex(' ',@fio)+1,     1)+'.'
--+ substring(@fio,     charindex(' ',@fio, charindex(' ',@fio)+1)  +1,        1)+'.';

-------------------------------------

 SELECT NAME as 'Имя', 2022-YEAR(BDAY) as 'Возраст'
 FROM STUDENT
 WHERE MONTH(BDAY) = MONTH(GETDATE()) + 1;


 -------------------------------------
 SELECT STUDENT.NAME [Имя студента], STUDENT.IDGROUP [Номер группы], DATENAME(dw,PDATE) [День сдачи экзамена]
 FROM PROGRESS INNER JOIN STUDENT
 ON PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
 WHERE SUBJECT = 'СУБД' and STUDENT.IDGROUP = 5
