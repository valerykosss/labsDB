---B---
begin transaction
select @@SPID
insert FACULTY values ('���','��������� �������� �����������')
update FACULTY set FACULTY='���'
where FACULTY='���';
-------------------------t1--------------------------
-------------------------t2--------------------------
rollback;

