create view [Препод]
as select TEACHER[Код],
			TEACHER_NAME[Имя преподавателя],
			GENDER[Пол],
			PULPIT[Код кафедры] from TEACHER
