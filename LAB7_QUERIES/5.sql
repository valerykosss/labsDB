create view [���������� ������_new] with schemabinding
as select FACULTY_NAME[���������],
			COUNT (*) [���������� ������]
			FROM dbo.FACULTY join dbo.PULPIT on
			FACULTY.FACULTY = PULPIT.FACULTY
			GROUP BY  FACULTY_NAME;