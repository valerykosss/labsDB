--��� ������� FACULTY ������� INSTEAD OF-�������, ����������� �������� ����� � �������. 
go
create trigger INSTEAD_OF 
on FACULTY instead of DELETE
as raiserror(N'�������� ���������', 10, 1);
return;

delete from FACULTY where FACULTY='��';

drop trigger TR_TEACHER_INS, TR_TEACHER_DEL, TR_TEACHER_UPD, TR_TEACHER, TR_TEACHER_DEL1,
TR_TEACHER_DEL2, TR_TEACHER_DEL3, Pulp_Tran;
