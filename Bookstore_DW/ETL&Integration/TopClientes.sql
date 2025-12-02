SELECT 
    dc.FirstName + ' ' + dc.LastName AS Cliente,
    SUM(fs.Total) AS TotalGastado
FROM FactSales fs
INNER JOIN DimCustomer dc ON fs.CustomerKey = dc.CustomerKey
GROUP BY dc.FirstName, dc.LastName
ORDER BY TotalGastado DESC;