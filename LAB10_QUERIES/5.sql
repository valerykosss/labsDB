DECLARE @groupID int, @namee nvarchar(60)
DECLARE CurrentCurs cursor local dynamic
	for SELECT IDGROUP, NAME 
				FROM STUDENT FOR UPDATE;
OPEN CurrentCurs;
FETCH CurrentCurs into @groupID, @namee;
DELETE STUDENT WHERE CURRENT OF CurrentCurs;--удаляется строка первая строка в таблице STUDENT

FETCH CurrentCurs into @groupID, @namee;
UPDATE STUDENT set IDGROUP=IDGROUP+1 where CURRENT OF CurrentCurs;-- и увеличивается на единицу номер группы в следующей строке.
CLOSE CurrentCurs;