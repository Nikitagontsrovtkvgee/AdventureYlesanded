-- Arvutame iga edasimüüja (Reseller) kogumüügi
SELECT ResellerKey, SUM(SalesAmount) AS TotalSales
FROM FactResellerSales
GROUP BY ResellerKey;

-- Leiame TOP 5 toodet suurima müügisummaga
SELECT TOP 5 ProductKey, SUM(SalesAmount) AS TotalSales
FROM FactResellerSales
GROUP BY ProductKey
ORDER BY TotalSales DESC;

-- Arvutame müügi summad tootekategooriate kaupa
SELECT pc.ProductCategoryKey, pc.EnglishProductCategoryName, 
       SUM(f.SalesAmount) AS TotalSales
FROM FactResellerSales f
JOIN DimProduct p ON f.ProductKey = p.ProductKey
JOIN DimProductSubcategory sc ON p.ProductSubcategoryKey = sc.ProductSubcategoryKey
JOIN DimProductCategory pc ON sc.ProductCategoryKey = pc.ProductCategoryKey
GROUP BY pc.ProductCategoryKey, pc.EnglishProductCategoryName
ORDER BY TotalSales DESC;

-- Arvutame müügi keskmise, miinimumi ja maksimumi
SELECT AVG(SalesAmount) AS AvgSales,
       MIN(SalesAmount) AS MinSales,
       MAX(SalesAmount) AS MaxSales 
FROM FactResellerSales;

-- Loendame, mitu korda iga toodet on müüdud
SELECT ProductKey,
       COUNT(*) AS SalesCount 
FROM FactResellerSales 
GROUP BY ProductKey;

-- Arvutame müügisumma kindlate toodete jaoks
SELECT ProductKey,
       SUM(SalesAmount) AS TotalSales 
FROM FactResellerSales 
WHERE ProductKey IN (761, 762, 763) 
GROUP BY ProductKey;

-- Näitame ainult neid tooteid, mille kogumüük on üle 1000
SELECT ProductKey,
       SUM(SalesAmount) AS TotalSales 
FROM FactResellerSales 
GROUP BY ProductKey 
HAVING SUM(SalesAmount) > 1000;

-- Arvutame müügi toodetele, mille üksik müük on üle 500
SELECT ProductKey,
       SUM(SalesAmount) AS TotalSales 
FROM FactResellerSales 
WHERE SalesAmount > 500 
GROUP BY ProductKey;

-- Arvutame müügi toodetele, mille müük on vahemikus 200 kuni 800
SELECT ProductKey,
       SUM(SalesAmount) AS TotalSales 
FROM FactResellerSales 
WHERE SalesAmount BETWEEN 200 AND 800 
GROUP BY ProductKey;

-- Loendame müükide arvu kindlate toodete jaoks
SELECT ProductKey,
       COUNT(*) AS SalesCount 
FROM FactResellerSales 
WHERE ProductKey IN (761, 762) 
GROUP BY ProductKey;

-- Kuvame toodete kogumüügi kasvavas järjekorras
SELECT ProductKey,
       SUM(SalesAmount) AS TotalSales 
FROM FactResellerSales 
GROUP BY ProductKey 
ORDER BY TotalSales ASC;

-- Näitame ainult neid tooteid, millel on rohkem kui 10 müüki
SELECT ProductKey,
       SUM(SalesAmount) AS TotalSales 
FROM FactResellerSales 
GROUP BY ProductKey 
HAVING COUNT(*) > 10;
