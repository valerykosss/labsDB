use Koss_lab3_STORAGE
--��������������� OUTER JOIN: �������������� ����� �� ������� �� �������, � ������� ������� �������� �������.
SELECT * 
FROM ����� FULL OUTER JOIN  ������
ON �����.������������_������ = ������.������������_������
WHERE �����_������ IS NULL

SELECT * 
FROM ������ FULL OUTER JOIN �����
ON �����.������������_������ = ������.������������_������
WHERE �����_������ IS NULL

--1 �������� ������ ����� (� �������� FULL OUTER JOIN) � �� �������� ������ ������
SELECT * 
FROM ����� FULL OUTER JOIN  ������
ON �����.������������_������ = ������.������������_������
WHERE �����_������ IS NULL
ORDER BY ����

--2 �������� ������ ������ ������� � �� ���������� ������ �����
SELECT �����.����������, �����.������������_������, �����.��������, �����.����
FROM ������ RIGHT OUTER JOIN  �����
ON �����.������������_������ = ������.������������_������
WHERE �����_������ IS NULL
ORDER BY ����
    

--3 �������� ������ ������ ������� � �����
SELECT �����.����������, �����.������������_������, �����.��������, �����.����, ������.����_������, ������.����������_�����, ������.�����_��������, ������.�����_������, ������.����������_����� 
FROM ������ FULL OUTER JOIN  �����
ON �����.������������_������ = ������.������������_������
WHERE �����_������ IS NOT NULL
ORDER BY ����