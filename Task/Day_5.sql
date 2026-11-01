show databases;
create database new;
use new;
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(30) UNIQUE NOT NULL
);
CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(30) NOT NULL,
    email VARCHAR(50) UNIQUE,
    dept_id INT,
    salary INT DEFAULT 20000,
    age INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);
CREATE TABLE projects (
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    project_name VARCHAR(50) UNIQUE NOT NULL
);
INSERT INTO departments
VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Sales');
INSERT INTO employees (emp_name, email, dept_id, salary, age)
VALUES
('Rahul', 'rahul@gmail.com', 1, 50000, 25),
('Priya', 'priya@gmail.com', 2, 35000, 28),
('Arjun', 'arjun@gmail.com', 1, 60000, 30),
('Sneha', 'sneha@gmail.com', 3, 45000, 26),
('Kiran', 'kiran@gmail.com', 2, 30000, 24);
INSERT INTO projects (project_name)
VALUES
('Banking'),
('E-commerce'),
('Healthcare');
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM projects;
