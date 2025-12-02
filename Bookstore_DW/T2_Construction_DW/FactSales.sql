USE BookstoreDW;
GO

CREATE TABLE FactSales (
    SalesKey INT IDENTITY(1,1) PRIMARY KEY,
    DateKey INT,
    CustomerKey INT,
    BookKey INT,
    ShippingMethodKey INT,
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    Total DECIMAL(10,2),

    FOREIGN KEY (DateKey) REFERENCES DimDate(DateKey),
    FOREIGN KEY (CustomerKey) REFERENCES DimCustomer(CustomerKey),
    FOREIGN KEY (BookKey) REFERENCES DimBook(BookKey),
    FOREIGN KEY (ShippingMethodKey) REFERENCES DimShippingMethod(ShippingMethodKey)
);
GO
