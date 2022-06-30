--Сценарии A и В  представляют собой явные транзакции с уровнем изолированности READ COMMITED. 
--Сценарий A должен демонстрировать, что уровень READ COMMITED не допускает неподтвержденного чтения, 
--но при этом возможно неповторяющееся и фантомное чтение. 
---A---
set transaction isolation level READ COMMITTED 
begin transaction 
select count(*) from FACULTY where FACULTY = 'ИТ';
--------------------------t1------------------
 
--------------------------t2-----------------
select  'update FACULTY' 'результат', count(*)
	            from FACULTY  where FACULTY = 'ИТ';
commit; 


---B---	
begin transaction 	  
---------------------------t1--------------------
 update FACULTY set FACULTY = 'ИТ' 
               where FACULTY = 'ФИТ' 
commit; 
---------------------------t2--------------------
