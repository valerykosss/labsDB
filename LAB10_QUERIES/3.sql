------------------------СТАТИЧЕСИКИЙ КУРСОР---------------------------
DECLARE @aud_type char(10), @aud_capacity int, @aud_name char(10);  
DECLARE AuditoriumInfoCursor CURSOR LOCAL DYNAMIC                              
		for SELECT AUDITORIUM_TYPE, AUDITORIUM_CAPACITY, AUDITORIUM_NAME 
		FROM AUDITORIUM where AUDITORIUM_TYPE = 'ЛK';				   
open AuditoriumInfoCursor;
print   'Количество строк : '+cast(@@CURSOR_ROWS as varchar(5)); 

UPDATE AUDITORIUM set AUDITORIUM_NAME = '411-4', AUDITORIUM = '411-4' where AUDITORIUM_CAPACITY = 1;
DELETE AUDITORIUM where AUDITORIUM_CAPACITY = 10;
INSERT AUDITORIUM (AUDITORIUM, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY, AUDITORIUM_NAME) 
	           values ('412-4', 'ЛК', 30, '412-4'); 
FETCH  AuditoriumInfoCursor into @aud_type, @aud_capacity, @aud_name;     
while @@fetch_status = 0                                    
   begin 
     print @aud_type + ' '+ @aud_capacity + ' '+ @aud_name;      
     fetch AuditoriumInfoCursor into @aud_type, @aud_capacity, @aud_name; 
   end;          
CLOSE  AuditoriumInfoCursor;

--------------------------------------------------------------------------------
DECLARE @sub char(10), @id char(40), @note char(1);
DECLARE Progress CURSOR LOCAL STATIC
for SELECT SUBJECT, IDSTUDENT, NOTE from PROGRESS
where SUBJECT='КГ';
open Progress;
print 'Количество строк: '+cast(@@CURSOR_ROWS as varchar(5));

UPDATE PROGRESS set NOTE=8 where IDSTUDENT=1019;
DELETE PROGRESS where IDSTUDENT=1022;
INSERT PROGRESS (SUBJECT, IDSTUDENT, PDATE, NOTE) values ('КГ', 1022, '2013-05-06', 5);

FETCH Progress into @sub, @id, @note;
while @@FETCH_STATUS=0
	begin 
		print @sub+''+@id+''+@note;
		fetch Progress into @sub, @id, @note;
	end;
CLOSE Progress;