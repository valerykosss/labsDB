--—ценарий A представл€ет собой €вную транзакцию с уровнем изолированности READ UNCOMMITED, 
--сценарий B Ц €вную транзакцию с уровнем изолированности READ COMMITED (по умолчанию). 
--—ценарий A должен демонстрировать, что уровень READ UNCOMMITED допускает неподтвержденное, 
--неповтор€ющеес€ и фантомное чтение. 
---A---
set transaction isolation level READ UNCOMMITTED 
begin transaction
-------------------------t1--------------------------
select @@SPID, 'insert FACULTY' 'результат', * from FACULTY --возвращает системный идентификатор процесса, назначенный сервером текущему подключению
where FACULTY='‘«ќ';
select @@SPID, 'update FACULTY' 'результат', * from FACULTY
where FACULTY='ѕ»ћ';
commit;

