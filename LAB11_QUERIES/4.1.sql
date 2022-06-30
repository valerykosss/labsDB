---B---
begin transaction
select @@SPID
insert FACULTY values ('ФЗО','Факультет заочного образования')
update FACULTY set FACULTY='ПИМ'
where FACULTY='ПиМ';
-------------------------t1--------------------------
-------------------------t2--------------------------
rollback;

