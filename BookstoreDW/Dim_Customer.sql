CREATE TABLE DimCustomer (
    CustomerKey INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(200),
    Country VARCHAR(100)
);
GO