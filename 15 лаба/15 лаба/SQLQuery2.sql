--����������� �������� �������� XML-��������� � ������ AUTO �� ������ SELECT-������� � �������� 
--AUDITORIUM � AUDITORIUM_TYPE, ������� �������� ������-��� �������: ������������ ���������, 
--������������ ���� ��������� � �����������. ����� ������ ���������� ���������. 
select [���������].AUDITORIUM_NAME[������������_���������],
[���������].AUDITORIUM_TYPE [���_���������],
[���������].AUDITORIUM_CAPACITY[�����������]
from AUDITORIUM ��������� join AUDITORIUM_TYPE 
on [���������].AUDITORIUM_TYPE=AUDITORIUM_TYPE .AUDITORIUM_TYPE
where [���������].AUDITORIUM_TYPE='��' for xml AUTO,
root('����������_���������'),elements;