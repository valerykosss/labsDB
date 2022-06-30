--–азработать сценарий, который демонстрирует, что проверка ограничени€ 
--целостности выполн€етс€ до срабатывани€ AFTER-триггера.
alter table TEACHER 
add constraint GENDER check(GENDER in ('м','ж'));
go
update TEACHER set GENDER='муж' where GENDER='м';

