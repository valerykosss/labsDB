DECLARE @groupID int, @namee nvarchar(60)
DECLARE CurrentCurs cursor local dynamic
	for SELECT IDGROUP, NAME 
				FROM STUDENT FOR UPDATE;
OPEN CurrentCurs;
FETCH CurrentCurs into @groupID, @namee;
DELETE STUDENT WHERE CURRENT OF CurrentCurs;--��������� ������ ������ ������ � ������� STUDENT

FETCH CurrentCurs into @groupID, @namee;
UPDATE STUDENT set IDGROUP=IDGROUP+1 where CURRENT OF CurrentCurs;-- � ������������� �� ������� ����� ������ � ��������� ������.
CLOSE CurrentCurs;