DECLARE @subj char(20), @disc char(300)=''
--���������� �������
DECLARE DiciplineListCurs CURSOR 
						  for SELECT SUBJECT FROM SUBJECT WHERE PULPIT='����' ;
--�������� �������
OPEN DiciplineListCurs;

--��������� ���� ������ �� ��������������� ������
--� ���������� ��������� �� ��������� ������.
FETCH DiciplineListCurs INTO @subj;
print '������ ��������� �� ������� ����';
while @@fetch_status=0
	begin 
		set @disc=RTRIM(@subj)+','+@disc;
		FETCH DiciplineListCurs into @subj;
	end;
print @disc;
--�������� �������
CLOSE DiciplineListCurs;