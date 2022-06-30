------------------------1----------------------------
use UNIVER_lab4;
exec SP_HELPINDEX 'AUDITORIUM_TYPE' --�������� �������� ��������, ����. � ����.
exec SP_HELPINDEX 'AUDITORIUM'
exec SP_HELPINDEX 'FACULTY'
exec SP_HELPINDEX 'GROUPS'
exec SP_HELPINDEX 'PROFESSION'
exec SP_HELPINDEX 'PROGRESS'
exec SP_HELPINDEX 'PULPIT'
exec SP_HELPINDEX 'STUDENT'
exec SP_HELPINDEX 'SUBJECT'
exec SP_HELPINDEX 'TEACHER'

--������� ��������� ��������� ������� � 1000 ��������
CREATE table #TempTableTask1
(   
	ind int,  
    field varchar(100) 
);
SET nocount on;		--�� �������� ��������� � ����� �����
DECLARE @i int=0;
WHILE @i<1000
begin
	INSERT #TempTableTask1(ind, field)
		values (floor(20000*RAND()),  REPLICATE('����� ', 4));
	IF (@i % 100=0) print @i;
	SET @i=@i+1;
end;

--���� ������� � ��� ���������
SELECT * FROM #TempTableTask1 where ind between 300 and 800 order by ind;

--����� ���������� ������� �����
checkpoint;  --�������� ��; ��������� �������� ������ ������� �� ��������� ���� � ����� ��
DBCC DROPCLEANBUFFERS;  --�������� �������� ���

--���������� ���������=������� ����������, � ����� ������������ �� �� ���� �������, � �� ����� ����������������� �������
CREATE clustered index #TempTableCl on #TempTableTask1(ind asc)



------------------------2----------------------------
CREATE table #TempTableTask2
(    ind int, 
     cc int identity(1, 1),
     field varchar(100)
);

set nocount on;           
declare @m int=0;
while   @m < 20000        -- ���������� � ������� 20000 �����
begin
	INSERT #TempTableTask2(ind, field) values(floor(30000*RAND()), replicate('����� ', 4));
    set @m = @m + 1;  
end;
  
SELECT count(*)[���������� �����] from #TempTableTask2;
SELECT * from #TempTableTask2

--��������� ������������, ������������������ ������ �� ���� ��������
CREATE index #TempTableTask2NonCl on #TempTableTask2(ind, cc)

--����� �������� � �� ���������(0.011), 
--���� ������ �� ����������� ������������� �� ��� ����������, �� ��� ���������� 
SELECT * from  #TempTableTask2 where  ind > 1500 and  cc < 4500;  
SELECT * from  #TempTableTask2 order by  ind, cc;

--���� ���� �� ���� �� ������������� �������� �������������, ��
--����������� �������� ������(0.033)
SELECT * from  #TempTableTask2 where  ind = 26236 and  cc > 3;

--drop index #TempTableTask2NonCl on #TempTableTask2


------------------------3----------------------------
CREATE table #TempTableTask3
(
	ind int, 
	cc int identity(1,1),
	field varchar(100)
);
set nocount on;           
declare @n int=0;
while   @n < 10000       -- ���������� � ������� 10000 �����
begin
INSERT #TempTableTask3(ind, field) values(floor(30000*RAND()), replicate('����� ', 3));
set @n = @n + 1; 
end;

--����� ������� � ��� ���������(0.05)
SELECT CC from #TempTableTask3 where ind > 15000 

--������������������ ������ ��������, ������. ���������
CREATE  index #TempTableTask3NonCl on #TempTableTask3(ind) INCLUDE (cc);

--����� ������� � ��� ���������(0.019)
SELECT CC from #TempTableTask3 where ind > 15000 



------------------------4----------------------------

create table #TempTableTask4
(
	ind int, 
	cc int identity(1,1),
	field varchar(100)
);
set nocount on;           
declare @j int=0;
while   @j < 20000       -- ���������� � ������� 20000 �����
begin
	INSERT #TempTableTask4(ind, field) values(floor(30000*RAND()), replicate('����� ', 3));
	set @j = @j + 1; 
end;


SELECT ind from  #TempTableTask4 where ind between 5000 and 19999;
SELECT ind from  #TempTableTask4 where ind > 15000 and  ind < 20000
SELECT ind from  #TempTableTask4 where ind = 17000;

--������������������ ����������� ������, ��������� ����������
CREATE  index #TempTableTask4Cl on #TempTableTask4(ind) where (ind>=15000 and ind < 20000);

SELECT ind from  #TempTableTask4 where ind between 5000 and 19999; 
SELECT ind from  #TempTableTask4 where ind > 15000 and  ind < 20000  
SELECT ind from  #TempTableTask4 where ind = 17000;
--drop table #TempTableTask4



------------------------5----------------------------
--������� ������� ������������
CREATE index #TempTableTask4Ind ON #TempTableTask4(ind); 

--������������� 37,5
use tempdb;
SELECT name [������], avg_fragmentation_in_percent [������������ (%)]
        FROM sys.dm_db_index_physical_stats(DB_ID(N'TEMPDB'), 
        OBJECT_ID(N'#TempTableTask4'), NULL, NULL, NULL) ss  JOIN sys.indexes ii
		on ss.object_id = ii.object_id and ss.index_id = ii.index_id
		WHERE name is not null;

--����� ������� 93,3-97.7		  
INSERT top(10000) #TempTableTask4(ind, field) select ind, field from #TempTableTask4;
  
SELECT name [������], avg_fragmentation_in_percent [������������ (%)]
       FROM sys.dm_db_index_physical_stats(DB_ID(N'TEMPDB'), 
       OBJECT_ID(N'#TempTableTask4'), NULL, NULL, NULL) ss JOIN sys.indexes ii
	   on ss.object_id = ii.object_id and ss.index_id = ii.index_id
       WHERE name is not null;  

--�������������
--��������� ������� ������������(3 ����� 16,4)
ALTER index #TempTableTask4Ind on #TempTableTask4 reorganize;
SELECT name [������], avg_fragmentation_in_percent [������������ (%)]
        FROM sys.dm_db_index_physical_stats(DB_ID(N'TEMPDB'), 
        OBJECT_ID(N'#TempTableTask4'), NULL, NULL, NULL) ss JOIN sys.indexes ii
		on ss.object_id = ii.object_id and ss.index_id = ii.index_id
        WHERE name is not null;  

--�����������
--������� ���������(3 ����� 1.49)
ALTER index #TempTableTask4Ind on #TempTableTask4 rebuild with (online = off); 
 
SELECT name [������], avg_fragmentation_in_percent [������������ (%)]
        FROM sys.dm_db_index_physical_stats(DB_ID(N'TEMPDB'), 
        OBJECT_ID(N'#TempTableTask4'), NULL, NULL, NULL) ss JOIN sys.indexes ii
		on ss.object_id = ii.object_id and ss.index_id = ii.index_id
        WHERE name is not null;  


 ------------------------6----------------------------                                                                                                
DROP index  #TempTableTask4Ind on #TempTableTask4;
--fillfactor ������� ���������� ��������� ������� ������� ������
CREATE index #TempTableTask4Ind on #TempTableTask4(ind) with (fillfactor = 65); 


use tempdb;
SELECT name [������], avg_fragmentation_in_percent [������������ (%)]
       FROM sys.dm_db_index_physical_stats(DB_ID(N'TEMPDB'),    
       OBJECT_ID(N'#TempTableTask4'), NULL, NULL, NULL) ss  JOIN sys.indexes ii 
       ON ss.object_id = ii.object_id and ss.index_id = ii.index_id
	   WHERE name is not null; 


--INSERT top(50)percent INTO #TempTableTask4(ind, field)
INSERT top(50) INTO #TempTableTask4(ind, field)
SELECT ind, field  FROM #TempTableTask4;

use tempdb;
SELECT name [������], avg_fragmentation_in_percent [������������ (%)]
       FROM sys.dm_db_index_physical_stats(DB_ID(N'TEMPDB'),    
       OBJECT_ID(N'#TempTableTask4'), NULL, NULL, NULL) ss  JOIN sys.indexes ii 
       ON ss.object_id = ii.object_id and ss.index_id = ii.index_id
	   WHERE name is not null; 
                                                                                    


