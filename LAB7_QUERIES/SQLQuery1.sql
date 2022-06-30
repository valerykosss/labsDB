--/////////////////////////////////////////////////  Задание 1
--CREATE VIEW [Преподаватель]
--		AS SELECT TEACHER[Код],
--		TEACHER_NAME [Имя преподавателя ],
--		GENDER [Пол],
--		PULPIT [Код кафедры] FROM TEACHER

--/////////////////////////////////////////////////  Задание 2

--CREATE VIEW [Количество кафедр]
--		AS SELECT FACULTY_NAME,
--		COUNT (*) [Количество кафедр]
--		FROM FACULTY f, PULPIT p where
--	    f.FACULTY = p.FACULTY
--		GROUP BY  FACULTY_NAME;

--/////////////////////////////////////////////////  Задание 3
--CREATE VIEW [Аудитории]
--AS SELECT AUDITORIUM.AUDITORIUM,
--AUDITORIUM.AUDITORIUM_NAME
--FROM AUDITORIUM

--/////////////////////////////////////////////////  Задание 4

--CREATE VIEW [Лекционные_аудитории]
--AS SELECT AUDITORIUM.AUDITORIUM,
--AUDITORIUM.AUDITORIUM_NAME
--FROM AUDITORIUM
--WHERE AUDITORIUM_TYPE LIKE '%лк'

--/////////////////////////////////////////////////  Задание 5

--CREATE VIEW [Дисциплины](SUBJECT, SUBJECT_NAME,PULPIT)
--		AS SELECT TOP 150 SUBJECT_NAME,SUBJECT,PULPIT FROM SUBJECT
--		ORDER BY SUBJECT_NAME;

--/////////////////////////////////////////////////  Задание 6

CREATE VIEW [Количество кафедр_6]  with schemabinding
		AS SELECT FACULTY_NAME,
		COUNT (*) [Количество кафедр]
		FROM dbo.FACULTY join dbo.PULPIT on
	    FACULTY.FACULTY = PULPIT.FACULTY
		GROUP BY  FACULTY_NAME;