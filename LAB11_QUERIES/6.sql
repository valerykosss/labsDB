--�������� A ������������ ����� ����� ���������� � ������� ��������������� REPEATABLE READ. 
--�������� B � ����� ���������� � ������� ��������������� READ COMMITED. 
--�������� A ������ ���������������, ��� ������� REAPETABLE READ �� ��������� ����������������� ������ � ���������������� ������, 
--�� ��� ���� �������� ��������� ������. 

---A---
set transaction isolation level REPEATABLE READ
begin transaction
select NOTE from PROGRESS where SUBJECT='����';
-------------------------t1--------------------------
-------------------------t2--------------------------
select case
when NOTE=6 then 'insert PROGRESS' else ''
end '���������', NOTE from PROGRESS where SUBJECT='����';
commit;
---B---
begin transaction
-------------------------t1--------------------------
insert PROGRESS values ('����', 1030, '2021-12-30', 8);
commit;
-------------------------t2--------------------------


delete PROGRESS where IDSTUDENT=1030