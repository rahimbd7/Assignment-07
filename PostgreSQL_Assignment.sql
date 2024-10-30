-- Create Database
CREATE DATABASE university_db;

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