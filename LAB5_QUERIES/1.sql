use UNIVER_lab4
SELECT FACULTY.FACULTY_NAME, PULPIT.PULPIT_NAME
FROM FACULTY, PULPIT
WHERE PULPIT.FACULTY=FACULTY.FACULTY
AND PULPIT.FACULTY IN (SELECT PROFESSION.FACULTY FROM PROFESSION
					WHERE (PROFESSION_NAME LIKE '%технологи%'))

SELECT PROFESSION.FACULTY, PROFESSION_NAME FROM PROFESSION
WHERE (PROFESSION_NAME LIKE '%технологи%')