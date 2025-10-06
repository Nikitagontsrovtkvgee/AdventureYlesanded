-- Ülesanne 87: ainult FactInternetSales näide
SELECT CustomerAlternateKey
FROM DimCustomer c
JOIN FactInternetSales f
    ON c.CustomerKey = f.CustomerKey
EXCEPT
SELECT CustomerAlternateKey
FROM DimCustomer c
WHERE c.CustomerKey NOT IN (
    SELECT CustomerKey FROM FactInternetSales
);
GO

-- Ülesanne 88: EXCEPT vs NOT IN
-- EXCEPT näide
SELECT CustomerAlternateKey
FROM DimCustomer c
JOIN FactInternetSales f
    ON c.CustomerKey = f.CustomerKey
EXCEPT
SELECT CustomerAlternateKey
FROM DimCustomer c
WHERE c.CustomerKey NOT IN (
    SELECT CustomerKey FROM FactInternetSales
);
GO

-- NOT IN näide
SELECT CustomerAlternateKey
FROM DimCustomer c
WHERE CustomerKey NOT IN (
    SELECT CustomerKey FROM FactInternetSales
);
GO

-- Ülesanne 98: WHERE vs HAVING
-- WHERE: filtreerime read enne grupeerimist
SELECT ProductKey, SUM(SalesAmount) AS TotalSales
FROM FactInternetSales
WHERE SalesAmount > 100
GROUP BY ProductKey;
GO

-- HAVING: filtreerime alles pärast grupeerimist
SELECT ProductKey, SUM(SalesAmount) AS TotalSales
FROM FactInternetSales
GROUP BY ProductKey
HAVING SUM(SalesAmount) > 100;
GO