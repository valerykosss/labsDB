--������� 4
--�������� identity
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
Values (1, '���� ��', '2001-04-01'),
		(1, '�������� ��', '2002-05-01'),
		(9, '���������� ��', '2002-01-01'),
		(2, '���������� ��', '2002-07-01')

INSERT into SESSIA(SUBJ, IDST, PDATE, NOTE)
Values ('��', 1, '2021-03-04', 10),
		('����', 2, '2021-03-05', 9),
		('��', 2, '2021-03-07', 6),
		('���', 4, '2021-03-08', 7)


 select SESSIA.SUBJ[����������], STUDENT.NAME[���_��������],SESSIA.NOTE[������]
 from SESSIA inner join STUDENT
 on SESSIA.IDST = STUDENT.IDST
 where SESSIA.NOTE between 7 and 9

-- select SESSIA.NOTE[������],
--        count(*)  [���������� ������]
--from SESSIA
--where SESSIA.NOTE between 7 and 10

INSERT into SESSIA(SUBJ, IDST, PDATE, NOTE)
Values ('��', 3, '2021-03-04', 7)

INSERT into SESSIA(SUBJ, IDST, PDATE, NOTE)
Values ('����', 3, '2021-03-04', 8)

SELECT *
FROM (SELECT CASE
		WHEN NOTE=7 then '����'
		WHEN NOTE=8 then '������'
		WHEN NOTE=9 then '������'
		END [������], 
		Count(*) [����������]
		FROM SESSIA GROUP BY CASE
			WHEN NOTE=7 then '����'
			WHEN NOTE=8 then '������'
			WHEN NOTE=9 then '������'
	  END) AS T
		ORDER BY CASE [������] 
		WHEN '������' THEN 2
		WHEN '������' THEN 3
		WHEN '����' THEN 4
		END