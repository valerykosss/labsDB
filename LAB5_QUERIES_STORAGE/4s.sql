use Koss_lab3_STORAGE
SELECT  Наименование_товара, Количество_ячеек
FROM СДЕЛКИ a
where Количество_ячеек=(select top(1) Количество_ячеек 
								from СДЕЛКИ aa
								where aa.Наименование_товара=a.Наименование_товара 
								order by Количество_ячеек desc)