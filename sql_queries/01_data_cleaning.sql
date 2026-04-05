CREATE OR REPLACE TABLE `sql-ecommerce-analysis-uk.ecommerce_data.cleaned_sales` AS
SELECT 
    InvoiceNo,
    StockCode,
    Description,
    -- Aseguramos que la cantidad sea un número entero
    CAST(Quantity AS INT64) AS Quantity,
    -- Convertimos la fecha a formato DATETIME para análisis temporal
    CAST(InvoiceDate AS DATETIME) AS InvoiceDate, 
    -- El precio unitario debe ser un número decimal (float)
    CAST(UnitPrice AS FLOAT64) AS UnitPrice,
    -- El ID de cliente lo tratamos como STRING para evitar cálculos matemáticos con él
    CAST(CustomerID AS STRING) AS CustomerID, 
    Country,
    -- Creamos la métrica de negocio: Total de la línea de venta
    (Quantity * UnitPrice) AS line_total 
FROM 
    `sql-ecommerce-analysis-uk.ecommerce_data.raw_sales`
WHERE 
    -- REGLAS DE NEGOCIO PARA LIMPIEZA:
    CustomerID IS NOT NULL        -- Eliminamos ventas sin cliente identificado
    AND Quantity > 0              -- Solo ventas reales (positivas)
    AND UnitPrice > 0             -- Eliminamos productos con precio 0 o error
    AND InvoiceNo NOT LIKE 'C%';  -- Filtramos devoluciones (empiezan con 'C')

