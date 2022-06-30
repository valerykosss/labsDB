CREATE table #DOG
(
	HEAD int,
	BODY varchar(200),
	TAIL int
);

SET nocount on; --не выводить сообщения о вводе строк
DECLARE @i int=0;
WHILE @i<10
begin
INSERT #DOG(HEAD, BODY, TAIL)
values(floor(15*rand()), replicate('орган ', 10), floor(16*rand()));
IF (@i%10=0)
	print @i; --вывести сообщение
SET @i=@i+1;
end;

SELECT * from #DOG;

DROP table #DOG;