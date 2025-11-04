CREATE TRIGGER trg_InsertFactResellerSales
ON FactResellerSales
AFTER INSERT
AS
BEGIN
    INSERT INTO SalesLog (ResellerKey, ProductKey, SalesAmount, InsertDate)
    SELECT i.ResellerKey, i.ProductKey, i.SalesAmount, GETDATE()
    FROM inserted i;
END;
GO