CREATE OR ALTER VIEW vw_CustomerSales AS
SELECT 
    c.CustomerKey, 
    c.FirstName, 
    c.LastName, 
    SUM(f.SalesAmount) AS TotalSales
FROM DimCustomer c
JOIN FactInternetSales f 
    ON c.CustomerKey = f.CustomerKey
GROUP BY c.CustomerKey, c.FirstName, c.LastName;
GO

CREATE OR ALTER VIEW vw_ProductAvgSales AS
SELECT 
    p.ProductKey, 
    p.EnglishProductName, 
    AVG(f.SalesAmount) AS AvgSales
FROM DimProduct p
JOIN FactInternetSales f 
    ON p.ProductKey = f.ProductKey
GROUP BY p.ProductKey, p.EnglishProductName;
GO