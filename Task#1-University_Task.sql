-- University Database Schema


-- Departments Table Data
INSERT INTO Departments (department_id, department_name) VALUES
(1, 'Computer Science and Engineering'),
(2, 'Mathematics'),
(3, 'Physics'),
(4, 'Biotechnology');

-- Professors Table Data
INSERT INTO Professors (professor_id, first_name, last_name, email, phone) VALUES
(101, 'Rajesh', 'Sharma', 'rajesh.sharma@univ.edu', '123-4567890'),
(102, 'Nandita', 'Rao', 'nandita.rao@univ.edu', '123-4567891'),
(103, 'Abhinav', 'Das', 'abhinav.das@univ.edu', '123-4567892'),
(104, 'Maya', 'Verma', 'maya.verma@univ.edu', '123-4567893');

-- Courses Table Data
INSERT INTO Courses (course_id, course_name, department_id, professor_id, credits) VALUES
(201, 'Advanced Database Systems', 1, 101, 4),
(202, 'Applied Linear Algebra', 2, 102, 3),
(203, 'Classical Mechanics', 3, 103, 4),
(204, 'Genetic Engineering Basics', 4, 104, 3);

-- Students Table Data
INSERT INTO Students (student_id, first_name, last_name, email, phone, date_of_birth, enrollment_date, department_id) VALUES
(301, 'Aarav', 'Kumar', 'aarav.kumar@student.edu', '987-6543210', '2002-04-20', '2022-08-01', 1),
(302, 'Ishita', 'Gupta', 'ishita.gupta@student.edu', '987-6543211', '2002-09-15', '2022-08-01', 2),
(303, 'Vihaan', 'Patel', 'vihaan.patel@student.edu', '987-6543212', '2002-07-10', '2022-08-01', 3),
(304, 'Ananya', 'Joshi', 'ananya.joshi@student.edu', '987-6543213', '2002-12-05', '2022-08-01', 4);

-- Enrollments Table Data
INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date, grade) VALUES
(401, 301, 201, '2023-01-10', 'A'),
(402, 301, 202, '2023-01-10', 'A-'),
(403, 302, 202, '2023-01-10', 'B+'),
(404, 303, 203, '2023-01-10', 'B'),
(405, 304, 204, '2023-01-10', 'A');



/* SQL queries for case study */

-- 1. Total Number of Students in Each Department

SELECT d.department_name, COUNT(s.student_id) AS total_students
FROM Departments d
LEFT JOIN Students s ON d.department_id = s.department_id
GROUP BY d.department_name;


-- 2. Courses Taught by a Specific Professor

SELECT c.course_name, CONCAT(p.first_name, ' ', p.last_name) AS professor_name
FROM Courses c
JOIN Professors p ON c.professor_id = p.professor_id
WHERE p.professor_id = 101;


-- 3. Average Grade of Students in Each Course

SELECT c.course_name, AVG(
    CASE 
        WHEN e.grade = 'A' THEN 4.0
        WHEN e.grade = 'A-' THEN 3.7
        WHEN e.grade = 'B+' THEN 3.3
        WHEN e.grade = 'B' THEN 3.0
        WHEN e.grade = 'C' THEN 2.0
        ELSE 0
    END
) AS average_grade
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name;


-- 4. Students Not Enrolled in Any Courses

SELECT s.first_name, s.last_name
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.enrollment_id IS NULL;


-- 5. Number of Courses Offered by Each Department

SELECT d.department_name, COUNT(c.course_id) AS total_courses
FROM Departments d
LEFT JOIN Courses c ON d.department_id = c.department_id
GROUP BY d.department_name;


-- 6. Students Who Have Taken a Specific Course ('Advanced Database Systems')

SELECT s.first_name, s.last_name
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE c.course_name = 'Advanced Database Systems';


-- 7. Most Popular Course

SELECT c.course_name, COUNT(e.enrollment_id) AS total_enrollments
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name
ORDER BY total_enrollments DESC
LIMIT 1;


-- 8. Average Credits Per Student in Each Department

SELECT d.department_name, AVG(c.credits) AS avg_credits_per_student
FROM Departments d
JOIN Students s ON d.department_id = s.department_id
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
GROUP BY d.department_name;


-- 9. Professors Teaching in More Than One Department

SELECT p.first_name, p.last_name, COUNT(DISTINCT c.department_id) AS departments_count
FROM Professors p
JOIN Courses c ON p.professor_id = c.professor_id
GROUP BY p.professor_id, p.first_name, p.last_name
HAVING departments_count > 1;


-- 10. Highest and Lowest Grade in a Specific Course ('Applied Linear Algebra')

SELECT 
    c.course_name,
    MAX(e.grade) AS highest_grade, 
    MIN(e.grade) AS lowest_grade
FROM Courses c
JOIN Enrollments e ON c.course_id = e.course_id
WHERE c.course_name = 'Applied Linear Algebra'
GROUP BY c.course_name;
