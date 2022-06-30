--вариант 4
--добавить identity
use master
create database KRR;

create table STUDENT(
	IDST int primary key identity(1,1),
	IDGROUP int check (IDGROUP>0),
	NAME nvarchar(100) not null default '***',
	BDAY date
);

create table SESSIA(
	IDSESSIA int identity(1,1),
	SUBJ nvarchar(40),
	IDST int foreign key references STUDENT(IDST),
	PDATE date,
	NOTE int default 0
);

INSERT into STUDENT(IDGROUP, NAME, BDAY)
Values (1, 'Косс ВА', '2001-04-01'),
		(1, 'Потапчик АА', '2002-05-01'),
		(9, 'Войцеховиц ЕА', '2002-01-01'),
		(2, 'Криштопчик АА', '2002-07-01')

INSERT into SESSIA(SUBJ, IDST, PDATE, NOTE)
Values ('бд', 1, '2021-03-04', 10),
		('кгиг', 2, '2021-03-05', 9),
		('бд', 2, '2021-03-07', 6),
		('ооп', 4, '2021-03-08', 7)


 select SESSIA.SUBJ[ДИСЦИПЛИНА], STUDENT.NAME[Имя_студента],SESSIA.NOTE[Оценка]
 from SESSIA inner join STUDENT
 on SESSIA.IDST = STUDENT.IDST
 where SESSIA.NOTE between 7 and 9

-- select SESSIA.NOTE[Оценка],
--        count(*)  [Количество оценок]
--from SESSIA
--where SESSIA.NOTE between 7 and 10

INSERT into SESSIA(SUBJ, IDST, PDATE, NOTE)
Values ('бд', 3, '2021-03-04', 7)

INSERT into SESSIA(SUBJ, IDST, PDATE, NOTE)
Values ('игиг', 3, '2021-03-04', 8)

SELECT *
FROM (SELECT CASE
		WHEN NOTE=7 then 'семь'
		WHEN NOTE=8 then 'восемь'
		WHEN NOTE=9 then 'девять'
		END [Оценки], 
		Count(*) [Количество]
		FROM SESSIA GROUP BY CASE
			WHEN NOTE=7 then 'семь'
			WHEN NOTE=8 then 'восемь'
			WHEN NOTE=9 then 'девять'
	  END) AS T
		ORDER BY CASE [оценки] 
		WHEN 'девять' THEN 2
		WHEN 'восемь' THEN 3
		WHEN 'семь' THEN 4
		END