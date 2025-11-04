CREATE TRIGGER trg_FactResellerSales_Insert 
ON FactResellerSales 
AFTER INSERT 
AS 
BEGIN 
PRINT 'Uus müügikirje lisatud'; 
END;

CREATE TRIGGER trg_FactResellerSales_Update 
ON FactResellerSales 
AFTER 
UPDATE 
AS 
BEGIN PRINT 'Müügiandmed uuendatud'; 
END;