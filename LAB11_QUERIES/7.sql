--�������� A ������������ ����� ����� ���������� � ������� ��������������� SERIALIZABLE. 
--�������� B � ����� ���������� � ������� ��������������� READ COMMITED.
--�������� A ������ ��������������� ���������� ����������, ����������������� � ���������������� ������.
---A---
set transaction isolation level SERIALIZABLE
begin transaction
--delete PROGRESS where SUBJECT='����';
insert PROGRESS values ('����', 1017, '2021-05-05', 10);
select IDSTUDENT from PROGRESS where SUBJECT='����';
-------------------------t1--------------------------
select IDSTUDENT from PROGRESS where SUBJECT='����';
-------------------------t2--------------------------
commit;
---B---
begin transaction
--delete PROGRESS where SUBJECT='����';
insert PROGRESS values ('����', 1017, '2021-05-05', 10);
select IDSTUDENT from PROGRESS where SUBJECT='����';
-------------------------t1--------------------------
commit;
select IDSTUDENT from PROGRESS where SUBJECT='����';
-------------------------t2--------------------------




insert PROGRESS values ('����', 1005, '2013-10-01', 8);