-- Retail Store Database Schema

-- Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    address TEXT,
    join_date DATE
);

-- Products Table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock_quantity INT
);

-- Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    order_status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- OrderDetails Table
CREATE TABLE OrderDetails (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Payments Table
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    payment_amount DECIMAL(10,2),
    payment_method VARCHAR(20),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);


-- Insert Data into Customers Table
INSERT INTO Customers (customer_id, first_name, last_name, email, phone, address, join_date) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '555-1234', '123 Elm St', '2023-01-15'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '555-5678', '456 Oak St', '2023-03-12'),
(3, 'Alice', 'Brown', 'alice.brown@example.com', '555-8765', '789 Maple Ave', '2022-11-22'),
(4, 'Bob', 'Johnson', 'bob.johnson@example.com', '555-6543', '321 Pine Rd', '2023-02-01'),
(5, 'Emma', 'Wilson', 'emma.wilson@example.com', '555-9876', '234 Cedar Blvd', '2023-04-05'),
(6, 'Liam', 'Davis', 'liam.davis@example.com', '555-4321', '567 Spruce Ln', '2022-12-10'),
(7, 'Sophia', 'Martinez', 'sophia.martinez@example.com', '555-3456', '890 Birch Ct', '2023-05-18'),
(8, 'Mason', 'Taylor', 'mason.taylor@example.com', '555-7654', '123 Ash Dr', '2023-06-10'),
(9, 'Olivia', 'Anderson', 'olivia.anderson@example.com', '555-1111', '456 Redwood St', '2023-01-30'),
(10, 'Ethan', 'Harris', 'ethan.harris@example.com', '555-2222', '789 Dogwood Ln', '2023-03-20'),
(11, 'Ava', 'Lewis', 'ava.lewis@example.com', '555-3333', '321 Poplar Ave', '2022-10-10'),
(12, 'Noah', 'Clark', 'noah.clark@example.com', '555-4444', '123 Fir Dr', '2023-02-18'),
(13, 'Isabella', 'White', 'isabella.white@example.com', '555-5555', '456 Sycamore Blvd', '2023-04-22'),
(14, 'Logan', 'Young', 'logan.young@example.com', '555-6666', '789 Magnolia St', '2023-07-01'),
(15, 'Mia', 'King', 'mia.king@example.com', '555-7777', '321 Willow Ct', '2023-05-30');

-- Insert Data into Products Table
INSERT INTO Products (product_id, product_name, category, price, stock_quantity) VALUES
(1, 'Laptop', 'Electronics', 899.99, 50),
(2, 'Smartphone', 'Electronics', 699.99, 100),
(3, 'Headphones', 'Electronics', 49.99, 200),
(4, 'Office Chair', 'Furniture', 149.99, 30),
(5, 'Desk Lamp', 'Furniture', 39.99, 75),
(6, 'Microwave', 'Appliances', 99.99, 40),
(7, 'Vacuum Cleaner', 'Appliances', 129.99, 25),
(8, 'Blender', 'Appliances', 49.99, 60),
(9, 'Yoga Mat', 'Sports', 24.99, 120),
(10, 'Dumbbells', 'Sports', 79.99, 50),
(11, 'Running Shoes', 'Sports', 59.99, 90),
(12, 'Cookware Set', 'Kitchen', 149.99, 45),
(13, 'Knife Set', 'Kitchen', 89.99, 70),
(14, 'Air Fryer', 'Kitchen', 179.99, 20),
(15, 'Dish Rack', 'Kitchen', 19.99, 80);

-- Insert Data into Orders Table
INSERT INTO Orders (order_id, customer_id, order_date, total_amount, order_status) VALUES
(1, 1, '2023-06-01', 959.98, 'Completed'),
(2, 2, '2023-06-05', 49.99, 'Completed'),
(3, 3, '2023-06-10', 249.98, 'Cancelled'),
(4, 4, '2023-06-15', 39.99, 'Completed'),
(5, 5, '2023-06-20', 699.99, 'Completed'),
(6, 6, '2023-06-25', 179.99, 'Completed'),
(7, 7, '2023-06-30', 99.98, 'Completed'),
(8, 8, '2023-07-01', 129.99, 'Pending'),
(9, 9, '2023-07-05', 24.99, 'Completed'),
(10, 10, '2023-07-10', 149.99, 'Completed'),
(11, 11, '2023-07-15', 79.99, 'Completed'),
(12, 12, '2023-07-20', 189.98, 'Completed'),
(13, 13, '2023-07-25', 59.99, 'Pending'),
(14, 14, '2023-07-28', 59.99, 'Completed'),
(15, 15, '2023-07-30', 99.99, 'Completed');

-- Insert Data into OrderDetails Table
INSERT INTO OrderDetails (order_detail_id, order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 1, 899.99),
(2, 1, 3, 2, 29.99),
(3, 2, 3, 1, 49.99),
(4, 3, 4, 2, 149.99),
(5, 4, 5, 1, 39.99),
(6, 5, 2, 1, 699.99),
(7, 6, 14, 1, 179.99),
(8, 7, 6, 1, 99.99),
(9, 8, 7, 1, 129.99),
(10, 9, 9, 1, 24.99),
(11, 10, 4, 1, 149.99),
(12, 11, 10, 1, 79.99),
(13, 12, 11, 2, 59.99),
(14, 13, 10, 1, 59.99),
(15, 14, 8, 2, 49.99);

-- Insert Data into Payments Table
INSERT INTO Payments (payment_id, order_id, payment_date, payment_amount, payment_method) VALUES
(1, 1, '2023-06-01', 959.98, 'Credit Card'),
(2, 2, '2023-06-05', 49.99, 'PayPal'),
(3, 4, '2023-06-15', 39.99, 'Debit Card'),
(4, 5, '2023-06-20', 699.99, 'Credit Card'),
(5, 6, '2023-06-25', 179.99, 'UPI'),
(6, 7, '2023-06-30', 99.98, 'Credit Card'),
(7, 9, '2023-07-05', 24.99, 'PayPal'),
(8, 10, '2023-07-10', 149.99, 'Debit Card'),
(9, 11, '2023-07-15', 79.99, 'UPI'),
(10, 12, '2023-07-20', 189.98, 'Credit Card'),
(11, 14, '2023-07-28', 59.99, 'PayPal'),
(12, 15, '2023-07-30', 99.99, 'Credit Card');


-- 1. Total Number of Orders for Each Customer
SELECT c.customer_id, c.first_name, c.last_name, COUNT(o.order_id) AS total_orders
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

-- 2. Total Sales Amount for Each Product
SELECT p.product_id, p.product_name, SUM(od.quantity * od.unit_price) AS total_revenue
FROM Products p
LEFT JOIN OrderDetails od ON p.product_id = od.product_id
GROUP BY p.product_id, p.product_name;

-- 3. Most Expensive Product Sold
SELECT p.product_id, p.product_name, p.price
FROM Products p
WHERE p.price = (SELECT MAX(price) FROM Products);

-- 4. Customers Who Placed Orders in the Last 30 Days
SELECT DISTINCT c.customer_id, c.first_name, c.last_name
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_date >= DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY);

-- 5. Total Amount Paid by Each Customer
SELECT c.customer_id, c.first_name, c.last_name, SUM(o.total_amount) AS total_spent
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

-- 6. Number of Products Sold by Category
SELECT p.category, SUM(od.quantity) AS total_products_sold
FROM Products p
LEFT JOIN OrderDetails od ON p.product_id = od.product_id
GROUP BY p.category;

-- 7. Pending Orders
SELECT o.order_id, c.first_name, c.last_name, o.order_date, o.total_amount
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
WHERE o.order_status = 'Pending';

-- 8. Average Order Value
SELECT AVG(total_amount) AS average_order_value
FROM Orders;

-- 9. Top 5 Customers Who Have Spent the Most Money
SELECT c.customer_id, c.first_name, c.last_name, SUM(o.total_amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC
LIMIT 5;

-- 10. Products That Have Never Been Sold
SELECT p.product_id, p.product_name
FROM Products p
LEFT JOIN OrderDetails od ON p.product_id = od.product_id
WHERE od.order_detail_id IS NULL;
