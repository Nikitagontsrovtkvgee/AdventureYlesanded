SELECT ResellerKey, SUM(SalesAmount) AS TotalSales
FROM FactResellerSales
GROUP BY ResellerKey;

SELECT TOP 5 ProductKey, SUM(SalesAmount) AS TotalSales
FROM FactResellerSales
GROUP BY ProductKey
ORDER BY TotalSales DESC;

SELECT pc.ProductCategoryKey, pc.EnglishProductCategoryName, SUM(f.SalesAmount) AS TotalSales
FROM FactResellerSales f
JOIN DimProduct p ON f.ProductKey = p.ProductKey
JOIN DimProductSubcategory sc ON p.ProductSubcategoryKey = sc.ProductSubcategoryKey
JOIN DimProductCategory pc ON sc.ProductCategoryKey = pc.ProductCategoryKey
GROUP BY pc.ProductCategoryKey, pc.EnglishProductCategoryName
ORDER BY TotalSales DESC;

SELECT AVG(SalesAmount) AS AvgSales,
       MIN(SalesAmount) AS MinSales,
       MAX(SalesAmount) AS MaxSales 
FROM FactResellerSales;

SELECT ProductKey,
       COUNT(*) AS SalesCount 
FROM FactResellerSales 
GROUP BY ProductKey;

SELECT ProductKey,
       SUM(SalesAmount) AS TotalSales 
FROM FactResellerSales 
WHERE ProductKey IN (761, 762, 763) 
GROUP BY ProductKey;