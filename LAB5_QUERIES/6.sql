USE UNIVER_lab4
SELECT TOP 1 (SELECT AVG(NOTE) from PROGRESS
				WHERE SUBJECT LIKE '����')[����],
			 (SELECT AVG(NOTE) from PROGRESS
				WHERE SUBJECT LIKE '��')[��],
			 (SELECT AVG(NOTE) from PROGRESS
				WHERE SUBJECT LIKE '����')[����]
FROM PROGRESS

