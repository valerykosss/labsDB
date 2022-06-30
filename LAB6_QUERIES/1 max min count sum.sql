use UNIVER_lab4
SELECT min(AUDITORIUM_CAPACITY) [min.capacity],
		max(AUDITORIUM_CAPACITY) [max.capacity],
		count(*) [aud.count],
		sum(AUDITORIUM_CAPACITY) [overall capacity],
		avg(AUDITORIUM_CAPACITY) [average capacity]
FROM AUDITORIUM