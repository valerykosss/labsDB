use UNIVER_lab4;
DECLARE @overall_capacity int=(select cast(sum(AUDITORIUM.AUDITORIUM_CAPACITY) as int) from AUDITORIUM), 
		@overall_count int,
		@average_capacity float,
		@average_less_capacity float,
		@percentage float;
IF @overall_capacity>200
begin
SELECT @overall_count=(select cast(count(*) as int) from AUDITORIUM),
		@average_capacity=(select cast(avg(AUDITORIUM.AUDITORIUM_CAPACITY) as int) from AUDITORIUM);
SET @average_less_capacity=(select cast(count(*) as int) from AUDITORIUM where AUDITORIUM.AUDITORIUM_CAPACITY<@average_capacity);
SET @percentage=@average_less_capacity/@average_capacity *100;
Select @overall_capacity 'обща€ вместимость аудиторий', @average_capacity 'средн€€ вместимость аудиторий',
		@overall_count 'общее количество аудиторий', @average_less_capacity 'кол-во аудиторий с вместимость меньше средней',
		@percentage 'процент таких аудиторий'
end