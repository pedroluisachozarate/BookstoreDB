INSERT INTO DimShippingMethod (MethodID, MethodName, Cost)
SELECT 
    method_id,
    method_name,
    cost
FROM Bookstore.dbo.shipping_method;