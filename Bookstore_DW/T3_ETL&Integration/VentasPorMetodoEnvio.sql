SELECT 
    dsm.MethodName,
    COUNT(*) AS Cantidad,
    SUM(fs.Total) AS Total
FROM FactSales fs
INNER JOIN DimShippingMethod dsm 
    ON fs.ShippingMethodKey = dsm.ShippingMethodKey
GROUP BY dsm.MethodName
ORDER BY Total DESC;
