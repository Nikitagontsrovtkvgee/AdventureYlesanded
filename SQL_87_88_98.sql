-- �lesanne 87: ainult FactInternetSales n�ide
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

-- �lesanne 88: EXCEPT vs NOT IN
-- EXCEPT n�ide
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

-- NOT IN n�ide
SELECT CustomerAlternateKey
FROM DimCustomer c
WHERE CustomerKey NOT IN (
    SELECT CustomerKey FROM FactInternetSales
);
GO

-- �lesanne 98: WHERE vs HAVING
-- WHERE: filtreerime read enne grupeerimist
SELECT ProductKey, SUM(SalesAmount) AS TotalSales
FROM FactInternetSales
WHERE SalesAmount > 100
GROUP BY ProductKey;
GO

-- HAVING: filtreerime alles p�rast grupeerimist
SELECT ProductKey, SUM(SalesAmount) AS TotalSales
FROM FactInternetSales
GROUP BY ProductKey
HAVING SUM(SalesAmount) > 100;
GO