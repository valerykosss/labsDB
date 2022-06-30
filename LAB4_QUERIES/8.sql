use UNIVER_lab4
--��������������� OUTER JOIN: �������������� ����� �� ������� �� �������, � ������� ������� �������� �������.
SELECT * 
FROM PULPIT FULL OUTER JOIN  TEACHER
ON PULPIT.PULPIT = TEACHER.PULPIT
WHERE TEACHER_NAME IS NULL

SELECT * 
FROM TEACHER FULL OUTER JOIN  PULPIT
ON PULPIT.PULPIT = TEACHER.PULPIT
WHERE TEACHER_NAME IS NULL

--1 �������� ������ ����� (� �������� FULL OUTER JOIN) � �� �������� ������ ������
SELECT *
FROM PULPIT FULL OUTER JOIN TEACHER 
ON PULPIT.PULPIT = TEACHER.PULPIT
WHERE TEACHER_NAME IS NULL
ORDER BY PULPIT_NAME,FACULTY

--2 �������� ������ ������ ������� � �� ���������� ������ �����
SELECT PULPIT.PULPIT,PULPIT.PULPIT_NAME,PULPIT.FACULTY 
FROM TEACHER  RIGHT OUTER JOIN  PULPIT 
ON PULPIT.PULPIT = TEACHER.PULPIT
WHERE TEACHER_NAME IS NULL
    

--3 �������� ������ ������ ������� � �����
SELECT PULPIT.PULPIT,PULPIT.PULPIT_NAME,PULPIT.FACULTY, TEACHER.TEACHER_NAME 
FROM PULPIT FULL OUTER JOIN TEACHER 
ON PULPIT.PULPIT = TEACHER.PULPIT
WHERE TEACHER_NAME IS NOT NULL
ORDER BY PULPIT_NAME,FACULTY