USE Koss_lab3_STORAGE
SELECT TOP 1 (SELECT AVG(Количество_ячеек) from  СДЕЛКИ
				WHERE Наименование_товара LIKE 'Sorti') [Sorti],
			 (SELECT AVG(Количество_ячеек) from СДЕЛКИ
				WHERE Наименование_товара LIKE 'Persil')[Persil]
FROM СДЕЛКИ

