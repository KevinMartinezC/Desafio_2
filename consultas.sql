USE AdventureWorksDW2022;
GO
CREATE OR ALTER VIEW dbo.vw_DMD_VentasUSD AS
SELECT f.OrderDateKey, f.ProductKey, f.SalesTerritoryKey,
       f.SalesOrderNumber, f.SalesOrderLineNumber,
       f.SalesAmount, f.OrderQuantity
FROM dbo.FactInternetSales AS f
JOIN dbo.DimCurrency AS m ON m.CurrencyKey = f.CurrencyKey
WHERE m.CurrencyAlternateKey = N'USD';
GO
CREATE OR ALTER VIEW dbo.vw_DMD_Producto AS
SELECT p.ProductKey, p.SpanishProductName AS Producto,
       COALESCE(c.SpanishProductCategoryName,
                N'Sin categoría') AS Categoria
FROM dbo.DimProduct AS p
LEFT JOIN dbo.DimProductSubcategory AS s
  ON s.ProductSubcategoryKey = p.ProductSubcategoryKey
LEFT JOIN dbo.DimProductCategory AS c
  ON c.ProductCategoryKey = s.ProductCategoryKey;
GO

SELECT COUNT_BIG(*) AS Lineas,
       SUM(OrderQuantity) AS Unidades,
       SUM(SalesAmount) AS VentasUSD,
       MIN(OrderDateKey) AS PrimeraFecha,
       MAX(OrderDateKey) AS UltimaFecha
FROM dbo.vw_DMD_VentasUSD;

SELECT d.CalendarYear AS Anio,
       SUM(v.SalesAmount) AS VentasUSD,
       SUM(v.OrderQuantity) AS Unidades
FROM dbo.vw_DMD_VentasUSD AS v
JOIN dbo.DimDate AS d ON d.DateKey = v.OrderDateKey
GROUP BY d.CalendarYear
ORDER BY Anio;

SELECT p.Categoria,
       SUM(v.SalesAmount) AS VentasUSD,
       SUM(v.OrderQuantity) AS Unidades
FROM dbo.vw_DMD_VentasUSD AS v
JOIN dbo.vw_DMD_Producto AS p ON p.ProductKey = v.ProductKey
GROUP BY p.Categoria
ORDER BY VentasUSD DESC, p.Categoria;

SELECT t.SalesTerritoryCountry AS Pais,
       SUM(v.SalesAmount) AS VentasUSD,
       SUM(v.OrderQuantity) AS Unidades
FROM dbo.vw_DMD_VentasUSD AS v
JOIN dbo.DimSalesTerritory AS t
  ON t.SalesTerritoryKey = v.SalesTerritoryKey
GROUP BY t.SalesTerritoryCountry
ORDER BY VentasUSD DESC, Pais;
