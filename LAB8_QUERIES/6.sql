SELECT CASE
when NOTE between 0 and 3 then '� �����'
when NOTE between 4 and 7 then '������'
else '�����'
end ������, count(*) [���������� ������]
from PROGRESS
GROUP BY CASE
	when NOTE between 0 and 3 then '� �����'
	when NOTE between 4 and 7 then '������'
	else '�����'
end