--create database two;
use two;
CREATE table GROUPS
(
IDGR int primary key identity,
FACLT nvarchar(30) default 'ФИТ' ,
PROF nvarchar(30),
YEARP int check (YEARP>=2019 and YEARP<2022)
);
CREATE table STUD
(
IDST int primary key identity,
IDGROUP int foreign key references GROUPS(IDGR),
NAME nvarchar(40) not null,
BDAY date
);
insert into GROUPS (PROF, YEARP)
values ('ДЭиВИ', 2019),
('ПОИБМС', 2020),
('ИСИТ', 2019),
('ДЭиВИ', 2021)

insert into STUD(IDGROUP, NAME, BDAY)
values (1, 'Иванов Н.А.','02-10-2002'),
(2, 'Петров А.А.','18-06-2003'),
(3, 'Смирнов К.С.','12-11-2002'),
(2, 'Иванова С.Ф.','28-04-2003')

select GROUPS.FACLT[Факультет], GROUPS.IDGR[Группа], STUD.NAME[Имя Студента], GROUPS.PROF[Код специальности], GROUPS.YEARP[Дата поступления],
case 
when (GROUPS.YEARP like '2019') then '3'
when (GROUPS.YEARP like '2020') then '2'
when (GROUPS.YEARP like '2021') then '3'
end [Курс]
from GROUPS inner join STUD
on GROUPS.IDGR = STUD.IDGROUP
order by STUD.NAME

SELECT GROUPS.FACLT[Факультет], GROUPS.PROF[Код специальности], GROUPS.IDGR[Группа], STUD.NAME[Имя Студента], STUD.BDAY[Дата рождения],
case when STUD.BDAY between '2001' and '2003' then '2001-2002'
when STUD.BDAY between '2003' and '2005'then '2003-2004'
end [Период времени]
from GROUPS inner join STUD
on GROUPS.IDGR = STUD.IDGROUP