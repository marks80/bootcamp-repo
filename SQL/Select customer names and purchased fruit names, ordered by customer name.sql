
SELECT c.FullName, f.Name AS FruitName, p.QuantityKg 
FROM Customers c
JOIN Purchases p ON c.CustomerID = p.CustomerID
JOIN Fruits f ON p.ProductID = f.FruitID
WHERE p.ProductType = 'Fruit'
ORDER BY c.FullName;