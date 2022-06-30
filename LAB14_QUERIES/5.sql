--Разработать сценарий, который демонстрирует, что проверка ограничения 
--целостности выполняется до срабатывания AFTER-триггера.

alter table TEACHER add constraint GENDER check(GENDER in ('м','ж'));
go
update TEACHER set GENDER='трансгендер' where GENDER='ж';

