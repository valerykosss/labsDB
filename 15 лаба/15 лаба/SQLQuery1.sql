--����������� �������� �������� XML-��������� � ������ PATH �� ������� 
--TEACHER ��� �������������� ������� ����. 
use UNIVER
go
select 
p.FACULTY[���������/@���],
p.PULPIT_NAME [���������/�������/@���],
t.TEACHER_NAME [���������/�������/�������������/data()],
t.GENDER [���������/�������/�������������/data()]
from TEACHER t join PULPIT p 
on t.PULPIT=p.PULPIT
where p.PULPIT='����' for xml PATH(''),
root('������_��������������'), elements;