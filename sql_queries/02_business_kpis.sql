SELECT 
    COUNT(*) AS total_ventas,
    ROUND(SUM(line_total), 2) AS ingresos_totales,
    COUNT(DISTINCT CustomerID) AS total_clientes,
    ROUND(AVG(line_total), 2) AS ticket_promedio
FROM 
    `sql-ecommerce-analysis-uk.ecommerce_data.cleaned_sales`;
