--�������� A ������������ ����� ����� ���������� � ������� ��������������� READ UNCOMMITED, 
--�������� B � ����� ���������� � ������� ��������������� READ COMMITED (�� ���������). 
--�������� A ������ ���������������, ��� ������� READ UNCOMMITED ��������� ����������������, 
--��������������� � ��������� ������. 
---A---
set transaction isolation level READ UNCOMMITTED 
begin transaction
-------------------------t1--------------------------
select @@SPID, 'insert FACULTY' '���������', * from FACULTY --���������� ��������� ������������� ��������, ����������� �������� �������� �����������
where FACULTY='���';
select @@SPID, 'update FACULTY' '���������', * from FACULTY
where FACULTY='���';
commit;

