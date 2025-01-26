-- Food Booking Application

-- Create Restaurants Table
CREATE TABLE Restaurants (
    RestaurantID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    City VARCHAR(50) NOT NULL,
    CuisineType VARCHAR(50) NOT NULL,
    Rating DECIMAL(3, 2) CHECK (Rating >= 0 AND Rating <= 5),
    AverageCostForTwo DECIMAL(10, 2)
);

-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Phone VARCHAR(15),
    City VARCHAR(50),
    JoinDate DATE
);

-- Create Orders Table
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    RestaurantID INT,
    OrderDate DATE,
    OrderAmount DECIMAL(10, 2),
    OrderStatus VARCHAR(20),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID)
);

-- Create Reviews Table
CREATE TABLE Reviews (
    ReviewID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    RestaurantID INT,
    Rating DECIMAL(3, 2) CHECK (Rating >= 0 AND Rating <= 5),
    Comment TEXT,
    ReviewDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID)
);

-- Create Payments Table
CREATE TABLE Payments (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    PaymentMethod VARCHAR(20),
    Amount DECIMAL(10, 2),
    PaymentDate DATE,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);


-- DUMMY DATA
-- Insert Data into Restaurants Table
INSERT INTO Restaurants (Name, City, CuisineType, Rating, AverageCostForTwo) VALUES
('Taj Mahal', 'Mumbai', 'Indian', 4.7, 1200),
('Pizza Hut', 'Mumbai', 'Italian', 4.5, 800),
('China Town', 'Delhi', 'Chinese', 4.3, 900),
('Burger King', 'Bangalore', 'American', 4.2, 700),
('Dominos', 'Mumbai', 'Italian', 4.6, 750),
('KFC', 'Delhi', 'American', 4.1, 650),
('Subway', 'Bangalore', 'American', 4.4, 600),
('Mainland China', 'Mumbai', 'Chinese', 4.8, 1500),
('Barbeque Nation', 'Delhi', 'Indian', 4.9, 2000),
('Theobroma', 'Mumbai', 'Desserts', 4.7, 500),
('Cafe Coffee Day', 'Bangalore', 'Cafe', 4.3, 400),
('Bikanervala', 'Delhi', 'Indian', 4.6, 1000),
('Punjabi Tadka', 'Mumbai', 'Indian', 4.5, 900),
('The Great Kabab Factory', 'Delhi', 'Indian', 4.8, 1800),
('Sushi Samurai', 'Bangalore', 'Japanese', 4.7, 1300);

-- Insert Data into Customers Table
INSERT INTO Customers (FirstName, LastName, Phone, City, JoinDate) VALUES
('John', 'Doe', '1234567890', 'Mumbai', '2022-01-15'),
('Jane', 'Smith', '9876543210', 'Delhi', '2022-02-20'),
('Alice', 'Johnson', '5555555555', 'Bangalore', '2022-03-10'),
('Bob', 'Brown', '1111111111', 'Mumbai', '2022-04-05'),
('Charlie', 'Davis', '2222222222', 'Delhi', '2022-05-12'),
('Eva', 'Green', '3333333333', 'Bangalore', '2022-06-18'),
('Frank', 'Wilson', '4444444444', 'Mumbai', '2022-07-22'),
('Grace', 'Harris', '5555555555', 'Delhi', '2022-08-30'),
('Henry', 'Clark', '6666666666', 'Bangalore', '2022-09-05'),
('Ivy', 'Lewis', '7777777777', 'Mumbai', '2022-10-10'),
('Jack', 'Walker', '8888888888', 'Delhi', '2022-11-15'),
('Karen', 'Hall', '9999999999', 'Bangalore', '2022-12-20'),
('Leo', 'Allen', '1010101010', 'Mumbai', '2023-01-25'),
('Mia', 'Young', '1212121212', 'Delhi', '2023-02-28'),
('Nina', 'Scott', '1313131313', 'Bangalore', '2023-03-05');

-- Insert Data into Orders Table
INSERT INTO Orders (CustomerID, RestaurantID, OrderDate, OrderAmount, OrderStatus) VALUES
(1, 1, '2023-01-01', 1200, 'Delivered'),
(2, 2, '2023-01-02', 800, 'Delivered'),
(3, 3, '2023-01-03', 900, 'Cancelled'),
(4, 4, '2023-01-04', 700, 'Delivered'),
(5, 5, '2023-01-05', 750, 'Pending'),
(6, 6, '2023-01-06', 650, 'Delivered'),
(7, 7, '2023-01-07', 600, 'Delivered'),
(8, 8, '2023-01-08', 1500, 'Cancelled'),
(9, 9, '2023-01-09', 2000, 'Delivered'),
(10, 10, '2023-01-10', 500, 'Delivered'),
(11, 11, '2023-01-11', 400, 'Pending'),
(12, 12, '2023-01-12', 1000, 'Delivered'),
(13, 13, '2023-01-13', 900, 'Delivered'),
(14, 14, '2023-01-14', 1800, 'Cancelled'),
(15, 15, '2023-01-15', 1300, 'Delivered');

-- Insert Data into Reviews Table
INSERT INTO Reviews (CustomerID, RestaurantID, Rating, Comment, ReviewDate) VALUES
(1, 1, 4.7, 'Great food!', '2023-01-16'),
(2, 2, 4.5, 'Loved the pizza!', '2023-01-17'),
(3, 3, 4.3, 'Good but expensive.', '2023-01-18'),
(4, 4, 4.2, 'Burgers were amazing!', '2023-01-19'),
(5, 5, 4.6, 'Fast delivery.', '2023-01-20'),
(6, 6, 4.1, 'Chicken was dry.', '2023-01-21'),
(7, 7, 4.4, 'Healthy options.', '2023-01-22'),
(8, 8, 4.8, 'Best Chinese food!', '2023-01-23'),
(9, 9, 4.9, 'Amazing buffet!', '2023-01-24'),
(10, 10, 4.7, 'Desserts were delicious.', '2023-01-25'),
(11, 11, 4.3, 'Coffee was good.', '2023-01-26'),
(12, 12, 4.6, 'Loved the sweets.', '2023-01-27'),
(13, 13, 4.5, 'Great service.', '2023-01-28'),
(14, 14, 4.8, 'Expensive but worth it.', '2023-01-29'),
(15, 15, 4.7, 'Sushi was fresh.', '2023-01-30');

-- Insert Data into Payments Table
INSERT INTO Payments (OrderID, PaymentMethod, Amount, PaymentDate) VALUES
(1, 'Card', 1200, '2023-01-01'),
(2, 'Cash', 800, '2023-01-02'),
(3, 'Wallet', 900, '2023-01-03'),
(4, 'Card', 700, '2023-01-04'),
(5, 'Cash', 750, '2023-01-05'),
(6, 'Wallet', 650, '2023-01-06'),
(7, 'Card', 600, '2023-01-07'),
(8, 'Cash', 1500, '2023-01-08'),
(9, 'Wallet', 2000, '2023-01-09'),
(10, 'Card', 500, '2023-01-10'),
(11, 'Cash', 400, '2023-01-11'),
(12, 'Wallet', 1000, '2023-01-12'),
(13, 'Card', 900, '2023-01-13'),
(14, 'Cash', 1800, '2023-01-14'),
(15, 'Wallet', 1300, '2023-01-15');

-- QUERIES

-- 1. Retrieve the names and locations of restaurants with a rating of 4.5 or higher.
SELECT Name, City
FROM Restaurants
WHERE Rating >= 4.5;

-- 2. Find the total number of orders placed by each customer.
SELECT c.CustomerID, c.FirstName, c.LastName, COUNT(o.OrderID) AS TotalOrders
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName;

-- 3. List all restaurants offering "Italian" cuisine in "Mumbai".
SELECT Name, City
FROM Restaurants
WHERE CuisineType = 'Italian' AND City = 'Mumbai';

-- 4. Calculate the total revenue generated by each restaurant from completed orders.
SELECT r.RestaurantID, r.Name, SUM(o.OrderAmount) AS TotalRevenue
FROM Restaurants r
JOIN Orders o ON r.RestaurantID = o.RestaurantID
WHERE o.OrderStatus = 'Delivered'
GROUP BY r.RestaurantID, r.Name;

-- 5. Retrieve the most recent order placed by each customer.
SELECT c.CustomerID, c.FirstName, c.LastName, MAX(o.OrderDate) AS MostRecentOrderDate
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName;

-- 6. List customers who have not placed any orders yet.
SELECT c.CustomerID, c.FirstName, c.LastName
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;

-- 7. Identify the most reviewed restaurants.
SELECT r.RestaurantID, r.Name, COUNT(rv.ReviewID) AS TotalReviews
FROM Restaurants r
JOIN Reviews rv ON r.RestaurantID = rv.RestaurantID
GROUP BY r.RestaurantID, r.Name
ORDER BY TotalReviews DESC
LIMIT 1;

-- 8. Find the most preferred payment method.
SELECT PaymentMethod, COUNT(PaymentID) AS TotalPayments
FROM Payments
GROUP BY PaymentMethod
ORDER BY TotalPayments DESC
LIMIT 1;

-- 9. List the top 5 restaurants by total revenue.
SELECT r.RestaurantID, r.Name, SUM(o.OrderAmount) AS TotalRevenue
FROM Restaurants r
JOIN Orders o ON r.RestaurantID = o.RestaurantID
WHERE o.OrderStatus = 'Delivered'
GROUP BY r.RestaurantID, r.Name
ORDER BY TotalRevenue DESC
LIMIT 5;

-- 10. Show the details of all cancelled orders along with the customer's and restaurant's names.
SELECT o.OrderID, c.FirstName, c.LastName, r.Name AS RestaurantName, o.OrderDate, o.OrderAmount
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Restaurants r ON o.RestaurantID = r.RestaurantID
WHERE o.OrderStatus = 'Cancelled';
