--����������� XML-��������, ���������� ������ � ���� ����� ������� �����������, ������� ������� �������� � ������� SUBJECT. 
--����������� ��������, ����������� ������ � ����������� �� XML-��������� � ����������� �� � ������� SUBJECT. 
--��� ���� ��������� ��������� ������� OPENXML � ����������� INSERT� SELECT. 
use UNIVER
go
declare @h int=0,
@x varchar(2000)='<?xml version="1.0" encoding="windows-1251" ?>
<����������>
<���������� ���="���" ��������="������������ ����� ��������" �������="����"/>
<���������� ���="��" ��������="������ �����" �������="����"/>
<���������� ���="���" ��������="������ �������� ������������" �������="����"/>
</����������>';
exec sp_xml_preparedocument @h output, @x;  -- ���������� ��������� 
insert SUBJECT select [���], [��������], [�������]
from openxml (@h, '/����������/����������',0)
with([���] char(20), [��������] varchar(100), [�������] char(20));
exec sp_xml_removedocument @h;

select * from SUBJECT;
delete from SUBJECT where SUBJECT.SUBJECT='���' or SUBJECT.SUBJECT='��' or SUBJECT.SUBJECT='���'
