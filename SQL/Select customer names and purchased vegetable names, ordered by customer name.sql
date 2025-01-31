--Select customer names and purchased vegetable names, ordered by customer name

SELECT c.FullName, v.Name AS VegetableName, p.QuantityKg 
FROM Customers c
JOIN Purchases p ON c.CustomerID = p.CustomerID
JOIN Vegetables v ON p.ProductID = v.VegetableID
WHERE p.ProductType = 'Vegetable'
ORDER BY c.FullName;