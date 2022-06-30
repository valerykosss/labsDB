--Разработать XML-документ, содержащий данные о трех новых учебных дисциплинах, которые следует добавить в таблицу SUBJECT. 
--Разработать сценарий, извлекающий данные о дисциплинах из XML-документа и добавляющий их в таблицу SUBJECT. 
--При этом применить системную функцию OPENXML и конструкцию INSERT… SELECT. 
use UNIVER_lab4
go
declare @h int=0,
@x varchar(2000)='<?xml version="1.0" encoding="windows-1251" ?>
	<дисциплины>
		<дисциплина код="КГиД" название="Компьютерная графика и дизайн" кафедра="ИСиТ"/>
		<дисциплина код="КГиГ" название="Компьютерная геометрия и графика" кафедра="ИСиТ"/>
		<дисциплина код="ТЦ" название="Теория цвета" кафедра="ИСиТ"/>
	</дисциплины>';
exec sp_xml_preparedocument @h output, @x;  -- подготовка документа 

insert SUBJECT select* from openxml (@h, '/дисциплины/дисциплина',0)
with([код] char(20), [название] varchar(100), [кафедра] char(20));
exec sp_xml_removedocument @h;

select * from SUBJECT;
delete from SUBJECT where SUBJECT.SUBJECT='КГиД' or SUBJECT.SUBJECT='КГиГ' or SUBJECT.SUBJECT='МП'
