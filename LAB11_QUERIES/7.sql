--Сценарий A представляет собой явную транзакцию с уровнем изолированности SERIALIZABLE. 
--Сценарий B – явную транзакцию с уровнем изолированности READ COMMITED.
--Сценарий A должен демонстрировать отсутствие фантомного, неподтвержденного и неповторяющегося чтения.
---A---
set transaction isolation level SERIALIZABLE
begin transaction
--delete PROGRESS where SUBJECT='СУБД';
insert PROGRESS values ('СУБД', 1017, '2021-05-05', 10);
select IDSTUDENT from PROGRESS where SUBJECT='СУБД';
-------------------------t1--------------------------
select IDSTUDENT from PROGRESS where SUBJECT='СУБД';
-------------------------t2--------------------------
commit;
---B---
begin transaction
--delete PROGRESS where SUBJECT='СУБД';
insert PROGRESS values ('СУБД', 1017, '2021-05-05', 10);
select IDSTUDENT from PROGRESS where SUBJECT='СУБД';
-------------------------t1--------------------------
commit;
select IDSTUDENT from PROGRESS where SUBJECT='СУБД';
-------------------------t2--------------------------




insert PROGRESS values ('ОАиП', 1005, '2013-10-01', 8);