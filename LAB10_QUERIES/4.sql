DECLARE @rowNumber int, @note int;  
DECLARE NotesCurs cursor local dynamic SCROLL                               
  for SELECT row_number() over (order by NOTE) N, NOTE FROM PROGRESS
OPEN NotesCurs;
FETCH NotesCurs into  @rowNumber,@note;
print 'следующа€ строка: ' + cast(@rowNumber as varchar(3))+' оценка в строке: '+rtrim(@note); 
         
FETCH  LAST from NotesCurs into  @rowNumber,@note;     
print 'последн€€ строка: ' + cast(@rowNumber as varchar(3)) +' оценка в строке: '+rtrim(@note); 
 
FETCH  PRIOR from NotesCurs into  @rowNumber,@note;     
print 'предыдуща€ строка от текущей: ' + cast(@rowNumber as varchar(3))+' оценка в строке: '+rtrim(@note); 

FETCH  ABSOLUTE 3 from  NotesCurs into  @rowNumber,@note;     
print 'треть€ строка от начала: ' + cast(@rowNumber as varchar(3))+' оценка в строке: '+rtrim(@note); 
 
FETCH  ABSOLUTE -3 from  NotesCurs into  @rowNumber,@note;
print 'треть€ строка от конца: ' + cast(@rowNumber as varchar(3))+' оценка в строке: '+rtrim(@note); 
 
FETCH  RELATIVE  2 from  NotesCurs into  @rowNumber,@note;     
print 'втора€ строка вперед от текущей: ' + cast(@rowNumber as varchar(3))+' оценка в строке: '+rtrim(@note); 
 
FETCH  RELATIVE  -2 from  NotesCurs into  @rowNumber,@note;     
print 'втора€ строка назад от текущей: ' + cast(@rowNumber as varchar(3))+' оценка в строке: '+rtrim(@note); 
CLOSE NotesCurs;
