--�������� A � �  ������������ ����� ����� ���������� � ������� ��������������� READ COMMITED. 
--�������� A ������ ���������������, ��� ������� READ COMMITED �� ��������� ����������������� ������, 
--�� ��� ���� �������� ��������������� � ��������� ������. 
---A---
set transaction isolation level READ COMMITTED 
begin transaction 
select count(*) from FACULTY where FACULTY = '��';
--------------------------t1------------------
 
--------------------------t2-----------------
select  'update FACULTY' '���������', count(*)
	            from FACULTY  where FACULTY = '��';
commit; 


---B---	
begin transaction 	  
---------------------------t1--------------------
 update FACULTY set FACULTY = '��' 
               where FACULTY = '���' 
commit; 
---------------------------t2--------------------
