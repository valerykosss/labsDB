use STORAGE
CREATE TABLE ТОВАР
(
	Наименование_товара nvarchar(50) primary key,
	Цена real,
	Количество int,
	Описание nvarchar(50)
);
CREATE TABLE ПОКУПАТЕЛИ
(
	Покупатель_места nvarchar(50) primary key,
	Телефон nvarchar(50),
	Адрес nvarchar(50)
);
CREATE TABLE СДЕЛКИ
(
	Номер_сделки int primary key,
	Дата_сделки date,
	Место_хранения nvarchar(10),
	Количество_ячеек int,
	Наименование_товара nvarchar(50) foreign key references ТОВАР(Наименование_товара),
	Покупатель_места nvarchar(50) foreign key references ПОКУПАТЕЛИ(Покупатель_места)
);