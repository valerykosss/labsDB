DECLARE @x int=7, @z float, @t int=5;
IF (@t>@x) SET @z=SIN(@t)*SIN(@t)
ELSE IF (@t<@x) SET @z=4*(@t+@x)
ELSE IF (@t=@x) SET @z=1-EXP(@x-2)
PRINT 'z=' + cast(@z as varchar(5));

-------------------------------------

DECLARE @fio varchar(70) = '���� ������� �������������'

 print substring('���� ������� �������������',1,4) + ' '
 +  substring('���� ������� �������������',6,1)+'.'
 + substring('���� ������� �������������',14,1) + '.'

--print substring(@fio,1, charindex(' ',@fio))
--+ substring(@fio,     charindex(' ',@fio)+1,     1)+'.'
--+ substring(@fio,     charindex(' ',@fio, charindex(' ',@fio)+1)  +1,        1)+'.';

-------------------------------------

 SELECT NAME as '���', 2022-YEAR(BDAY) as '�������'
 FROM STUDENT
 WHERE MONTH(BDAY) = MONTH(GETDATE()) + 1;


 -------------------------------------
 SELECT STUDENT.NAME [��� ��������], STUDENT.IDGROUP [����� ������], DATENAME(dw,PDATE) [���� ����� ��������]
 FROM PROGRESS INNER JOIN STUDENT
 ON PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
 WHERE SUBJECT = '����' and STUDENT.IDGROUP = 5
