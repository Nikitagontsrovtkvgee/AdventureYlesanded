-- Trigger käivitub pärast uue kirje lisamist FactResellerSales tabelisse
-- Salvestab lisatud andmed logitabelisse koos kuupäevaga
CREATE TRIGGER trg_InsertFactResellerSales
ON FactResellerSales
AFTER INSERT
AS
BEGIN
    INSERT INTO SalesLog (ResellerKey, ProductKey, SalesAmount, InsertDate)
    SELECT i.ResellerKey, i.ProductKey, i.SalesAmount, GETDATE()
    FROM inserted i;
END;

-- Trigger käivitub pärast kliendi e-posti muutmist
-- Salvestab vana ja uue e-posti aadressi logisse
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

-- Trigger käivitub pärast kirje kustutamist FactResellerSales tabelist
-- Salvestab kustutatud andmed arhiivi
CREATE TRIGGER trg_DeleteFactResellerSales
ON FactResellerSales
AFTER DELETE
AS
BEGIN
    INSERT INTO FactResellerSalesArchive 
        (ResellerKey, ProductKey, SalesAmount, DeletedDate)
    SELECT d.ResellerKey, d.ProductKey, d.SalesAmount, GETDATE()
    FROM deleted d;
END;
