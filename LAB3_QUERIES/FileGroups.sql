use master;
CREATE database Koss_lab3 on primary
( name = N'Koss_lab3_mdf', filename =  N'E:\БД_лаба3\Koss_lab3_mdf.mdf',
  size = 10240Kb, maxsize=UNLIMITED, filegrowth = 1024Kb),
( name = N'Koss_lab3_ndf', filename =  N'E:\БД_лаба3\Koss_lab3_ndf.ndf',
  size = 10240Kb, maxsize=1Gb, filegrowth = 25%),
  filegroup FG1
( name = N'Koss_lab3_fg1_1', filename =  N'E:\БД_лаба3\Koss_lab3_fgq-1.ndf',
  size = 10240Kb, maxsize=1Gb, filegrowth = 25%),
( name = N'Koss_lab3_fg1_2', filename =  N'E:\БД_лаба3\Koss_lab3_fgq-2.ndf',
  size = 10240Kb, maxsize=1Gb, filegrowth = 25%)
	log on
( name = N'Koss_lab3_log', filename =  N'E:\БД_лаба3\Koss_lab3_log.ldf',
  size = 10240Kb, maxsize=2048Gb, filegrowth = 10%)