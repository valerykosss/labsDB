---------------------��������� ������----------------------
--����������� � ������ ������ ������, ������� ������������� ����� �����
--���������� ������ ������
DECLARE DiciplinePulpitCurs CURSOR LOCAL                            
	             for SELECT SUBJECT, PULPIT FROM SUBJECT;
DECLARE @subj char(20), @pulpit char(20);      
	OPEN DiciplinePulpitCurs;	  
	fetch  DiciplinePulpitCurs into @subj, @pulpit; 	
      print '1. '+@subj+@pulpit;      	
	fetch  DiciplinePulpitCurs into @subj, @pulpit; 	
      print '2. '+@subj+@pulpit;     


-------------------------���������� ������-----------------
--������ ����� ���� ��������, ������ � ����������� � ������ �������.
--������� ������������� ������ ����� ���������� ��������� DEALLOCATE
DECLARE FacultyPulpitFaculty CURSOR GLOBAL                            
	             for SELECT FACULTY, PULPIT FROM PULPIT;
DECLARE @faculty char(20), @pulp char(20);      
	OPEN FacultyPulpitFaculty;	  
	fetch  FacultyPulpitFaculty into @faculty, @pulp; 	
      print '1. '+@faculty+@pulp;
	  go
	  DECLARE @faculty char(20), @pulp char(20);	      	
	fetch  FacultyPulpitFaculty into @faculty, @pulp; 	
      print '2. '+@faculty+@pulp;
	  close FacultyPulpitFaculty;

	  deallocate  FacultyPulpitFaculty;
	  go   
