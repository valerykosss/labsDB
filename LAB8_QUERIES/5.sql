USE UNIVER_lab4;
DECLARE @auditorium_types_count int=(SELECT COUNT(*) FROM AUDITORIUM_TYPE);
IF (SELECT COUNT(*) FROM AUDITORIUM_TYPE) > 4
BEGIN
PRINT '���������� ����� ��������� ������ 4';
PRINT '����������='+ cast(@auditorium_types_count as varchar(10));
end;
ELSE
BEGIN
PRINT '���������� ����� ��������� ������ 4';
PRINT '����������='+ cast(@auditorium_types_count as varchar(10));
end;
