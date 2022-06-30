use UNIVER_lab4
go
select  [Кафедра].FACULTY[Факультет/@код],
		[Кафедра].PULPIT_NAME [Факультет/Кафедра/@код],
		[Преподаватель].TEACHER_NAME [Факультет/Кафедра/Преподаватель/data()],
		[Преподаватель].GENDER [Факультет/Кафедра/Преподаватель/data()]
from TEACHER [Преподаватель]  join PULPIT [Кафедра]
	on [Преподаватель].PULPIT=[Кафедра].PULPIT
	where [Кафедра].PULPIT='ИСиТ' for xml PATH(''),
root('Список_преподавателей'), elements;
