--������� ��������� ��������� ������� � ������ #SUBJECT. 
--�������� ��������� PSUBJECT ����� �������, ����� ��� �� ��������� ��������� ���������.
--�������� ����������� INSERT� EXECUTE � ���������������� ���������� PSUBJECT, 
--�������� ������ � ������� #SUBJECT. 

alter procedure PSUBJECT @p varchar(20)=NULL
as begin
declare @k int=(select count(*) from SUBJECT);
select * from SUBJECT where PULPIT=@p;
end;

CREATE table #TemporaryTableSUBJECT
(
	SUBJECT char(10) primary key,
	SUBJECT_NAME varchar(100),
	PULPIT char(20)
)

INSERT #TemporaryTableSUBJECT exec PSUBJECT @p='����';

select * from #TemporaryTableSUBJECT