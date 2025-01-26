-- HR Application

-- Departments Table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100),
    ManagerID INT,
    FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID);
);

-- Employees Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    HireDate DATE,
    DepartmentID INT,
    ManagerID INT,
    Salary DECIMAL(10,2),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
    FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID)
);

-- PerformanceReviews Table
CREATE TABLE PerformanceReviews (
    ReviewID INT PRIMARY KEY,
    EmployeeID INT,
    ReviewDate DATE,
    PerformanceScore VARCHAR(20),
    Comments TEXT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Payroll Table
CREATE TABLE Payroll (
    PayrollID INT PRIMARY KEY,
    EmployeeID INT,
    PaymentDate DATE,
    Amount DECIMAL(10,2),
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Insert Dummy Data
-- Insert Data into Departments Table
INSERT INTO Departments (DepartmentID, DepartmentName, ManagerID) VALUES
(1, 'Human Resources', 101),
(2, 'Finance', 102),
(3, 'IT', 103),
(4, 'Marketing', 104),
(5, 'Operations', 105);

-- Insert Data into Employees Table
INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, Phone, HireDate, DepartmentID, ManagerID, Salary) VALUES
(101, 'Alice', 'Johnson', 'alice.johnson@example.com', '555-1234', '2020-01-15', 1, NULL, 75000.00),
(102, 'Bob', 'Smith', 'bob.smith@example.com', '555-5678', '2019-03-10', 2, NULL, 85000.00),
(103, 'Charlie', 'Davis', 'charlie.davis@example.com', '555-8765', '2021-05-12', 3, NULL, 95000.00),
(104, 'Diana', 'Brown', 'diana.brown@example.com', '555-6543', '2018-07-20', 4, NULL, 78000.00),
(105, 'Ethan', 'White', 'ethan.white@example.com', '555-9876', '2017-06-18', 5, NULL, 80000.00),
(106, 'Fiona', 'Taylor', 'fiona.taylor@example.com', '555-1111', '2022-02-15', 1, 101, 55000.00),
(107, 'George', 'Harris', 'george.harris@example.com', '555-2222', '2022-03-22', 2, 102, 60000.00),
(108, 'Holly', 'Martinez', 'holly.martinez@example.com', '555-3333', '2021-09-10', 3, 103, 70000.00),
(109, 'Ian', 'Clark', 'ian.clark@example.com', '555-4444', '2021-11-20', 4, 104, 62000.00),
(110, 'Julia', 'Lewis', 'julia.lewis@example.com', '555-5555', '2020-08-25', 5, 105, 67000.00),
(111, 'Kevin', 'Hall', 'kevin.hall@example.com', '555-6666', '2019-10-05', 3, 103, 72000.00),
(112, 'Laura', 'Young', 'laura.young@example.com', '555-7777', '2020-12-12', 1, 101, 58000.00),
(113, 'Mike', 'Turner', 'mike.turner@example.com', '555-8888', '2019-06-07', 2, 102, 65000.00),
(114, 'Nina', 'Adams', 'nina.adams@example.com', '555-9999', '2018-04-16', 4, 104, 59000.00),
(115, 'Oscar', 'Brown', 'oscar.brown@example.com', '555-0000', '2023-01-10', 5, 105, 50000.00);

-- Insert Data into PerformanceReviews Table
INSERT INTO PerformanceReviews (ReviewID, EmployeeID, ReviewDate, PerformanceScore, Comments) VALUES
(1, 106, '2023-06-01', 'Excellent', 'Great teamwork and dedication.'),
(2, 107, '2023-06-02', 'Good', 'Shows improvement in critical areas.'),
(3, 108, '2023-06-03', 'Excellent', 'Consistently delivers high-quality work.'),
(4, 109, '2023-06-04', 'Average', 'Needs to focus on meeting deadlines.'),
(5, 110, '2023-06-05', 'Good', 'Contributes positively to the team.'),
(6, 111, '2023-06-06', 'Excellent', 'Demonstrates leadership qualities.'),
(7, 112, '2023-06-07', 'Good', 'Reliable and efficient work.'),
(8, 113, '2023-06-08', 'Average', 'Can improve communication skills.'),
(9, 114, '2023-06-09', 'Good', 'Has potential to grow further.'),
(10, 115, '2023-06-10', 'Excellent', 'Great performance in recent projects.'),
(11, 101, '2023-06-11', 'Excellent', 'Highly respected as a manager.'),
(12, 102, '2023-06-12', 'Good', 'Leads the team effectively.'),
(13, 103, '2023-06-13', 'Excellent', 'Highly innovative in problem-solving.'),
(14, 104, '2023-06-14', 'Good', 'Excellent stakeholder communication.'),
(15, 105, '2023-06-15', 'Excellent', 'Ensures smooth operations in the department.');

-- Insert Data into Payroll Table
INSERT INTO Payroll (PayrollID, EmployeeID, PaymentDate, Amount, PaymentMethod) VALUES
(1, 101, '2023-07-01', 7500.00, 'Bank Transfer'),
(2, 102, '2023-07-01', 8500.00, 'Bank Transfer'),
(3, 103, '2023-07-01', 9500.00, 'Check'),
(4, 104, '2023-07-01', 7800.00, 'Bank Transfer'),
(5, 105, '2023-07-01', 8000.00, 'Bank Transfer'),
(6, 106, '2023-07-01', 5500.00, 'Check'),
(7, 107, '2023-07-01', 6000.00, 'Bank Transfer'),
(8, 108, '2023-07-01', 7000.00, 'Check'),
(9, 109, '2023-07-01', 6200.00, 'Bank Transfer'),
(10, 110, '2023-07-01', 6700.00, 'Check'),
(11, 111, '2023-07-01', 7200.00, 'Bank Transfer'),
(12, 112, '2023-07-01', 5800.00, 'Check'),
(13, 113, '2023-07-01', 6500.00, 'Bank Transfer'),
(14, 114, '2023-07-01', 5900.00, 'Check'),
(15, 115, '2023-07-01', 5000.00, 'Bank Transfer');


-- 1. Employees hired after January 1, 2023
SELECT EmployeeID, FirstName, LastName, Email, Phone, HireDate
FROM Employees
WHERE HireDate > '2023-01-01';

-- 2. Total payroll amount paid to each department
SELECT 
    d.DepartmentID, 
    d.DepartmentName, 
    SUM(p.Amount) AS TotalPayrollAmount
FROM Departments d
LEFT JOIN Employees e ON d.DepartmentID = e.DepartmentID
LEFT JOIN Payroll p ON e.EmployeeID = p.EmployeeID
GROUP BY d.DepartmentID, d.DepartmentName;

-- 3. Employees without a manager
SELECT EmployeeID, FirstName, LastName, Email
FROM Employees
WHERE ManagerID IS NULL;

-- 4. Highest salary in each department with employee name
SELECT 
    d.DepartmentID, 
    d.DepartmentName, 
    e.EmployeeID,
    e.FirstName, 
    e.LastName, 
    MAX(e.Salary) AS HighestSalary
FROM Departments d
JOIN Employees e ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName, e.EmployeeID, e.FirstName, e.LastName;

-- 5. Most recent performance review for each employee
SELECT 
    e.EmployeeID, 
    e.FirstName, 
    e.LastName, 
    pr.ReviewDate, 
    pr.PerformanceScore, 
    pr.Comments
FROM Employees e
JOIN (
    SELECT 
        EmployeeID, 
        ReviewDate, 
        PerformanceScore, 
        Comments,
        RANK() OVER (PARTITION BY EmployeeID ORDER BY ReviewDate DESC) as rnk
    FROM PerformanceReviews
) pr ON e.EmployeeID = pr.EmployeeID AND pr.rnk = 1;

-- 6. Number of employees in each department
SELECT 
    d.DepartmentID, 
    d.DepartmentName, 
    COUNT(e.EmployeeID) AS EmployeeCount
FROM Departments d
LEFT JOIN Employees e ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName;

-- 7. Employees with "Excellent" performance score
SELECT 
    e.EmployeeID, 
    e.FirstName, 
    e.LastName, 
    pr.PerformanceScore
FROM Employees e
JOIN PerformanceReviews pr ON e.EmployeeID = pr.EmployeeID
WHERE pr.PerformanceScore = 'Excellent';

-- Most frequently used payment method in payroll
SELECT PaymentMethod, COUNT(*) AS MethodCount
FROM Payroll
GROUP BY PaymentMethod
ORDER BY MethodCount DESC
LIMIT 1;

-- 8. Top 5 highest-paid employees with their departments
SELECT 
    e.EmployeeID, 
    e.FirstName, 
    e.LastName, 
    d.DepartmentName, 
    e.Salary
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
ORDER BY e.Salary DESC
LIMIT 5;

-- 9. Employees reporting to a specific manager
SELECT 
    e.EmployeeID, 
    e.FirstName, 
    e.LastName, 
    e.Email,
    d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE e.ManagerID = 101;
