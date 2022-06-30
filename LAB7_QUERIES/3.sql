create view Аудитории(код, наименовани_аудитории, тип_аудитории)
as select AUDITORIUM,AUDITORIUM_NAME, AUDITORIUM_TYPE from AUDITORIUM
			WHERE AUDITORIUM_TYPE like 'ЛК%' with check option
go 
select *from Аудитории
insert Аудитории values(307-7, 307-7, 'ЛК')
