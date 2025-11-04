SELECT TOP 5 ProductKey, SUM(SalesAmount) AS TotalSales
FROM FactResellerSales
GROUP BY ProductKey
ORDER BY TotalSales DESC;