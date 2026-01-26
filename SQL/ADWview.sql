-- Loome vaate, mis näitab top 5 edasimüüjat müügi alusel
CREATE VIEW vw_TopResellers 
AS 
SELECT TOP 5 ResellerKey, 
       SUM(SalesAmount) AS TotalSales 
FROM FactResellerSales 
GROUP BY ResellerKey 
ORDER BY TotalSales DESC;

-- Kuvame vaate tulemused
SELECT * FROM vw_TopResellers;

-- Loome vaate, mis näitab müügi summat tootekategooriate kaupa
CREATE VIEW vw_CategorySales
AS
SELECT pc.ProductCategoryKey, 
       pc.EnglishProductCategoryName,
       SUM(f.SalesAmount) AS TotalSales
FROM FactResellerSales f
JOIN DimProduct p ON f.ProductKey = p.ProductKey
JOIN DimProductSubcategory sc ON p.ProductSubcategoryKey = sc.ProductSubcategoryKey
JOIN DimProductCategory pc ON sc.ProductCategoryKey = pc.ProductCategoryKey
GROUP BY pc.ProductCategoryKey, pc.EnglishProductCategoryName;

-- Kuvame vaate tulemused
SELECT * FROM vw_CategorySales;
