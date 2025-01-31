--Get customers who purchased more than 3kg of any fruit
SELECT c.FullName, f.Name AS FruitName, p.QuantityKg
FROM Customers c
JOIN Purchases p ON c.CustomerID = p.CustomerID
JOIN Fruits f ON p.ProductID = f.FruitID
WHERE p.ProductType = 'Fruit' AND p.QuantityKg > 3
ORDER BY p.QuantityKg DESC;