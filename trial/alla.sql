--use master
--create database KR

use KR

--create table FACULTET
--(
--FACULTY int primary key,
--Nam_F char(20) not null
--)

--create table KAFED
--(
--KODK int primary key,
--Name_KAF char(30) not null,
--FACULTY int foreign key references FACULTET(FACULTY)
--)

--insert into FACULTET
--Values	(1,'IT'),
--		(2,'HTIT'),
--		(3,'TOV'),
--		(4,'PT')

--insert into KAFED
--Values(01,'KAF_OF_WD',1),
--(02,'KAF_OF_HIM',2),
--(03,'KAF_OF_TOV',3),
--(04,'KAF_OF_PT',4)

--select FACULTET.Nam_F,KAFED.Name_KAF
--from FACULTET inner join KAFED
--on FACULTET.FACULTY = KAFED.FACULTY
--group by FACULTET.Nam_F,KAFED.Name_KAF
--order by KAFED.Name_KAF

--select FACULTET.Nam_F
--from FACULTET 
--where not exists (select * from KAFED 
--where FACULTET.FACULTY = KAFED.FACULTY)

--select FACULTET.Nam_F,KAFED.Name_KAF
--from FACULTET inner join KAFED
--on FACULTET.FACULTY = KAFED.FACULTY
--where Name_KAF IN( select Name_KAF from KAFED where ( Name_KAF LIKE '%технолог'))

--create table GROUP1
--(
-- IDGR int  identity(1,1) primary key,
-- FACLT char(10) default '***',
-- PROF int not null,
-- YEARP int check(YEARP >2007)
--)

--create table STUD
--(
--  IDST int primary key,
--  IDGROUP int identity(1,1) foreign key references  GROUP1(IDGR),
--  NAME char(30),
--  BDAY int
--)

create table PRORG
(
SUBJ char(20),
IDST int foreign key references  STUD(IDST),
PDATE date,
NOTE int
)

insert into PRORG
values ('ООП', 0001,'06.01.2022',8),
('КГИГ', 0002,'06.05.2022',6),
('ТЦ', 0003,'06.06.2022',5),
('ОЗИ', 0004,'09.06.2022',4)

insert into GROUP1
values 
('ФИТ', 10257, 2020),
('ТОВ', 1127, 2020),
('ХТИТ', 10267, 2021),
('ФИТ', 10227, 2021)

insert into STUD
values (0001,'Потапчик Алла Александровна',2002),
 (0002,'Косс Валерия Александровна',2001),
 (0003,'Иванов Иван Степанович',2002),
 (0004,'Петров Сергей Иванович',2000)


 select*,
 case
 when(GROUP1.YEARP - STUD.BDAY =  18) then '1'
  when(GROUP1.YEARP - STUD.BDAY = 19 ) then '2'
    when(GROUP1.YEARP - STUD.BDAY = 21 ) then '3'
	    when(GROUP1.YEARP - STUD.BDAY = 23 ) then '4'
		end[Курс]
 from GROUP1 inner join STUD
 on GROUP1.IDGR = STUD.IDGROUP
 order by STUD.NAME
 

 select *
 from GROUP1 inner join STUD
 on GROUP1.IDGR = STUD.IDGROUP
 where( STUD.BDAY between 2001 and 2003)
 order by  STUD.BDAY 

select STUD.NAME,GROUP1.PROF,PRORG.SUBJ,PRORG.NOTE
from STUD inner join GROUP1
on STUD.IDGROUP = GROUP1.IDGR
inner join PRORG
on PRORG.IDST = STUD.IDST
where GROUP1.FACLT IN (select GROUP1.FACLT from GROUP1 where GROUP1.FACLT like 'ФИТ' and NOTE between 4 and 6  )
UNION
select STUD.NAME,GROUP1.PROF,PRORG.SUBJ,PRORG.NOTE
from STUD inner join GROUP1
on STUD.IDGROUP = GROUP1.IDGR
inner join PRORG
on PRORG.IDST = STUD.IDST
where GROUP1.FACLT IN (select GROUP1.FACLT from GROUP1 where GROUP1.FACLT like 'ТОВ' and NOTE between 4 and 6  )
