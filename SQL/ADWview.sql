CREATE VIEW vw_TopResellers 
AS SELECT TOP 5 ResellerKey, 
SUM(SalesAmount) AS TotalSales 
FROM FactResellerSales 
GROUP BY ResellerKey 
ORDER BY TotalSales DESC;

SELECT * FROM vw_TopResellers;

CREATE VIEW vw_CategorySales
AS
SELECT pc.ProductCategoryKey, pc.EnglishProductCategoryName,
       SUM(f.SalesAmount) AS TotalSales
FROM FactResellerSales f
JOIN DimProduct p ON f.ProductKey = p.ProductKey
JOIN DimProductSubcategory sc ON p.ProductSubcategoryKey = sc.ProductSubcategoryKey
JOIN DimProductCategory pc ON sc.ProductCategoryKey = pc.ProductCategoryKey
GROUP BY pc.ProductCategoryKey, pc.EnglishProductCategoryName;

SELECT * FROM vw_CategorySales;