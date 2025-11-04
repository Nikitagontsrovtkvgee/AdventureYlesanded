CREATE TRIGGER trg_InsertFactResellerSales
ON FactResellerSales
AFTER INSERT
AS
BEGIN
    INSERT INTO SalesLog (ResellerKey, ProductKey, SalesAmount, InsertDate)
    SELECT i.ResellerKey, i.ProductKey, i.SalesAmount, GETDATE()
    FROM inserted i;
END;

CREATE TRIGGER trg_UpdateCustomerEmail
ON DimCustomer
AFTER UPDATE
AS
BEGIN
    INSERT INTO CustomerEmailLog (CustomerKey, OldEmail, NewEmail, ChangeDate)
    SELECT d.CustomerKey, d.EmailAddress, i.EmailAddress, GETDATE()
    FROM inserted i
    JOIN deleted d ON i.CustomerKey = d.CustomerKey
    WHERE i.EmailAddress <> d.EmailAddress;
END;

CREATE TRIGGER trg_DeleteFactResellerSales
ON FactResellerSales
AFTER DELETE
AS
BEGIN
    INSERT INTO FactResellerSalesArchive (ResellerKey, ProductKey, SalesAmount, DeletedDate)
    SELECT d.ResellerKey, d.ProductKey, d.SalesAmount, GETDATE()
    FROM deleted d;
END;