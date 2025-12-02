-------------------------------------------------------
-- Cargar DimCustomer
-------------------------------------------------------
INSERT INTO DimCustomer (CustomerID, FirstName, LastName, Email, Country)
SELECT 
    customer_id,
    first_name,
    last_name,
    email,
    country
FROM Bookstore.dbo.customer;
-------------------------------------------------------
-- Cargar DimBook
-------------------------------------------------------
INSERT INTO DimBook (BookID, Title, Author, Language, Publisher)
SELECT
    b.book_id,
    b.title,
    a.author_name,
    bl.language_name,
    p.publisher_name
FROM Bookstore.dbo.book b
LEFT JOIN Bookstore.dbo.book_author ba ON b.book_id = ba.book_id
LEFT JOIN Bookstore.dbo.author a ON ba.author_id = a.author_id
LEFT JOIN Bookstore.dbo.book_language bl ON b.book_id = bl.book_id
LEFT JOIN Bookstore.dbo.publisher p ON b.publisher_id = p.publisher_id;


-------------------------------------------------------
-- Cargar DimShippingMethod
-------------------------------------------------------
INSERT INTO DimShippingMethod (MethodID, MethodName, Cost)
SELECT 
    method_id,
    method_name,
    cost
FROM Bookstore.dbo.shipping_method;


-------------------------------------------------------
-- Cargar DimDate
-------------------------------------------------------
DECLARE @Date DATE = '2020-04-03';
DECLARE @EndDate DATE = '2023-04-02';

WHILE @Date <= @EndDate
BEGIN
    INSERT INTO DimDate (
        DateKey, FullDate, Year, Month, MonthName, Day, DayOfWeek, DayName
    )
    VALUES (
        CONVERT(INT, FORMAT(@Date, 'yyyyMMdd')),
        @Date,
        YEAR(@Date),
        MONTH(@Date),
        DATENAME(MONTH, @Date),
        DAY(@Date),
        DATEPART(WEEKDAY, @Date),
        DATENAME(WEEKDAY, @Date)
    );

    SET @Date = DATEADD(DAY, 1, @Date);
END;
GO


-------------------------------------------------------
-- Cargar FactSales
-------------------------------------------------------
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