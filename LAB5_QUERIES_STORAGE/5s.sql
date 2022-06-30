USE Koss_lab3_STORAGE
SELECT СДЕЛКИ.Номер_сделки
FROM СДЕЛКИ
WHERE NOT EXISTS (SELECT* FROM ПОКУПАТЕЛИ
					WHERE ПОКУПАТЕЛИ.Покупатель_места=СДЕЛКИ.Покупатель_места)