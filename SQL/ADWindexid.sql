CREATE NONCLUSTERED INDEX IX_FactInternetSales_Product
ON FactInternetSales(ProductKey);


CREATE UNIQUE INDEX IX_DimCustomer_Email
ON DimCustomer(EmailAddress);


CREATE NONCLUSTERED INDEX IX_FactInternetSales_OrderDate
ON FactInternetSales(OrderDate);