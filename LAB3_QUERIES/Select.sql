SELECT * From ПОКУПАТЕЛИ;
SELECT Покупатель_места, Телефон From ПОКУПАТЕЛИ;
SELECT count(*) From ПОКУПАТЕЛИ; 
SELECT Наименование_товара[Товары с ценой меньше 10 руб.] From ТОВАР WHERE Цена<10; 
SELECT Top(3) Покупатель_места, Телефон From ПОКУПАТЕЛИ;
SELECT DISTINCT Цена FROM ТОВАР;