use data;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(50) NOT NULL,
    City VARCHAR(50),
    Email VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    OrderDate DATE NOT NULL,
    Amount DECIMAL(10, 2),
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

drop table orders;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(50) NOT NULL,
    Price DECIMAL(10, 2),
    OrderID INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
INSERT INTO Customers (CustomerName, City, Email) VALUES
('Aarav Deshmukh', 'Pune', 'aarav.deshmukh@example.com'),
('Prisha Patil', 'Mumbai', 'prisha.patil@example.com'),
('Omkar Jadhav', 'Nashik', 'omkar.jadhav@example.com'),
('Saanvi Shinde', 'Nagpur', 'saanvi.shinde@example.com'),
('Vihaan Kulkarni', 'Solapur', 'vihaan.kulkarni@example.com'),
('Anaya Pawar', 'Aurangabad', 'anaya.pawar@example.com'),
('Ishaan Chavan', 'Satara', 'ishaan.chavan@example.com'),
('Riya More', 'Kolhapur', 'riya.more@example.com'),
('Atharv Gokhale', 'Thane', 'atharv.gokhale@example.com'),
('Aanya Gaikwad', 'Sangli', 'aanya.gaikwad@example.com'),
('Kabir Phadke', 'Amravati', 'kabir.phadke@example.com'),
('Myra Bhosale', 'Ratnagiri', 'myra.bhosale@example.com'),
('Aditya Khot', 'Beed', 'aditya.khot@example.com'),
('Sara Lokhande', 'Latur', 'sara.lokhande@example.com'),
('Rudra Sawant', 'Palghar', 'rudra.sawant@example.com'),
('Aarohi Kadam', 'Sindhudurg', 'aarohi.kadam@example.com'),
('Manav Waghmare', 'Osmanabad', 'manav.waghmare@example.com'),
('Avni Raut', 'Parbhani', 'avni.raut@example.com'),
('Yug Inamdar', 'Dhule', 'yug.inamdar@example.com'),
('Kiara Suryawanshi', 'Wardha', 'kiara.suryawanshi@example.com');

INSERT INTO Orders (OrderDate, Amount, CustomerID) VALUES
('2025-08-01', 25000.00, 1),
('2025-08-03', 15000.00, 1),
('2025-08-04', 18000.00, 2),
('2025-08-05', 20000.00, 3),
('2025-08-06', 8000.00, 4),
('2025-08-07', 12000.00, 5),
('2025-08-08', 7500.00, 6),
('2025-08-09', 16500.00, 7),
('2025-08-10', 9000.00, 8),
('2025-08-11', 14000.00, 9),
('2025-08-12', 30000.00, 10),
('2025-08-13', 11000.00, 11),
('2025-08-14', 9500.00, 12),
('2025-08-15', 26000.00, 13),
('2025-08-16', 17500.00, 14),
('2025-08-17', 10500.00, 15),
('2025-08-18', 9800.00, 16),
('2025-08-19', 13400.00, 17),
('2025-08-20', 14400.00, 18),
('2025-08-21', 21000.00, 19),
('2025-08-22', 24000.00, 20),
('2025-08-23', 15500.00, 2),
('2025-08-24', 17800.00, 3),
('2025-08-25', 12500.00, 4),
('2025-08-26', 19500.00, 5);

INSERT INTO Products (ProductName, Price, OrderID) VALUES
('Laptop Dell', 25000.00, 1),
('Mouse Logitech', 1500.00, 1),
('Keyboard HP', 2000.00, 2),
('Smartphone Samsung', 15000.00, 3),
('Tablet Lenovo', 18000.00, 4),
('Smartwatch Amazfit', 8000.00, 5),
('Printer Canon', 12000.00, 6),
('Router TP-Link', 7500.00, 7),
('Camera Nikon', 16500.00, 8),
('Headphones Sony', 9000.00, 9),
('TV LG', 14000.00, 10),
('Refrigerator Samsung', 30000.00, 11),
('Washing Machine Whirlpool', 11000.00, 12),
('Microwave IFB', 9500.00, 13),
('AC Voltas', 26000.00, 14),
('Cooler Symphony', 17500.00, 15),
('Fan Crompton', 10500.00, 16),
('Mixer Philips', 9800.00, 17),
('Iron Bajaj', 13400.00, 18),
('Water Purifier Kent', 14400.00, 19),
('Dishwasher Bosch', 21000.00, 20),
('Laptop HP', 24000.00, 21),
('Smartphone OnePlus', 15500.00, 22),
('Tablet Apple iPad', 17800.00, 23),
('Earbuds Boat', 12500.00, 24),
('Monitor Dell', 19500.00, 25);

SELECT * FROM customers;
SELECT * FROM Orders;
SELECT * FROM Products;

SELECT c.CustomerName, o.OrderDate, o.Amount 
FROM customers c INNER JOIN Orders o 
ON c.CustomerID = o.CustomerID;

SELECT p.ProductName, p.Price, c.CustomerName
FROM Products p 
INNER JOIN Orders o  ON p.OrderID=o.OrderID
INNER JOIN Customers c ON o.CustomerID=c.CustomerID;

SELECT c.CustomerName, o.OrderID, o.Amount
FROM Customers c 
LEFT JOIN Orders o 
ON c.CustomerID=o.CustomerID;

SELECT o.OrderID, o.OrderDate, c.CustomerName
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;

SELECT c.CustomerName, o.OrderID, o.Amount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
UNION
SELECT c.CustomerName, o.OrderID, o.Amount
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;

SELECT * FROM Customers;
SELECT * FROM Orders;

SELECT c.CustomerName,c.Email, o.OrderID,o.Amount,Count(o.OrderID)
FROM Customers c
INNER JOIN Orders o 
ON c.CustomerID = o.CustomerID
GROUP BY o.OrderID
HAVING o.OrderID>=1;

SELECT c.CustomerName,  SUM(o.Amount) AS TOTAL_AMOUNT
FROM Customers c 
INNER JOIN Orders o 
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID;

SELECT * FROM Customers;
SELECT * FROM Orders;
SELECT * FROM Products;

SELECT p.ProductName, p.Price, c.CustomerName, c.City, o.OrderDate
FROM Products p
INNER JOIN Orders o ON p.OrderID=o.OrderID
INNER JOIN Customers c ON o.CustomerID=c.CustomerID;

SELECT c.CustomerName, o.OrderID, o.OrderDate 
FROM Customers c
LEFT JOIN Orders o 
ON c.CustomerID=o.CustomerID;

SELECT p.ProductName, p.Price, o.OrderID
FROM Products p
LEFT JOIN Orders o 
ON p.OrderID=o.OrderID;

SELECT c.CustomerName, SUM(o.Amount) AS TOTAL_AMOUNT
FROM Customers c
LEFT JOIN Orders o 
ON c.CustomerID=o.CustomerID
GROUP BY c.CustomerID;

SELECT o.OrderID, o.OrderDate, o.Amount, c.CustomerName, c.City, c.Email
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;

SELECT o.OrderID, p.ProductName, p.Price
FROM Orders o
LEFT JOIN Products p ON o.OrderID = p.OrderID
UNION
SELECT o.OrderID, p.ProductName, p.Price
FROM Orders o
RIGHT JOIN Products p ON o.OrderID = p.OrderID;

SELECT c.CustomerName, p.ProductName, p.Price, o.OrderDate
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
INNER JOIN Products p ON o.OrderID = p.OrderID;

SELECT c.CustomerName, SUM(o.Amount) AS TotalSpent
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName
ORDER BY TotalSpent DESC
LIMIT 5;

SELECT c.CustomerName, COUNT(p.ProductID) AS ProductsPurchased
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
LEFT JOIN Products p ON o.OrderID = p.OrderID
GROUP BY c.CustomerName;









