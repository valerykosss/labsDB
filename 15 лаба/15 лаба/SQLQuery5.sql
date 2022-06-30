--�������� (ALTER TABLE) ������� STUDENT � ���� ������ UNIVER ����� �������, ����� �������� ��������������� 
--������� � ������ INFO ���������������� ���������� XML-���� (XML SCHEMACOLLECTION), �������������� � ������ �����. 
--����������� ��������, ��������������� ���� � ������������� ������ (��������� INSERT � UPDATE) � ������� INFO ������� STUDENT, 
--��� ���������� ������, ��� � ����������.

use UNIVER
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
<xs:attribute name="����"  use="required" >  
<xs:simpleType>  <xs:restriction base ="xs:string">
<xs:pattern value="[0-9]{2}.[0-9]{2}.[0-9]{4}"/>
</xs:restriction> 	</xs:simpleType>
</xs:attribute> </xs:complexType> 
</xs:element>
<xs:element maxOccurs="3" name="�������" type="xs:unsignedInt"/>
<xs:element name="�����">   <xs:complexType><xs:sequence>
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
select Name, INFO from STUDENT where BDAY='09.12.1995';


--drop XML SCHEMA COLLECTION Student;

insert into STUDENT(IDGROUP, NAME, BDAY, INFO)
values (1, '�������� ��������� ������������', '09.12.1995',
'<�������>
<������� �����="MP" �����="22223333" ����="11.01.2000"/>
<�������>44445555</�������>
<�����>
<������>��������</������>
<�����>�����</�����>
<�����>������</�����>
<���>52</���>
<��������>76</��������>
</�����>
</�������>');

update STUDENT
set INFO='<�������>
<������� �����="MP" �����="22223333" ����="11.01.2000"/>
<�������>44445555</�������>
<�����>
<������>��������</������>
<�����>�����</�����>
<�����>������</�����>
<���>53</���>
<��������>76</��������>
</�����>
</�������>'
where INFO.value('(/�������/�������/@�����)[1]','varchar(10)')='22223333';
