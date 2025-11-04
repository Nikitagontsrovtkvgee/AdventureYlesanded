CREATE TRIGGER trg_FactResellerSales_Insert 
ON FactResellerSales 
AFTER INSERT 
AS 
BEGIN 
PRINT 'Uus müügikirje lisatud'; 
END;

