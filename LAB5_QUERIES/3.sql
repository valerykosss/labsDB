use UNIVER_lab4
SELECT distinct PULPIT.PULPIT_NAME, PROFESSION.FACULTY
FROM PROFESSION Inner Join PULPIT
ON (PROFESSION.FACULTY = PULPIT.FACULTY and PROFESSION_NAME like '%���������%')
Inner Join FACULTY
ON PULPIT.FACULTY=FACULTY.FACULTY