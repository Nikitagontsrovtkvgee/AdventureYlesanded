CREATE TABLE #TempSalesSummary
(
    CustomerKey int,
    TotalSales decimal(18,2),
    AvgSales decimal(18,2)
);

INSERT INTO #TempSalesSummary(CustomerKey, TotalSales, AvgSales)
SELECT CustomerKey, SUM(SalesAmount), AVG(SalesAmount)
FROM FactInternetSales
GROUP BY CustomerKey;

SELECT * FROM #TempSalesSummary;