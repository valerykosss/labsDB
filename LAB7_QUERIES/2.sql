create view [���������� ������]
as select FACULTY_NAME[���������],
			COUNT (*) [���������� ������]
			from FACULTY, PULPIT WHERE
			FACULTY.FACULTY=PULPIT.FACULTY
			GROUP BY FACULTY_NAME