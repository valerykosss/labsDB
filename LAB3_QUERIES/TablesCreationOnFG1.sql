use Koss_lab3_STORAGE
CREATE TABLE �����
(
	������������_������ nvarchar(50) primary key,
	���� real,
	���������� int,
	�������� nvarchar(50)
) on FG1;
CREATE TABLE ����������
(
	����������_����� nvarchar(50) primary key,
	������� nvarchar(50),
	����� nvarchar(50)
) on FG1;
CREATE TABLE ������
(
	�����_������ int primary key,
	����_������ date,
	�����_�������� nvarchar(10),
	����������_����� int,
	������������_������ nvarchar(50) foreign key references �����(������������_������),
	����������_����� nvarchar(50) foreign key references ����������(����������_�����)
) on FG1;