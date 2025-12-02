INSERT INTO DimCustomer (CustomerID, FirstName, LastName, Email, Country)
SELECT 
    customer_id,
    first_name,
    last_name,
    email,
    country
FROM Bookstore.dbo.customer;