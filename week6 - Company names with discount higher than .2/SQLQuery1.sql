use "NORTHWND";

SELECT TableD.CompanyName
FROM (SELECT DISTINCT Customers.CompanyName FROM Customers 
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
WHERE [Order Details].Discount > .2) as TableD
 ORDER BY TableD.CompanyName ASC;