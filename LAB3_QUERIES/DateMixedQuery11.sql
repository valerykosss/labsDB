SELECT ������.����_��������, ������.������������
FROM     ������ INNER JOIN
                  ������ ON ������.������������_������ = ������.������������
WHERE  (������.����_�������� > CONVERT(DATETIME, '2022-03-03 00:00:00', 102))
ORDER BY ������.����_��������