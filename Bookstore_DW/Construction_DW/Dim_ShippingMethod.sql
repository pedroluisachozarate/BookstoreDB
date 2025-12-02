CREATE TABLE DimShippingMethod (
    ShippingMethodKey INT IDENTITY(1,1) PRIMARY KEY,
    MethodID INT,
    MethodName VARCHAR(100),
    Cost DECIMAL(10,2)
);
GO
