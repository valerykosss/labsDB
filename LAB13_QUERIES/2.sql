--����������� ��������� ������� � ������ FSUBJECTS, ����������� �������� @p ���� VARCHAR(20),
--�������� �������� ������ ��� ������� (������� SUBJECT.PULPIT). 
--������� ������ ���������� ������ ���� VARCHAR(300) � �������� ��������� � ������. 

go
create FUNCTION FSUBJECTS(@p nvarchar(20)) returns varchar(300)
as begin
declare @tv char(20);
declare @t varchar(300)='����������: ';
declare SubjectPulpitCursor CURSOR LOCAL static
for select SUBJECT from SUBJECT where PULPIT=@p;

open SubjectPulpitCursor;
fetch SubjectPulpitCursor into @tv;
while @@FETCH_STATUS=0
begin
	set @t = @t + ' ' + rtrim(@tv);
	fetch SubjectPulpitCursor into @tv;
end;
return @t;
end;

--drop FUNCTION FSUBJECTS

go
select  PULPIT, dbo.FSUBJECTS(PULPIT) [����������] from SUBJECT

select distinct  PULPIT, dbo.FSUBJECTS(PULPIT)[����������] from SUBJECT