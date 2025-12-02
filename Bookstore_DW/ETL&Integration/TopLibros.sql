SELECT 
    db.Title,
    COUNT(*) AS CantidadVentas,
    SUM(fs.Total) AS TotalIngresos
FROM FactSales fs
INNER JOIN DimBook db ON fs.BookKey = db.BookKey
GROUP BY db.Title
ORDER BY CantidadVentas DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;