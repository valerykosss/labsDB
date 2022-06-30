--Разработать сценарий создания XML-документа в режиме PATH из таблицы 
--TEACHER для преподавателей кафедры ИСиТ. 
use UNIVER
go
select 
p.FACULTY[Факультет/@код],
p.PULPIT_NAME [Факультет/Кафедра/@код],
t.TEACHER_NAME [Факультет/Кафедра/Преподаватель/data()],
t.GENDER [Факультет/Кафедра/Преподаватель/data()]
from TEACHER t join PULPIT p 
on t.PULPIT=p.PULPIT
where p.PULPIT='ИСиТ' for xml PATH(''),
root('Список_преподавателей'), elements;