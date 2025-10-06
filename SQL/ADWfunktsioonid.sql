CREATE FUNCTION dbo.SumSales(@ProductKey int)
RETURNS decimal(18,2)
AS
BEGIN
    DECLARE @TotalSales decimal(18,2)
    SELECT @TotalSales = SUM(SalesAmount)
    FROM FactInternetSales
    WHERE ProductKey = @ProductKey
    RETURN @TotalSales
END;
GO


CREATE FUNCTION dbo.AvgSales(@ProductKey int)
RETURNS decimal(18,2)
AS
BEGIN
    DECLARE @AvgSales decimal(18,2)
    SELECT @AvgSales = AVG(SalesAmount)
    FROM FactInternetSales
    WHERE ProductKey = @ProductKey
    RETURN @AvgSales
END;
GO