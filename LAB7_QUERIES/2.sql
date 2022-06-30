create view [Количество кафедр]
as select FACULTY_NAME[Факультет],
			COUNT (*) [Количество кафедр]
			from FACULTY, PULPIT WHERE
			FACULTY.FACULTY=PULPIT.FACULTY
			GROUP BY FACULTY_NAME