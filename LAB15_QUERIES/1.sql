use UNIVER_lab4
go
select  [�������].FACULTY[���������/@���],
		[�������].PULPIT_NAME [���������/�������/@���],
		[�������������].TEACHER_NAME [���������/�������/�������������/data()],
		[�������������].GENDER [���������/�������/�������������/data()]
from TEACHER [�������������]  join PULPIT [�������]
	on [�������������].PULPIT=[�������].PULPIT
	where [�������].PULPIT='����' for xml PATH(''),
root('������_��������������'), elements;
