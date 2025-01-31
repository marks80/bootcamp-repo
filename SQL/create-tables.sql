
USE DATABASE MY_NEW_DB;
USE SCHEMA MY_SCHEMA;


CREATE OR REPLACE TABLE Fruits (
    FruitID INT AUTOINCREMENT PRIMARY KEY,
    Name STRING,
    PricePerKg DECIMAL(5,2),
    StockKg DECIMAL(6,2),
    CountryOfOrigin STRING,
    ExpiryDate DATE
);


CREATE OR REPLACE TABLE Vegetables (
    VegetableID INT AUTOINCREMENT PRIMARY KEY,
    Name STRING,
    PricePerKg DECIMAL(5,2),
    StockKg DECIMAL(6,2),
    CountryOfOrigin STRING,
    ExpiryDate DATE
);


CREATE OR REPLACE TABLE Customers (
    CustomerID INT AUTOINCREMENT PRIMARY KEY,
    FullName STRING,
    City STRING,
    PhoneNumber STRING
);


CREATE OR REPLACE TABLE Purchases (
    PurchaseID INT AUTOINCREMENT PRIMARY KEY,
    CustomerID INT,
    ProductType STRING,
    ProductID INT,
    QuantityKg DECIMAL(5,2),
    TotalPrice DECIMAL(7,2),
    PurchaseDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);