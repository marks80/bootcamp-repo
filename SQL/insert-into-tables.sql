INSERT INTO Fruits (Name, PricePerKg, StockKg, CountryOfOrigin, ExpiryDate) VALUES
    ('Apple', 2.50, 100.00, 'Latvia', '2025-02-15'),
    ('Banana', 1.80, 120.00, 'Ecuador', '2025-02-10'),
    ('Orange', 2.20, 80.00, 'Spain', '2025-02-12'),
    ('Strawberry', 4.00, 50.00, 'Poland', '2025-02-18');


INSERT INTO Vegetables (Name, PricePerKg, StockKg, CountryOfOrigin, ExpiryDate) VALUES
    ('Potato', 1.20, 200.00, 'Latvia', '2025-03-01'),
    ('Carrot', 1.50, 150.00, 'Latvia', '2025-02-20'),
    ('Onion', 1.00, 180.00, 'Lithuania', '2025-03-05'),
    ('Tomato', 3.00, 90.00, 'Netherlands', '2025-02-15');

INSERT INTO Customers (FullName, City, PhoneNumber) VALUES
    ('Jānis Bērziņš', 'Rīga', '+371 12345678'),
    ('Līga Kalniņa', 'Jelgava', '+371 87654321'),
    ('Andris Ozoliņš', 'Liepāja', '+371 23456789'),
    ('Marta Vītola', 'Daugavpils', '+371 98765432');

INSERT INTO Purchases (CustomerID, ProductType, ProductID, QuantityKg, TotalPrice, PurchaseDate) VALUES
    (1, 'Fruit', 1, 2.5, 6.25, '2025-01-31'),
    (2, 'Vegetable', 2, 3.0, 4.50, '2025-01-30'),
    (3, 'Fruit', 3, 1.5, 3.30, '2025-01-29'),
    (4, 'Vegetable', 4, 2.0, 6.00, '2025-01-28'),
    (1, 'Vegetable', 1, 4.5, 5.40, '2025-02-01'),
    (2, 'Fruit', 2, 2.0, 3.60, '2025-02-02'),
    (3, 'Vegetable', 3, 3.5, 3.50, '2025-02-03'),
    (4, 'Fruit', 4, 5.0, 20.00, '2025-02-04');