--—ценарий A представл€ет собой €вную транзакцию с уровнем изолированности REPEATABLE READ. 
--—ценарий B Ц €вную транзакцию с уровнем изолированности READ COMMITED. 
--—ценарий A должен демонстрировать, что уровень REAPETABLE READ не допускает неподтвержденного чтени€ и неповтор€ющегос€ чтени€, 
--но при этом возможно фантомное чтение. 

---A---
set transaction isolation level REPEATABLE READ
begin transaction
select NOTE from PROGRESS where SUBJECT='—”Ѕƒ';
-------------------------t1--------------------------
-------------------------t2--------------------------
select case
when NOTE=6 then 'insert PROGRESS' else ''
end 'результат', NOTE from PROGRESS where SUBJECT='—”Ѕƒ';
commit;
---B---
begin transaction
-------------------------t1--------------------------
insert PROGRESS values ('—”Ѕƒ', 1030, '2021-12-30', 8);
commit;
-------------------------t2--------------------------


delete PROGRESS where IDSTUDENT=1030