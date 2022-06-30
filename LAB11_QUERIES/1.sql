--����������� ��������, ��������������� ������ � ������ ������� ����������.
set nocount on
	
if  exists (select * from  SYS.OBJECTS        -- ������� X ����?
	        where OBJECT_ID= object_id(N'DBO.X') )	            
drop table TableOne;           
declare @c int, @flag char = 'c';           -- commit ��� rollback?
SET IMPLICIT_TRANSACTIONS  ON   -- �����. ����� ������� ����������
CREATE table TableOne(K int );                         -- ������ ���������� 
	INSERT TableOne values (1),(2),(3);
	set @c = (select count(*) from TableOne);
	print '���������� ����� � ������� TableOne: ' + cast( @c as varchar(2));
	if @flag = 'c'  commit;                   -- ���������� ����������: �������� 
	else   rollback;                                 -- ���������� ����������: �����  
SET IMPLICIT_TRANSACTIONS  OFF   -- ������. ����� ������� ����������
	
if  exists (select * from  SYS.OBJECTS       -- ������� X ����?
	        where OBJECT_ID= object_id(N'DBO.TableOne') )
print '������� "TableOne" ����';  
else print '������� "TableOne" ���'
