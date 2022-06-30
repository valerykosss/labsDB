DECLARE  @subject char(10), @studentName char(100), @studentGroup int, @note int;
DECLARE HigherNotes cursor local dynamic 
						for SELECT SUBJECT, NAME, GROUPS.IDGROUP, NOTE FROM 
						PROGRESS Inner Join STUDENT
						On PROGRESS.IDSTUDENT=STUDENT.IDSTUDENT
						Inner Join GROUPS
						On STUDENT.IDGROUP=GROUPS.IDGROUP
						WHERE PROGRESS.NOTE<6;--<4 и <5 нет
OPEN HigherNotes;
FETCH HigherNotes into @subject, @studentName, @studentGroup, @note;
DELETE PROGRESS WHERE CURRENT OF HigherNotes;
CLOSE HigherNotes;

SELECT *  FROM PROGRESS;
-----------------------------------------------------------------------
DECLARE  @studentID char(6), @studentNote int;
DECLARE IdStudentHigherNote cursor local dynamic
		for SELECT IDSTUDENT,NOTE 
		FROM PROGRESS FOR UPDATE;
OPEN IdStudentHigherNote;
FETCH IdStudentHigherNote into @studentID, @studentNote;
UPDATE PROGRESS  SET NOTE=NOTE+1
					WHERE IDSTUDENT=1022;--первоначально была 6
CLOSE IdStudentHigherNote;