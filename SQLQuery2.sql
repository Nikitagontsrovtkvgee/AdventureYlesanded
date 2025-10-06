CREATE FUNCTION dbo.TotalSales(@ProductKey INT)
RETURNS INT
AS
BEGIN
    DECLARE @Total INT;
    SELECT @Total = SUM(SalesAmount)
    FROM FactInternetSales
    WHERE ProductKey = @ProductKey;
    RETURN @Total;
END;