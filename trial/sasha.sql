--create database two;
use two;
CREATE table GROUPS
(
IDGR int primary key identity,
FACLT nvarchar(30) default '���' ,
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
values ('�����', 2019),
('������', 2020),
('����', 2019),
('�����', 2021)

insert into STUD(IDGROUP, NAME, BDAY)
values (1, '������ �.�.','02-10-2002'),
(2, '������ �.�.','18-06-2003'),
(3, '������� �.�.','12-11-2002'),
(2, '������� �.�.','28-04-2003')

select GROUPS.FACLT[���������], GROUPS.IDGR[������], STUD.NAME[��� ��������], GROUPS.PROF[��� �������������], GROUPS.YEARP[���� �����������],
case 
when (GROUPS.YEARP like '2019') then '3'
when (GROUPS.YEARP like '2020') then '2'
when (GROUPS.YEARP like '2021') then '3'
end [����]
from GROUPS inner join STUD
on GROUPS.IDGR = STUD.IDGROUP
order by STUD.NAME

SELECT GROUPS.FACLT[���������], GROUPS.PROF[��� �������������], GROUPS.IDGR[������], STUD.NAME[��� ��������], STUD.BDAY[���� ��������],
case when STUD.BDAY between '2001' and '2003' then '2001-2002'
when STUD.BDAY between '2003' and '2005'then '2003-2004'
end [������ �������]
from GROUPS inner join STUD
on GROUPS.IDGR = STUD.IDGROUP