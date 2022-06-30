DECLARE @a char='A',
		@b varchar(5)='ДЭиВИ',
		@c datetime,
		@d time(2),
		@e int,
		@f smallint,
		@g tinyint,
		@h numeric(12,5);
SET @c=getdate();
SELECT @d='15:13:12.123456';
SELECT @e=10, @g=0, @h=123.45678;--@f не определена
SELECT @a a, @b b, @c c, @d d;
PRINT 'e='+ cast(@e as varchar(2));--в messages
PRINT 'f='+cast(@f as varchar(2)); 
PRINT 'g='+cast(@g as varchar(1));
PRINT 'h='+cast(@h as varchar(10));

