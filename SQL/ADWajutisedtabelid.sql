SELECT ResellerKey, SUM(SalesAmount) AS TotalSales
FROM FactResellerSales
GROUP BY ResellerKey;

SELECT TOP 5 ProductKey, SUM(SalesAmount) AS TotalSales
FROM FactResellerSales
GROUP BY ProductKey
ORDER BY TotalSales DESC;
