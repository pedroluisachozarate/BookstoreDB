USE BookstoreDW;
GO

-------------------------------------------------------
-- DimCustomer
-------------------------------------------------------
CREATE TABLE DimCustomer (
    CustomerKey INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(200),
    Country VARCHAR(100)
);
GO

-------------------------------------------------------
-- DimBook
-------------------------------------------------------
CREATE TABLE DimBook (
    BookKey INT IDENTITY(1,1) PRIMARY KEY,
    BookID INT,
    Title VARCHAR(300),
    Author VARCHAR(200),
    Language VARCHAR(50),
    Publisher VARCHAR(100)
);
GO

-------------------------------------------------------
-- DimDate
-------------------------------------------------------
CREATE TABLE DimDate (
    DateKey INT PRIMARY KEY,
    FullDate DATE,
    Year INT,
    Month INT,
    MonthName VARCHAR(20),
    Day INT,
    DayOfWeek INT,
    DayName VARCHAR(20)
);
GO

-------------------------------------------------------
-- DimShippingMethod
-------------------------------------------------------
CREATE TABLE DimShippingMethod (
    ShippingMethodKey INT IDENTITY(1,1) PRIMARY KEY,
    MethodID INT,
    MethodName VARCHAR(100),
    Cost DECIMAL(10,2)
);
GO
