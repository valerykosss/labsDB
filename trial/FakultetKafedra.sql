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
	Name_KAF nvarchar(100) default '����',
	FACULTY nvarchar(10) foreign key references FACULTET(FACULTY)
);

INSERT into FACULTET(FACULTY, Name_F)
Values ('10-10', '���'),
		('9-10', '����'),
		('8-10', '���'),
		('7-10', '������');

INSERT into KAFED(KODK, Name_KAF, FACULTY)
Values ('1', '����', '10-10'),
		('2', '����������� ������ � ����������', '10-10'),
		('3', '����� ������������', '9-10'),
		('4', '����� ��������������', '9-10'),
		('5', '����� �������', '9-10'),
		('6', '��������� � ���������� �� ������������', '8-10'),
		('7', '����������� ������������ � ��������� ������������', '8-10'),
		('8', '�����������, ���������� ������� � ����������� ��������', '8-10'),
		('10', '������������� ������ � ����������', '8-10'),
		('11', '�������', '7-10'),
		('12', '��������', '7-10');

select FACULTET.Name_F, KAFED.Name_KAF
from FACULTET inner join KAFED
on FACULTET.FACULTY=KAFED.FACULTY
group by Name_F, Name_KAF
order by Name_KAF asc

INSERT into FACULTET(FACULTY, Name_F)
Values ('6-10', '���');

select Name_F from FACULTET
where not exists (select * from KAFED
					where KAFED.FACULTY=FACULTET.FACULTY)

select FACULTET.Name_F, KAFED.Name_KAF
from FACULTET inner join KAFED
on FACULTET.FACULTY=KAFED.FACULTY and Name_KAF like '%��������%'
group by Name_F, Name_KAF
order by Name_KAF asc