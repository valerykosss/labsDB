DECLARE @rowNumber int, @note int;  
DECLARE NotesCurs cursor local dynamic SCROLL                               
  for SELECT row_number() over (order by NOTE) N, NOTE FROM PROGRESS
OPEN NotesCurs;
FETCH NotesCurs into  @rowNumber,@note;
print '��������� ������: ' + cast(@rowNumber as varchar(3))+' ������ � ������: '+rtrim(@note); 
         
FETCH  LAST from NotesCurs into  @rowNumber,@note;     
print '��������� ������: ' + cast(@rowNumber as varchar(3)) +' ������ � ������: '+rtrim(@note); 
 
FETCH  PRIOR from NotesCurs into  @rowNumber,@note;     
print '���������� ������ �� �������: ' + cast(@rowNumber as varchar(3))+' ������ � ������: '+rtrim(@note); 

FETCH  ABSOLUTE 3 from  NotesCurs into  @rowNumber,@note;     
print '������ ������ �� ������: ' + cast(@rowNumber as varchar(3))+' ������ � ������: '+rtrim(@note); 
 
FETCH  ABSOLUTE -3 from  NotesCurs into  @rowNumber,@note;
print '������ ������ �� �����: ' + cast(@rowNumber as varchar(3))+' ������ � ������: '+rtrim(@note); 
 
FETCH  RELATIVE  2 from  NotesCurs into  @rowNumber,@note;     
print '������ ������ ������ �� �������: ' + cast(@rowNumber as varchar(3))+' ������ � ������: '+rtrim(@note); 
 
FETCH  RELATIVE  -2 from  NotesCurs into  @rowNumber,@note;     
print '������ ������ ����� �� �������: ' + cast(@rowNumber as varchar(3))+' ������ � ������: '+rtrim(@note); 
CLOSE NotesCurs;
