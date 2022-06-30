USE UNIVER_lab4;
SELECT *
FROM (SELECT CASE
		WHEN NOTE between 4 and 5 then '4-5'
		WHEN NOTE between 6 and 7 then '6-7'
		WHEN NOTE between 8 and 9 then '8-9'
		WHEN NOTE=10 then '10'
		END [оценки], 
		Count(*) [количество]
		FROM PROGRESS GROUP BY CASE
			WHEN NOTE between 4 and 5 then '4-5'
			WHEN NOTE between 6 and 7 then '6-7'
			WHEN NOTE between 8 and 9 then '8-9'
			WHEN NOTE=10 then '10'
	  END) AS T
		ORDER BY CASE [оценки] 
		WHEN '10' THEN 1
		WHEN '8-9' THEN 2
		WHEN '6-7' THEN 3
		WHEN '4-5' THEN 4
		END
