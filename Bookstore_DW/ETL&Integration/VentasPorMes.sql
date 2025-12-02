SELECT 
    dd.Year,
    dd.Month,
    dd.MonthName,
    SUM(fs.Total) AS Ventas
FROM FactSales fs
INNER JOIN DimDate dd ON fs.DateKey = dd.DateKey
GROUP BY dd.Year, dd.Month, dd.MonthName
ORDER BY dd.Year, dd.Month;