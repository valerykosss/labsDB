--����������� �������� ��������� ��� ���������� � ������ PSUBJECT.
--� ����� ������ ��������� ������ ���������� ���������� �����, ���������� � �������������� �����.
use UNIVER_lab4

CREATE PROCEDURE PSUBJECT --�������� ���������
as                    --�������� � ��
begin
declare @k int=(select count(*) from SUBJECT);
select * from SUBJECT;
return @k;            --��� ��������
end;


declare @n int=0;
EXEC @n=PSUBJECT;     --����� ���������
print '���-�� ���������='+cast(@n as varchar(3));

--drop procedure PSUBJECT;
--������� ��������� ���������, ����� declare � ��������� � ��������� ����� EXEC