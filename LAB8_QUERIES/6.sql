SELECT CASE
when NOTE between 0 and 3 then 'В топку'
when NOTE between 4 and 7 then 'Пойдет'
else 'Годно'
end Оценки, count(*) [Количество оценок]
from PROGRESS
GROUP BY CASE
	when NOTE between 0 and 3 then 'В топку'
	when NOTE between 4 and 7 then 'Пойдет'
	else 'Годно'
end