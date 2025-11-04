SELECT TOP 5 ProductKey, SUM(SalesAmount) AS TotalSales
FROM FactResellerSales
GROUP BY ProductKey
ORDER BY TotalSales DESC;

SELECT AVG(SalesAmount) AS AvgSales,
MIN(SalesAmount) AS MinSales,
MAX(SalesAmount) AS MaxSales FROM FactResellerSales;

SELECT ProductKey,
COUNT(*) AS SalesCount FROM FactResellerSales GROUP BY ProductKey;

