CREATE TABLE DimBook (
    BookKey INT IDENTITY(1,1) PRIMARY KEY,
    BookID INT,
    Title VARCHAR(300),
    Author VARCHAR(200),
    Language VARCHAR(50),
    Publisher VARCHAR(100)
);
GO