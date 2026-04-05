CREATE OR REPLACE TABLE `sql-ecommerce-analysis-uk.ecommerce_data.cleaned_sales` AS
SELECT 
    InvoiceNo,
    StockCode,
    Description,
    CAST(Quantity AS INT64) AS Quantity,
    CAST(InvoiceDate AS DATETIME) AS InvoiceDate, 
    CAST(UnitPrice AS FLOAT64) AS UnitPrice,
    CAST(CustomerID AS STRING) AS CustomerID, 
    Country,
    (Quantity * UnitPrice) AS line_total 
FROM 
    `sql-ecommerce-analysis-uk.ecommerce_data.raw_sales`
WHERE 
    -- REGLAS DE NEGOCIO PARA LIMPIEZA:
    CustomerID IS NOT NULL        -- Eliminamos ventas sin cliente identificado
    AND Quantity > 0              -- Solo ventas reales (positivas)
    AND UnitPrice > 0             -- Eliminamos productos con precio 0 o error
    AND InvoiceNo NOT LIKE 'C%';  -- Filtramos devoluciones (empiezan con 'C')

