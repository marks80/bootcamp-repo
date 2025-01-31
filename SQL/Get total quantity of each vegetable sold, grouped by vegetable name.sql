-- Get total quantity of each vegetable sold, grouped by vegetable name

SELECT v.Name AS VegetableName, SUM(p.QuantityKg) AS TotalQuantitySold
FROM Purchases p
JOIN Vegetables v ON p.ProductID = v.VegetableID
WHERE p.ProductType = 'Vegetable'
GROUP BY v.Name
ORDER BY TotalQuantitySold DESC;