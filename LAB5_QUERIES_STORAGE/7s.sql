USE Koss_lab3_STORAGE
SELECT * FROM СДЕЛКИ
WHERE Количество_ячеек >= ALL(SELECT Количество_ячеек 
						FROM СДЕЛКИ 
						WHERE Наименование_товара='Sorti')