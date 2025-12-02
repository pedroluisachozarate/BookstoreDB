-------------------------------------------------------
-- Ventas por Mes
-------------------------------------------------------
SELECT 
    dd.Year,
    dd.Month,
    dd.MonthName,
    SUM(fs.Total) AS Ventas
FROM FactSales fs
INNER JOIN DimDate dd ON fs.DateKey = dd.DateKey
GROUP BY dd.Year, dd.Month, dd.MonthName
ORDER BY dd.Year, dd.Month;


-------------------------------------------------------
-- Top 10 libros más vendidos
-------------------------------------------------------
SELECT 
    db.Title,
    COUNT(*) AS CantidadVentas,
    SUM(fs.Total) AS TotalIngresos
FROM FactSales fs
INNER JOIN DimBook db ON fs.BookKey = db.BookKey
GROUP BY db.Title
ORDER BY CantidadVentas DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;


-------------------------------------------------------
-- Ventas por cliente
-------------------------------------------------------
SELECT 
    dc.FirstName + ' ' + dc.LastName AS Cliente,
    SUM(fs.Total) AS TotalGastado
FROM FactSales fs
INNER JOIN DimCustomer dc ON fs.CustomerKey = dc.CustomerKey
GROUP BY dc.FirstName, dc.LastName
ORDER BY TotalGastado DESC;


-------------------------------------------------------
-- Ventas por método de envío
-------------------------------------------------------
SELECT 
    dsm.MethodName,
    COUNT(*) AS Cantidad,
    SUM(fs.Total) AS Total
FROM FactSales fs
INNER JOIN DimShippingMethod dsm 
    ON fs.ShippingMethodKey = dsm.ShippingMethodKey
GROUP BY dsm.MethodName
ORDER BY Total DESC;
