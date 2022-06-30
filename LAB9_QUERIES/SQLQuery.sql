--1 �������
--���������� ������� (���������-��, �����������-��)
use UNIVER;
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
CREATE table  #temp_table_one
(ind int, 
field varchar(100) 
);
SET nocount on;		--�� ����� ��������� � ����� �����
DECLARE @i int=0;
WHILE @i<1000
begin
INSERT #temp_table_one(ind, field)
values(floor(20000*RAND()), REPLICATE('������',10));
IF (@i%100=0) print @i;  --������� ���������
SET @i=@i+1; 
end;

--���� ������� � ��� ���������

SELECT * FROM #temp_table_one where ind between 1500 and 2500 order by ind 

--����� ���������� ������� �����
checkpoint;  --�������� ��; ��������� �������� ������ ������� �� ��������� ���� � ����� ��
DBCC DROPCLEANBUFFERS;  --�������� �������� ���

--���������� ���������, � ����� ������������ �� �� ��� �������, � �� ����� ����������������� �������
CREATE clustered index #temp_table_cl on #temp_table_one(ind asc)




--2 �������
create table #temp_table_two
(ind int, 
cc int identity(1,1),
field varchar(100)
);
set nocount on;           
declare @m int=0;
while   @m<20000       -- ���������� � ������� 20000 �����
begin
INSERT #temp_table_two(ind, field) values(floor(30000*RAND()), replicate('������ ', 10));
set @m=@m+1; 
end;

SELECT count(*)[���������� �����] from #temp_table_two;
SELECT * from #temp_table_two

--��������� ������������, ������������������ ������ �� ���� ��������
CREATE index #temp_table_two_nonclu on #temp_table_two(ind, cc)

--����� �������� � �� ���������
SELECT * from #temp_table_two where ind>1500 and cc<4500;
SELECT * from #temp_table_two order by ind,cc;

--���� ���� �� ���� �� ������������� �������� �������������, ��
--����������� �������� ������
SELECT * from  #temp_table_two where  ind = 556 and  CC > 3;



--3 �������
create table #temp_table_three
(ind int, 
cc int identity(1,1),
field varchar(100)
);
set nocount on;           
declare @n int=0;
while   @n<10000       -- ���������� � ������� 10000 �����
begin
INSERT #temp_table_three(ind, field) values(floor(30000*RAND()), replicate('������ ', 10));
set @n=@n+1; 
end;

--����� ������� � ��� ���������
SELECT cc from #temp_table_three where ind>15000 

--������������������ ������ ��������, ������. ���������
CREATE index #temp_table_three_ind_x on #temp_table_three(ind) INCLUDE (cc)




--4 �������
create table #temp_table_four
(ind int, 
cc int identity(1,1),
field varchar(100)
);
set nocount on;           
declare @j int=0;
while   @j<20000       -- ���������� � ������� 10000 �����
begin
INSERT #temp_table_four(ind, field) values(floor(30000*RAND()), replicate('������ ', 10));
set @j=@j+1; 
end;

SELECT ind from #temp_table_four where ind between 5000 and 9999;
SELECT ind from #temp_table_four where ind>1000 and ind<5000;
SELECT ind from #temp_table_four where ind=8000;

--������������������ ����������� ������, ��������� ����������
CREATE index #temp_table_four_where on #temp_table_four(ind) 
where (ind>=1000 and ind<5000);
--drop table #temp_table_four

--5 �������
--������� ������� ������������
CREATE index #temp_table_four_ind on #temp_table_four(ind);

use tempdb;
SELECT name[������], avg_fragmentation_in_percent[������������(%)]
FROM sys.dm_db_index_physical_stats(DB_ID(N'TEMPDB'),
OBJECT_iD(N'#temp_table_four'), NULL, NULL, NULL) ss JOIN sys.indexes ii 
on ss.object_id=ii.object_id and ss.index_id=ii.index_id
WHERE name is not null;

INSERT top(100000) #temp_table_four(ind, field) select ind, field from #temp_table_four;

--���������� �� ������������
--�������
ALTER index #temp_table_four_ind on #temp_table_four reorganize;
--������� ���������
ALTER index #temp_table_four_ind on #temp_table_four rebuild with (online=off);



--6 �������
drop index #temp_table_four_ind on #temp_table_four;
CREATE index #temp_table_four_ind on #temp_table_four(ind)
with (fillfactor=65);  --������� ���������� ��������� ������� ������� ������

INSERT top(50) INTO #temp_table_four(ind, field) select ind, field from #temp_table_four;

use tempdb;
SELECT name[������], avg_fragmentation_in_percent[������������(%)]
FROM sys.dm_db_index_physical_stats(DB_ID(N'TEMPDB'),
OBJECT_iD(N'#temp_table_four'), NULL, NULL, NULL) ss JOIN sys.indexes ii 
on ss.object_id=ii.object_id and ss.index_id=ii.index_id
WHERE name is not null;