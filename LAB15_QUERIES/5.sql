--�������� (ALTER TABLE) ������� STUDENT � ���� ������ UNIVER ����� �������, ����� �������� ��������������� 
--������� � ������ INFO ���������������� ���������� XML-���� (XML SCHEMACOLLECTION), �������������� � ������ �����. 
--����������� ��������, ��������������� ���� � ������������� ������ (��������� INSERT � UPDATE) � ������� INFO ������� STUDENT, 
--��� ���������� ������, ��� � ����������.

use UNIVER_lab4
go
create xml schema collection Student as 
N'<?xml version="1.0" encoding="utf-16" ?>
<xs:schema attributeFormDefault="unqualified" 
		elementFormDefault="qualified"
		xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xs:element name="�������">  
		<xs:complexType><xs:sequence>
		<xs:element name="�������" maxOccurs="1" minOccurs="1">
		<xs:complexType>
		<xs:attribute name="�����" type="xs:string" use="required" />
		<xs:attribute name="�����" type="xs:unsignedInt" use="required"/> 
	    </xs:complexType> 
		</xs:element>
		<xs:element name="�����">  
		<xs:complexType><xs:sequence>
		<xs:element name="������" type="xs:string" />
		<xs:element name="�����" type="xs:string" />
		<xs:element name="�����" type="xs:string" />
		<xs:element name="���" type="xs:string" />
		<xs:element name="��������" type="xs:string" />
		</xs:sequence></xs:complexType>  </xs:element>
		</xs:sequence></xs:complexType>
	</xs:element>
</xs:schema>';

alter table STUDENT alter column INFO xml(Student);
select Name, INFO from STUDENT where BDAY='11.08.1999';


--drop XML SCHEMA COLLECTION Student;

insert into STUDENT(IDGROUP, NAME, BDAY, INFO)
values (1, '�������� ��������� ������������', '11.08.1999',
		'<�������>
		<������� �����="MP" �����="22223333"/>
		<�����>
			<������>��������</������>
			<�����>�����</�����>
			<�����>�������</�����>
			<���>62</���>
			<��������>47</��������>
		</�����>
		</�������>');

update STUDENT
set INFO='<�������>
		<������� �����="MP" �����="22223333"/>
		<�����>
			<������>��������</������>
			<�����>�����</�����>
			<�����>�������</�����>
			<���>62</���>
			<��������>47</��������>
		</�����>
		</�������>'
where INFO.value('(/�������/�������/@�����)[1]','varchar(10)')='22223333';
