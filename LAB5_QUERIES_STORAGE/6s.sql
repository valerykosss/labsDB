USE Koss_lab3_STORAGE
SELECT TOP 1 (SELECT AVG(����������_�����) from  ������
				WHERE ������������_������ LIKE 'Sorti') [Sorti],
			 (SELECT AVG(����������_�����) from ������
				WHERE ������������_������ LIKE 'Persil')[Persil]
FROM ������

