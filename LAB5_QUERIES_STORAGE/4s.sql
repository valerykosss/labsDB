use Koss_lab3_STORAGE
SELECT  ������������_������, ����������_�����
FROM ������ a
where ����������_�����=(select top(1) ����������_����� 
								from ������ aa
								where aa.������������_������=a.������������_������ 
								order by ����������_����� desc)