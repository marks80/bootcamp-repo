--Show total revenue from fruits and vegetables, grouped by product type

SELECT p.ProductType, SUM(p.TotalPrice) AS TotalRevenue
FROM Purchases p
GROUP BY p.ProductType
ORDER BY TotalRevenue DESC;