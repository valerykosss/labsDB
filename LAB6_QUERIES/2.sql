use UNIVER_lab4
SELECT AUDITORIUM_TYPENAME, 
		min(AUDITORIUM_CAPACITY) [min.capacity],
		max(AUDITORIUM_CAPACITY) [max.capacity],
		count(*) [aud. count],
		sum(AUDITORIUM_CAPACITY) [overall capacity],		
		avg(AUDITORIUM_CAPACITY) [average capacity]
FROM AUDITORIUM INNER JOIN AUDITORIUM_TYPE 
ON AUDITORIUM.AUDITORIUM_TYPE=AUDITORIUM_TYPE.AUDITORIUM_TYPE
GROUP BY AUDITORIUM_TYPENAME