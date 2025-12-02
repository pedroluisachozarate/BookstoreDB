INSERT INTO FactSales (
    DateKey, CustomerKey, BookKey, ShippingMethodKey,
    Quantity, UnitPrice, Total
)
SELECT
    CONVERT(INT, FORMAT(co.order_date, 'yyyyMMdd')) AS DateKey,
    dc.CustomerKey,
    db.BookKey,
    dsm.ShippingMethodKey,
    1 AS Quantity,
    ol.price AS UnitPrice,
    ol.price * 1 AS Total
FROM Bookstore.dbo.cust_order co
INNER JOIN Bookstore.dbo.order_line ol 
    ON co.order_id = ol.order_id
LEFT JOIN DimCustomer dc 
    ON dc.CustomerID = co.customer_id
LEFT JOIN DimBook db 
    ON db.BookID = ol.book_id
LEFT JOIN DimShippingMethod dsm 
    ON dsm.MethodID = co.shipping_method_id
LEFT JOIN DimDate dd 
    ON dd.DateKey = CONVERT(INT, FORMAT(co.order_date, 'yyyyMMdd'));