--�������� ��������� PSUBJECT, ������� 2 ���������.
--��������� PSUBJECT ������ ����������� �������������� �����, ��������������� ��������� ���������� @p. 
--����� ����, ��������� ������ ����������� �������� ��������� ��������� @�, ������ ���������� ����� � �������������� ������,
--� ����� ���������� �������� � ����� ������, ������ ������ ���������� ��������� (���������� ����� � ������� SUBJECT). 

alter procedure PSUBJECT 
@p varchar(20)=NULL,
@c int output
as
begin
declare @k int=(select count(*) from SUBJECT);
print '���������: @p = '+@p+', @c = '+cast(@c as varchar(3));
select * from SUBJECT where PULPIT=@p;
set @c=@@ROWCOUNT;--�������� ��������� ���������
return @k;
end;

declare @m int=0, @n int=0;
exec @m=PSUBJECT @p='����', @c=@n output;
print '���-�� ��������� ����� = '+cast(@m as varchar(3));
print '���-�� ���������, ��������������� ������� ���� = ' + cast(@n as varchar(3));

