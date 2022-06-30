USE master;
CREATE database FakultetKafed;

CREATE TABLE FACULTET
(
	FACULTY nvarchar(10) primary key,
	Name_F nvarchar(50) not null
);

CREATE TABLE KAFED
(
	KODK nvarchar(50) primary key,
	Name_KAF nvarchar(100) default 'исит',
	FACULTY nvarchar(10) foreign key references FACULTET(FACULTY)
);

INSERT into FACULTET(FACULTY, Name_F)
Values ('10-10', 'фит'),
		('9-10', 'хтит'),
		('8-10', 'иэф'),
		('7-10', 'лесхоз');

INSERT into KAFED(KODK, Name_KAF, FACULTY)
Values ('1', 'исит', '10-10'),
		('2', 'компютерный дизайн и технология', '10-10'),
		('3', 'химия органическая', '9-10'),
		('4', 'химия неорганическая', '9-10'),
		('5', 'химия обычная', '9-10'),
		('6', 'экономики и управления на предприятиях', '8-10'),
		('7', 'организации производства и экономики недвижимости', '8-10'),
		('8', 'менеджмента, технологий бизнеса и устойчивого развития', '8-10'),
		('10', 'экономической теории и маркетинга', '8-10'),
		('11', 'лесопил', '7-10'),
		('12', 'лесодело', '7-10');

select FACULTET.Name_F, KAFED.Name_KAF
from FACULTET inner join KAFED
on FACULTET.FACULTY=KAFED.FACULTY
group by Name_F, Name_KAF
order by Name_KAF asc

INSERT into FACULTET(FACULTY, Name_F)
Values ('6-10', 'тов');

select Name_F from FACULTET
where not exists (select * from KAFED
					where KAFED.FACULTY=FACULTET.FACULTY)

select FACULTET.Name_F, KAFED.Name_KAF
from FACULTET inner join KAFED
on FACULTET.FACULTY=KAFED.FACULTY and Name_KAF like '%технолог%'
group by Name_F, Name_KAF
order by Name_KAF asc