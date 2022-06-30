--Изменить (ALTER TABLE) таблицу STUDENT в базе данных UNIVER таким образом, чтобы значения типизированного 
--столбца с именем INFO контролировались коллекцией XML-схем (XML SCHEMACOLLECTION), представленной в правой части. 
--Разработать сценарии, демонстрирующие ввод и корректировку данных (операторы INSERT и UPDATE) в столбец INFO таблицы STUDENT, 
--как содержащие ошибки, так и правильные.

use UNIVER_lab4
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
	    </xs:complexType> 
		</xs:element>
		<xs:element name="адрес">  
		<xs:complexType><xs:sequence>
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
select Name, INFO from STUDENT where BDAY='11.08.1999';


--drop XML SCHEMA COLLECTION Student;

insert into STUDENT(IDGROUP, NAME, BDAY, INFO)
values (1, 'Манакова Анастасия Владимировна', '11.08.1999',
		'<студент>
		<паспорт серия="MP" номер="22223333"/>
		<адрес>
			<страна>Беларусь</страна>
			<город>Минск</город>
			<улица>Лобанка</улица>
			<дом>62</дом>
			<квартира>47</квартира>
		</адрес>
		</студент>');

update STUDENT
set INFO='<студент>
		<паспорт серия="MP" номер="22223333"/>
		<адрес>
			<страна>Беларусь</страна>
			<город>Минск</город>
			<улица>Лобанка</улица>
			<дом>62</дом>
			<квартира>47</квартира>
		</адрес>
		</студент>'
where INFO.value('(/студент/паспорт/@номер)[1]','varchar(10)')='22223333';
