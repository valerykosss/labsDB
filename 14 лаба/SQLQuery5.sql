--����������� ��������, ������� �������������, ��� �������� ����������� 
--����������� ����������� �� ������������ AFTER-��������.
alter table TEACHER 
add constraint GENDER check(GENDER in ('�','�'));
go
update TEACHER set GENDER='���' where GENDER='�';

