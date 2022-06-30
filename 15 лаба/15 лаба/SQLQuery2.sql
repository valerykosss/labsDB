--Разработать сценарий создания XML-документа в режиме AUTO на основе SELECT-запроса к таблицам 
--AUDITORIUM и AUDITORIUM_TYPE, который содержит следую-щие столбцы: наименование аудитории, 
--наименование типа аудитории и вместимость. Найти только лекционные аудитории. 
select [Аудитория].AUDITORIUM_NAME[Наименование_аудитории],
[Аудитория].AUDITORIUM_TYPE [Тип_аудитории],
[Аудитория].AUDITORIUM_CAPACITY[Вместимость]
from AUDITORIUM Аудитория join AUDITORIUM_TYPE 
on [Аудитория].AUDITORIUM_TYPE=AUDITORIUM_TYPE .AUDITORIUM_TYPE
where [Аудитория].AUDITORIUM_TYPE='ЛК' for xml AUTO,
root('Лекционные_аудитории'),elements;