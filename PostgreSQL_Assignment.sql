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
