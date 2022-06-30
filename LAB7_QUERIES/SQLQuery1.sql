--/////////////////////////////////////////////////  ������� 1
--CREATE VIEW [�������������]
--		AS SELECT TEACHER[���],
--		TEACHER_NAME [��� ������������� ],
--		GENDER [���],
--		PULPIT [��� �������] FROM TEACHER

--/////////////////////////////////////////////////  ������� 2

--CREATE VIEW [���������� ������]
--		AS SELECT FACULTY_NAME,
--		COUNT (*) [���������� ������]
--		FROM FACULTY f, PULPIT p where
--	    f.FACULTY = p.FACULTY
--		GROUP BY  FACULTY_NAME;

--/////////////////////////////////////////////////  ������� 3
--CREATE VIEW [���������]
--AS SELECT AUDITORIUM.AUDITORIUM,
--AUDITORIUM.AUDITORIUM_NAME
--FROM AUDITORIUM

--/////////////////////////////////////////////////  ������� 4

--CREATE VIEW [����������_���������]
--AS SELECT AUDITORIUM.AUDITORIUM,
--AUDITORIUM.AUDITORIUM_NAME
--FROM AUDITORIUM
--WHERE AUDITORIUM_TYPE LIKE '%��'

--/////////////////////////////////////////////////  ������� 5

--CREATE VIEW [����������](SUBJECT, SUBJECT_NAME,PULPIT)
--		AS SELECT TOP 150 SUBJECT_NAME,SUBJECT,PULPIT FROM SUBJECT
--		ORDER BY SUBJECT_NAME;

--/////////////////////////////////////////////////  ������� 6

CREATE VIEW [���������� ������_6]  with schemabinding
		AS SELECT FACULTY_NAME,
		COUNT (*) [���������� ������]
		FROM dbo.FACULTY join dbo.PULPIT on
	    FACULTY.FACULTY = PULPIT.FACULTY
		GROUP BY  FACULTY_NAME;