CREATE TRIGGER trg_InsertFactResellerSales
ON FactResellerSales
AFTER INSERT
AS
BEGIN
    INSERT INTO SalesLog (ResellerKey, ProductKey, SalesAmount, InsertDate)
    SELECT i.ResellerKey, i.ProductKey, i.SalesAmount, GETDATE()
    FROM inserted i;
END;
/*Trigger käivitub pärast kirje lisamist tabelisse FactResellerSales, veerud (ResellerKey, ProductKey, SalesAmount) ja salvestab andmed tabelisse SalesLog koos praeguse kuupäevaga.*/


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
/*Trigger käivitub pärast veeru Email muutmist tabelis DimCustomer ja salvestab vana ja uue e-posti aadressi tabelisse CustomerEmailLog koos muutmise kuupäevaga.*/


CREATE TRIGGER trg_DeleteFactResellerSales
ON FactResellerSales
AFTER DELETE
AS
BEGIN
    INSERT INTO FactResellerSalesArchive (ResellerKey, ProductKey, SalesAmount, DeletedDate)
    SELECT d.ResellerKey, d.ProductKey, d.SalesAmount, GETDATE()
    FROM deleted d;
END;
/*Trigger käivitub pärast kirje eemaldamist tabelist FactResellerSales ja salvestab eemaldatud andmed teise tabelisse.*/
