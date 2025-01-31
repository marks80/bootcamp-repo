# SQL Database for Fruits, Vegetables, and Customer Purchases

## Overview
This repository contains SQL scripts for creating and managing a simple **fruits and vegetables sales system**. The database tracks available produce, customer details, and purchase transactions.

## Project Structure
The repository includes the following SQL scripts:

1. **create-tables.sql** – Creates tables for **fruits, vegetables, customers, and purchases**.
2. **insert-into-tables.sql** – Inserts sample data into the tables.
3. **Create a simple stored procedure to log a message.sql** – Implements a stored procedure for logging messages.
4. **Select customer names and purchased fruit names, ordered by customer name.sql** – Retrieves customer purchases (joins `Customers` and `Fruits`).
5. **Select customer names and purchased vegetable names, ordered by customer name.sql** – Retrieves vegetable purchases (joins `Customers` and `Vegetables`).
6. **Get customers who purchased more than 3kg of any fruit.sql** – Identifies customers with large fruit purchases.
7. **List all fruits and their prices per kilogram, ordered by price descending.sql** – Lists fruits with price details.
8. **Show total revenue from fruits and vegetables, grouped by product type.sql** – Calculates total revenue.

## How to Use
1. **Set up the database** by running `create-tables.sql`.
2. **Insert sample data** using `insert-into-tables.sql`.
3. **Execute queries** from the provided SQL files to retrieve insights.
4. **Use the stored procedure** to log messages for debugging.

## Sample Query
To check customer purchases of fruits using a **JOIN**:
```sql
SELECT c.FullName, f.Name AS FruitName, p.QuantityKg
FROM Customers c
JOIN Purchases p ON c.CustomerID = p.CustomerID
JOIN Fruits f ON p.ProductID = f.FruitID
WHERE p.ProductType = 'Fruit'
ORDER BY c.FullName;
```

To check customer purchases of vegetables using a **JOIN**:
```sql
SELECT c.FullName, v.Name AS VegetableName, p.QuantityKg
FROM Customers c
JOIN Purchases p ON c.CustomerID = p.CustomerID
JOIN Vegetables v ON p.ProductID = v.VegetableID
WHERE p.ProductType = 'Vegetable'
ORDER BY c.FullName;
```

## Database Compatibility
This setup is designed for **Snowflake**, but it can be adapted for other SQL-based systems.

---

### 🚀 Happy Querying!

