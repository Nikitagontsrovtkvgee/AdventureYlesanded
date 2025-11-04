CREATE VIEW vw_TopResellers 
AS SELECT TOP 5 ResellerKey, 
SUM(SalesAmount) AS TotalSales 
FROM FactResellerSales 
GROUP BY ResellerKey 
ORDER BY TotalSales DESC;

