create view [Количество кафедр_new] with schemabinding
as select FACULTY_NAME[Факультет],
			COUNT (*) [Количество кафедр]
			FROM dbo.FACULTY join dbo.PULPIT on
			FACULTY.FACULTY = PULPIT.FACULTY
			GROUP BY  FACULTY_NAME;