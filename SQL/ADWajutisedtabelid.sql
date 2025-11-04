SELECT ResellerKey, SUM(SalesAmount) AS TotalSales
FROM FactResellerSales
GROUP BY ResellerKey;