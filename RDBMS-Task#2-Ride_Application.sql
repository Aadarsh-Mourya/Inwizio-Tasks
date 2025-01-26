-- Drivers Table
CREATE TABLE Drivers (
    DriverID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Phone VARCHAR(20),
    City VARCHAR(100),
    VehicleType VARCHAR(50),
    Rating DECIMAL(3,2)
);

-- Riders Table
CREATE TABLE Riders (
    RiderID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Phone VARCHAR(20),
    City VARCHAR(100),
    JoinDate DATE
);

-- Rides Table
CREATE TABLE Rides (
    RideID INT PRIMARY KEY,
    RiderID INT,
    DriverID INT,
    RideDate DATE,
    PickupLocation VARCHAR(200),
    DropLocation VARCHAR(200),
    Distance DECIMAL(10,2),
    Fare DECIMAL(10,2),
    RideStatus VARCHAR(20),
    FOREIGN KEY (RiderID) REFERENCES Riders(RiderID),
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID)
);

-- Payments Table
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    RideID INT,
    PaymentMethod VARCHAR(50),
    Amount DECIMAL(10,2),
    PaymentDate DATE,
    FOREIGN KEY (RideID) REFERENCES Rides(RideID)
);

--  Data for Drivers
INSERT INTO Drivers (DriverID, FirstName, LastName, Phone, City, VehicleType, Rating) VALUES
(1, 'Rajesh', 'Kumar', '9876543210', 'Mumbai', 'Sedan', 4.8),
(2, 'Priya', 'Sharma', '9988776655', 'Delhi', 'Hatchback', 4.6),
(3, 'Amit', 'Patel', '9876598760', 'Bangalore', 'SUV', 4.9),
(4, 'Sneha', 'Gupta', '8765432109', 'Chennai', 'Sedan', 4.5),
(5, 'Vikram', 'Singh', '7654321098', 'Hyderabad', 'Hatchback', 4.7),
(6, 'Deepak', 'Yadav', '9786543210', 'Pune', 'SUV', 4.4),
(7, 'Kavita', 'Joshi', '9988743210', 'Mumbai', 'Sedan', 4.8),
(8, 'Ajay', 'Shah', '9887654321', 'Delhi', 'Electric', 4.9),
(9, 'Sunita', 'Gowda', '9687543210', 'Bangalore', 'Hatchback', 4.3),
(10, 'Rohan', 'Kapoor', '9787654301', 'Chennai', 'SUV', 4.5);

--  Data for Riders
INSERT INTO Riders (RiderID, FirstName, LastName, Phone, City, JoinDate) VALUES
(1, 'Rahul', 'Mehta', '9123456780', 'Mumbai', '2022-01-15'),
(2, 'Neha', 'Verma', '9234567891', 'Delhi', '2022-02-20'),
(3, 'Sanjay', 'Reddy', '9345678902', 'Bangalore', '2022-03-10'),
(4, 'Meera', 'Iyer', '9456789013', 'Chennai', '2022-04-05'),
(5, 'Karthik', 'Naidu', '9567890124', 'Hyderabad', '2022-05-12'),
(6, 'Unbooked', 'Rider', '9678901235', 'Pune', '2022-06-01'),
(7, 'Asha', 'Banerjee', '9123465789', 'Kolkata', '2022-07-15'),
(8, 'Manish', 'Chauhan', '9234576890', 'Jaipur', '2022-08-22'),
(9, 'Pooja', 'Malhotra', '9345687901', 'Pune', '2022-09-10'),
(10, 'Varun', 'Khanna', '9456798012', 'Mumbai', '2022-10-05'),
(11, 'Rina', 'Das', '9567809123', 'Bangalore', '2022-11-12');

--  Data for Rides
INSERT INTO Rides (RideID, RiderID, DriverID, RideDate, PickupLocation, DropLocation, Distance, Fare, RideStatus) VALUES
(1, 1, 1, '2023-01-15', 'Bandra', 'Colaba', 12.5, 250.00, 'Completed'),
(2, 2, 2, '2023-01-20', 'Connaught Place', 'Noida', 25.3, 450.00, 'Completed'),
(3, 3, 3, '2023-02-05', 'Indiranagar', 'Whitefield', 18.7, 350.00, 'Completed'),
(4, 4, 4, '2023-02-15', 'Anna Nagar', 'OMR', 22.1, 400.00, 'Completed'),
(5, 5, 5, '2023-03-01', 'Jubilee Hills', 'Gachibowli', 15.6, 300.00, 'Completed'),
(6, 1, 2, '2023-03-10', 'Andheri', 'Juhu', 8.9, 200.00, 'Cancelled'),
(7, 2, 6, '2023-03-12', 'DLF Phase 2', 'Cyber City', 5.0, 120.00, 'Completed'),
(8, 3, 7, '2023-03-18', 'Whitefield', 'MG Road', 12.8, 300.00, 'Completed'),
(9, 8, 4, '2023-03-22', 'Anna Nagar', 'Airport', 18.0, 400.00, 'Completed'),
(10, 7, 8, '2023-03-25', 'Salt Lake', 'Howrah', 10.5, 250.00, 'Completed'),
(11, 11, 5, '2023-03-30', 'BTM Layout', 'JP Nagar', 7.6, 190.00, 'Completed'),
(12, 9, 9, '2023-04-01', 'Hinjawadi', 'Kothrud', 14.0, 320.00, 'Completed'),
(13, 10, 2, '2023-04-10', 'Thane', 'Dadar', 20.3, 420.00, 'Completed'),
(14, 7, 3, '2023-04-15', 'Park Street', 'Eco Park', 8.5, 210.00, 'Completed'),
(15, 8, 10, '2023-04-20', 'Amer Fort', 'Hawa Mahal', 4.5, 100.00, 'Completed');


--  Data for Payments
INSERT INTO Payments (PaymentID, RideID, PaymentMethod, Amount, PaymentDate) VALUES
(1, 1, 'Card', 250.00, '2023-01-15'),
(2, 2, 'Wallet', 450.00, '2023-01-20'),
(3, 3, 'Cash', 350.00, '2023-02-05'),
(4, 4, 'Card', 400.00, '2023-02-15'),
(5, 5, 'Wallet', 300.00, '2023-03-01'),
(6, 6, 'Card', 200.00, '2023-03-10'),
(7, 7, 'Card', 120.00, '2023-03-12'),
(8, 8, 'Wallet', 300.00, '2023-03-18'),
(9, 9, 'Cash', 400.00, '2023-03-22'),
(10, 10, 'Card', 250.00, '2023-03-25'),
(11, 11, 'UPI', 190.00, '2023-03-30'),
(12, 12, 'Wallet', 320.00, '2023-04-01'),
(13, 13, 'Cash', 420.00, '2023-04-10'),
(14, 14, 'Card', 210.00, '2023-04-15'),
(15, 15, 'UPI', 100.00, '2023-04-20');



-- 1. Retrieve names and contact details of drivers with rating 4.5 or higher
SELECT FirstName, LastName, Phone, Rating
FROM Drivers
WHERE Rating >= 4.5;

-- 2. Total number of rides completed by each driver
SELECT d.DriverID, d.FirstName, d.LastName, COUNT(r.RideID) AS TotalCompletedRides
FROM Drivers d
LEFT JOIN Rides r ON d.DriverID = r.DriverID AND r.RideStatus = 'Completed'
GROUP BY d.DriverID;

-- 3. Riders who have never booked a ride
SELECT r.RiderID, r.FirstName, r.LastName
FROM Riders r
LEFT JOIN Rides ri ON r.RiderID = ri.RiderID
WHERE ri.RideID IS NULL;

-- 4. Total earnings of each driver from completed rides
SELECT d.DriverID, d.FirstName, d.LastName, COALESCE(SUM(r.Fare), 0) AS TotalEarnings
FROM Drivers d
LEFT JOIN Rides r ON d.DriverID = r.DriverID AND r.RideStatus = 'Completed'
GROUP BY d.DriverID;

-- 5. Most recent ride for each rider
SELECT r.RiderID, rd.FirstName, rd.LastName, r.RideID, r.RideDate, r.PickupLocation, r.DropLocation
FROM (
    SELECT RiderID, MAX(RideDate) AS MostRecentRideDate
    FROM Rides
    GROUP BY RiderID
) mr
JOIN Rides r ON mr.RiderID = r.RiderID AND mr.MostRecentRideDate = r.RideDate
JOIN Riders rd ON r.RiderID = rd.RiderID;

-- 6. Number of rides taken in each city
SELECT r.City, COUNT(ri.RideID) AS TotalRides
FROM Riders r
LEFT JOIN Rides ri ON r.RiderID = ri.RiderID
GROUP BY r.City;

-- 7. Rides with distance greater than 20 km
SELECT RideID, RiderID, DriverID, RideDate, PickupLocation, DropLocation, Distance
FROM Rides
WHERE Distance > 20;

-- 8. Most preferred payment method
SELECT PaymentMethod, COUNT(*) AS UsageCount
FROM Payments
GROUP BY PaymentMethod
ORDER BY UsageCount DESC
LIMIT 1;

-- 9. Top 3 highest-earning drivers
SELECT d.DriverID, d.FirstName, d.LastName, SUM(r.Fare) AS TotalEarnings
FROM Drivers d
JOIN Rides r ON d.DriverID = r.DriverID AND r.RideStatus = 'Completed'
GROUP BY d.DriverID
ORDER BY TotalEarnings DESC
LIMIT 3;

-- 10. Details of cancelled rides with rider and driver names
SELECT 
    r.RideID, 
    r.RideDate, 
    r.PickupLocation, 
    r.DropLocation, 
    r.Distance, 
    rd.FirstName AS RiderFirstName, 
    rd.LastName AS RiderLastName,
    d.FirstName AS DriverFirstName, 
    d.LastName AS DriverLastName
FROM Rides r
JOIN Riders rd ON r.RiderID = rd.RiderID
JOIN Drivers d ON r.DriverID = d.DriverID
WHERE r.RideStatus = 'Cancelled';
