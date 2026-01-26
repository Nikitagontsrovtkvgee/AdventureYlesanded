-- Loon indeksi ProductKey veerule, et kiirendada päringuid
CREATE INDEX idx_ProductKey ON FactResellerSales(ProductKey);

-- Loon indeksi ResellerKey veerule paremaks otsinguks
CREATE INDEX idx_ResellerKey ON FactResellerSales(ResellerKey);
