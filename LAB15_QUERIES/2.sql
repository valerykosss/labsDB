--����������� �������� �������� XML-��������� � ������ AUTO �� ������ SELECT-������� � �������� 
--AUDITORIUM � AUDITORIUM_TYPE, ������� �������� ������-��� �������: ������������ ���������, 
--������������ ���� ��������� � �����������. ����� ������ ���������� ���������. 

use UNIVER_lab4

select [���������].AUDITORIUM_NAME[������������_���������],
[���_A��������].AUDITORIUM_TYPE [���_���������],
[���������].AUDITORIUM_CAPACITY [�����������_���������]
from AUDITORIUM [���������] join AUDITORIUM_TYPE [���_A��������]
	on [���������].AUDITORIUM_TYPE=[���_A��������].AUDITORIUM_TYPE
where [���������].AUDITORIUM_TYPE='��' for xml AUTO,
root('����������_���������'),elements;

select [���������].AUDITORIUM_NAME[������������_���������],
	   [���������].AUDITORIUM_TYPE [���_���������],
	   [���������].AUDITORIUM_CAPACITY[�����������]
from AUDITORIUM ��������� join AUDITORIUM_TYPE 
on [���������].AUDITORIUM_TYPE=AUDITORIUM_TYPE .AUDITORIUM_TYPE
where [���������].AUDITORIUM_TYPE='��' for xml AUTO,
root('����������_���������'),elements;