SELECT 
    d.Year,
    SUM(f.Total) AS VentasTotales
FROM FactSales f
INNER JOIN DimDate d
    ON f.DateKey = d.DateKey
GROUP BY d.Year
ORDER BY d.Year;
