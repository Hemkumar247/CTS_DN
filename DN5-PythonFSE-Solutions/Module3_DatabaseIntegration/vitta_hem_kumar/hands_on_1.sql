-- ============================================================================
-- 1. Database Creation
-- ============================================================================

DROP DATABASE IF EXISTS college_db;
CREATE DATABASE college_db;
USE college_db;


-- Table 1: Departments
CREATE TABLE departments (
    dept_id INT AUTO_INCREMENT,
    dept_name VARCHAR(100) NOT NULL,
    hod_name VARCHAR(100) NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (dept_id),
    CONSTRAINT uq_dept_name UNIQUE (dept_name)
);

-- Table 2: Professors
CREATE TABLE professors (
    prof_id INT AUTO_INCREMENT,
    prof_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    dept_id INT NOT NULL,
    CONSTRAINT pk_professors PRIMARY KEY (prof_id),
    CONSTRAINT uq_prof_email UNIQUE (email),
    CONSTRAINT fk_prof_dept FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- Table 3: Students
CREATE TABLE students (
    student_id INT AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    dept_id INT NOT NULL,
    CONSTRAINT pk_students PRIMARY KEY (student_id),
    CONSTRAINT uq_student_email UNIQUE (email),
    CONSTRAINT fk_student_dept FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- Table 4: Courses
CREATE TABLE courses (
    course_id INT AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL,
    dept_id INT NOT NULL,
    CONSTRAINT pk_courses PRIMARY KEY (course_id),
    CONSTRAINT fk_course_dept FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- Table 5: Enrollments
CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE DEFAULT (CURRENT_DATE),
    grade CHAR(1) DEFAULT NULL,
    CONSTRAINT pk_enrollments PRIMARY KEY (enrollment_id),
    CONSTRAINT fk_enrollment_student FOREIGN KEY (student_id) REFERENCES students(student_id),
    CONSTRAINT fk_enrollment_course FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- ============================================================================
-- 3. Schema Modifications (ALTER Commands)
-- ============================================================================

-- Step A: Add phone_number to students table
ALTER TABLE students ADD COLUMN phone_number VARCHAR(15);

-- Step B: Add max_seats to courses table with default value 60
ALTER TABLE courses ADD COLUMN max_seats INT DEFAULT 60;

-- Step C: Add Check constraint to enrollments grade (only values A, B, C, D, F, or NULL allowed)
ALTER TABLE enrollments ADD CONSTRAINT chk_grade CHECK (grade IN ('A', 'B', 'C', 'D', 'F') OR grade IS NULL);

-- Step D: Rename departments.hod_name to departments.head_of_dept
-- Using standard MySQL 8.0+ syntax
ALTER TABLE departments RENAME COLUMN hod_name TO head_of_dept;

-- Step E: Drop phone_number column from students to simulate rollback
ALTER TABLE students DROP COLUMN phone_number;

-- ============================================================================
-- 4. Verification Commands
-- ============================================================================
DESCRIBE departments;
DESCRIBE professors;
DESCRIBE students;
DESCRIBE courses;
DESCRIBE enrollments;
