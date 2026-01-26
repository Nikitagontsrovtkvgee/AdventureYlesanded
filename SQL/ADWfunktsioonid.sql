-- Leiame TOP 5 toodet suurima müügisummaga
SELECT TOP 5 ProductKey, SUM(SalesAmount) AS TotalSales
FROM FactResellerSales
GROUP BY ProductKey
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

-- Arvutame müügi kindlate toodete jaoks
SELECT ProductKey,
       SUM(SalesAmount) AS TotalSales 
FROM FactResellerSales 
WHERE ProductKey IN (761, 762, 763) 
GROUP BY ProductKey;

-- Kuvame tooted, mille kogumüük on suurem kui 1000
SELECT ProductKey,
       SUM(SalesAmount) AS TotalSales 
FROM FactResellerSales 
GROUP BY ProductKey 
HAVING SUM(SalesAmount) > 1000;

-- Arvutan müügi toodetele, mille müük on suurem kui 500
SELECT ProductKey,
       SUM(SalesAmount) AS TotalSales 
FROM FactResellerSales 
WHERE SalesAmount > 500 
GROUP BY ProductKey;

-- Arvutame müügi toodetele vahemikus 200 kuni 800
SELECT ProductKey,
       SUM(SalesAmount) AS TotalSales 
FROM FactResellerSales 
WHERE SalesAmount BETWEEN 200 AND 800 
GROUP BY ProductKey;

-- Loendame müükide arvu kindlate toodete puhul
SELECT ProductKey,
       COUNT(*) AS SalesCount 
FROM FactResellerSales 
WHERE ProductKey IN (761, 762) 
GROUP BY ProductKey;

-- Kuvame toodete müügisummad kasvavas järjekorras
SELECT ProductKey,
       SUM(SalesAmount) AS TotalSales 
FROM FactResellerSales 
GROUP BY ProductKey 
ORDER BY TotalSales ASC;

-- Kuvame tooted, millel on rohkem kui 10 müüki
SELECT ProductKey,
       SUM(SalesAmount) AS TotalSales 
FROM FactResellerSales 
GROUP BY ProductKey 
HAVING COUNT(*) > 10;
