--Изменить (ALTER TABLE) таблицу STUDENT в базе данных UNIVER таким образом, чтобы значения типизированного 
--столбца с именем INFO контролировались коллекцией XML-схем (XML SCHEMACOLLECTION), представленной в правой части. 
--Разработать сценарии, демонстрирующие ввод и корректировку данных (операторы INSERT и UPDATE) в столбец INFO таблицы STUDENT, 
--как содержащие ошибки, так и правильные.

use UNIVER
go
create xml schema collection Student as 
N'<?xml version="1.0" encoding="utf-16" ?>
<xs:schema attributeFormDefault="unqualified" 
elementFormDefault="qualified"
xmlns:xs="http://www.w3.org/2001/XMLSchema">
<xs:element name="студент">  
<xs:complexType><xs:sequence>
<xs:element name="паспорт" maxOccurs="1" minOccurs="1">
<xs:complexType>
<xs:attribute name="серия" type="xs:string" use="required" />
<xs:attribute name="номер" type="xs:unsignedInt" use="required"/>
<xs:attribute name="дата"  use="required" >  
<xs:simpleType>  <xs:restriction base ="xs:string">
<xs:pattern value="[0-9]{2}.[0-9]{2}.[0-9]{4}"/>
</xs:restriction> 	</xs:simpleType>
</xs:attribute> </xs:complexType> 
</xs:element>
<xs:element maxOccurs="3" name="телефон" type="xs:unsignedInt"/>
<xs:element name="адрес">   <xs:complexType><xs:sequence>
<xs:element name="страна" type="xs:string" />
<xs:element name="город" type="xs:string" />
<xs:element name="улица" type="xs:string" />
<xs:element name="дом" type="xs:string" />
<xs:element name="квартира" type="xs:string" />
</xs:sequence></xs:complexType>  </xs:element>
</xs:sequence></xs:complexType>
</xs:element>
</xs:schema>';

alter table STUDENT alter column INFO xml(Student);
select Name, INFO from STUDENT where BDAY='09.12.1995';


--drop XML SCHEMA COLLECTION Student;

insert into STUDENT(IDGROUP, NAME, BDAY, INFO)
values (1, 'Манакова Анастасия Владимировна', '09.12.1995',
'<студент>
<паспорт серия="MP" номер="22223333" дата="11.01.2000"/>
<телефон>44445555</телефон>
<адрес>
<страна>Беларусь</страна>
<город>Минск</город>
<улица>Кирова</улица>
<дом>52</дом>
<квартира>76</квартира>
</адрес>
</студент>');

update STUDENT
set INFO='<студент>
<паспорт серия="MP" номер="22223333" дата="11.01.2000"/>
<телефон>44445555</телефон>
<адрес>
<страна>Беларусь</страна>
<город>Минск</город>
<улица>Кирова</улица>
<дом>53</дом>
<квартира>76</квартира>
</адрес>
</студент>'
where INFO.value('(/студент/паспорт/@номер)[1]','varchar(10)')='22223333';
