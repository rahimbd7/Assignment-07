-- Create Database
CREATE DATABASE university_db;

-- Connect to Database
SELECT current_database();

-- 1. Create the "students" table
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    age INTEGER CHECK (age > 0),
    email VARCHAR(100) UNIQUE NOT NULL,
    frontend_mark INTEGER CHECK (frontend_mark >= 0),
    backend_mark INTEGER CHECK (backend_mark >= 0),
    status VARCHAR(20)
);

-- 2. Create the "courses" table
CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(50) NOT NULL,
    credits INTEGER CHECK (credits > 0)
);



-- 3. Create the "enrollment" table
CREATE TABLE enrollment (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INTEGER REFERENCES students(student_id) ON DELETE CASCADE,
    course_id INTEGER REFERENCES courses(course_id) ON DELETE CASCADE
);



-- Insert sample data into "students" table
INSERT INTO students (student_name, age, email, frontend_mark, backend_mark, status)
VALUES
    ( 'Sameer', 21, 'sameer@example.com', 48, 60, NULL),
    ( 'Zoya', 23, 'zoya@example.com', 52, 58, NULL),
    ( 'Nabil', 22, 'nabil@example.com', 37, 46, NULL),
    ( 'Rafi', 24, 'rafi@example.com', 41, 40, NULL),
    ( 'Sophia', 22, 'sophia@example.com', 50, 52, NULL),
    ( 'Hasan', 23, 'hasan@gmail.com', 43, 39, NULL);

SELECT * FROM students

-- Insert sample data into "courses" table
INSERT INTO courses (course_name, credits)
VALUES
    ( 'Next.js', 3),
    ( 'React.js', 4),
    ( 'Databases', 3),
    ( 'Prisma', 3);

SELECT * FROM courses


-- Insert sample data into "enrollment" table
INSERT INTO enrollment (student_id, course_id)
VALUES
    (1, 1),
    (1, 2),
    (2, 1),
    (3, 2);


SELECT * FROM enrollment;

-- Query 1: Insert a new student record
INSERT INTO students (student_name, age, email, frontend_mark, backend_mark, status)
VALUES ('rahim', 34, 'rahim@rahim.me', 85, 85, NULL);


-- Query 2: Retrieve names of students enrolled in the 'Next.js' course
SELECT s.student_name
FROM students s
JOIN enrollment e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE c.course_name = 'Next.js';


-- Query 3: Update status of the student with the highest total mark
UPDATE students
SET status = 'Awarded'
WHERE (frontend_mark + backend_mark) = (
    SELECT MAX(frontend_mark + backend_mark) FROM students
);

SELECT * FROM students;



-- Query 4: Delete courses with no enrollments
DELETE FROM courses
WHERE course_id NOT IN (SELECT DISTINCT course_id FROM enrollment);

SELECT * FROM courses;


-- Query 5: Retrieve names of students using a limit of 2, starting from the 3rd student
SELECT student_name
FROM students
ORDER BY student_id
LIMIT 2 OFFSET 2;


-- Query 6: Retrieve course names and the number of students enrolled in each course
SELECT c.course_name, COUNT(e.student_id) AS students_enrolled
FROM courses c
LEFT JOIN enrollment e ON c.course_id = e.course_id
GROUP BY c.course_name;

SELECT * FROM enrollment;



-- Query 7: Calculate the average age of all students
SELECT round(AVG(age), 2) AS average_age
FROM students;


-- Query 8: Retrieve names of students whose email contains 'example.com'
SELECT student_name
FROM students
WHERE email LIKE '%example.com%';

SELECT * FROM students;