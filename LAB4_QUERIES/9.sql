use UNIVER_lab4
SELECT AUDITORIUM_TYPE.AUDITORIUM_TYPENAME, AUDITORIUM.AUDITORIUM
FROM  AUDITORIUM_TYPE Cross Join  AUDITORIUM
where AUDITORIUM_TYPE.AUDITORIUM_TYPE = AUDITORIUM.AUDITORIUM_TYPE

--?????? 1 inner join
--use UNIVER_lab4
--SELECT AUDITORIUM_TYPE.AUDITORIUM_TYPENAME, AUDITORIUM.AUDITORIUM
--FROM AUDITORIUM_TYPE Inner Join AUDITORIUM
--ON AUDITORIUM_TYPE.AUDITORIUM_TYPE = AUDITORIUM.AUDITORIUM_TYPE