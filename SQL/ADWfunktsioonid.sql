SELECT TOP 5 ProductKey, SUM(SalesAmount) AS TotalSales
FROM FactResellerSales
GROUP BY ProductKey
ORDER BY TotalSales DESC;

SELECT AVG(SalesAmount) AS AvgSales,
MIN(SalesAmount) AS MinSales,
MAX(SalesAmount) AS MaxSales FROM FactResellerSales;

SELECT ProductKey,
COUNT(*) AS SalesCount FROM FactResellerSales GROUP BY ProductKey;

SELECT ProductKey,
SUM(SalesAmount) AS TotalSales FROM FactResellerSales WHERE ProductKey IN (761, 762, 763) GROUP BY ProductKey;

SELECT ProductKey,
SUM(SalesAmount) 
AS TotalSales 
FROM FactResellerSales 
GROUP BY ProductKey HAVING SUM(SalesAmount) > 1000;

SELECT ProductKey,
SUM(SalesAmount) 
AS TotalSales 
FROM FactResellerSales 
WHERE SalesAmount > 500 
GROUP BY ProductKey;

SELECT ProductKey,
SUM(SalesAmount) 
AS TotalSales 
FROM FactResellerSales 
WHERE SalesAmount BETWEEN 200 AND 800 
GROUP BY ProductKey;

SELECT ProductKey,
COUNT(*) AS SalesCount 
FROM FactResellerSales 
WHERE ProductKey IN (761, 762) 
GROUP BY ProductKey;

SELECT ProductKey,
SUM(SalesAmount) AS TotalSales 
FROM FactResellerSales 
GROUP BY ProductKey 
ORDER BY TotalSales ASC;

SELECT ProductKey, SUM(SalesAmount) 
AS TotalSales FROM FactResellerSales 
GROUP BY ProductKey HAVING COUNT(*) > 10;