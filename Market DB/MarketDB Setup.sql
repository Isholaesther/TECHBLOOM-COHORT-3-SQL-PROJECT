---CREATE DATABASE MarketDB;
---GO

USE MarketDB;
GO
-- Produce Table
CREATE TABLE Produce (
    ProduceID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    Stock INT NOT NULL DEFAULT 0 CHECK (Stock >= 0)
);

-- Buyers Table
CREATE TABLE Buyers (
    BuyerID INT PRIMARY KEY IDENTITY(1,1),
    BuyerName VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(20) UNIQUE NOT NULL
);

-- Sales Table
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY IDENTITY(1,1),
    BuyerID INT NOT NULL FOREIGN KEY REFERENCES Buyers(BuyerID),
    ProduceID INT NOT NULL FOREIGN KEY REFERENCES Produce(ProduceID),
    SaleDate DATE NOT NULL DEFAULT CAST(GETDATE() AS DATE),
    Quantity INT NOT NULL CHECK (Quantity > 0)
);
-- Insert Produce
INSERT INTO Produce (Name, Category, UnitPrice, Stock) VALUES
('Tomatoes', 'Vegetable', 150.00, 50),
('Yams', 'Root', 800.00, 30),
('Plantain', 'Fruit', 500.00, 40),
('Onions', 'Vegetable', 200.00, 25),
('Pepper', 'Vegetable', 120.00, 100),
('Banana', 'Fruit', 400.00, 20);

-- Insert Buyers
INSERT INTO Buyers (BuyerName, PhoneNumber) VALUES
('Chioma Okafor', '08011111111'),
('Tunde Balogun', '08022222222'),
('Grace John', '08033333333'),
('Ibrahim Musa', '08044444444'),
('Esther Ishola', '08055555555');

-- Insert Sales (15+ entries)
INSERT INTO Sales (BuyerID, ProduceID, SaleDate, Quantity) VALUES
(1, 1, '2025-08-01', 10),
(1, 2, '2025-08-02', 2),
(2, 3, '2025-08-03', 5),
(3, 1, '2025-08-04', 8),
(4, 4, '2025-08-05', 3),
(5, 5, '2025-08-05', 15),
(2, 6, '2025-08-06', 4),
(3, 2, '2025-08-07', 1),
(4, 3, '2025-08-08', 6),
(5, 1, '2025-08-08', 12),
(1, 5, '2025-08-09', 7),
(2, 4, '2025-08-09', 2),
(3, 6, '2025-08-10', 3),
(4, 1, '2025-08-11', 9),
(5, 2, '2025-08-11', 4);
