ALTER Table ПОКУПАТЕЛИ ADD Город_покупателя nvarchar(15); 
ALTER Table ПОКУПАТЕЛИ ADD CONSTRAINT Город DEFAULT 'Minsk' FOR Город_покупателя; 
ALTER Table ПОКУПАТЕЛИ DROP CONSTRAINT Город;
ALTER Table ПОКУПАТЕЛИ DROP Column Город_покупателя;