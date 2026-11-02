show databases;
create database new;
use new;
-- CREATE TABLE departments (
--     dept_id INT PRIMARY KEY,
--     dept_name VARCHAR(30) UNIQUE NOT NULL
-- );
-- CREATE TABLE employees (
--     emp_id INT PRIMARY KEY AUTO_INCREMENT,
--     emp_name VARCHAR(30) NOT NULL,
--     email VARCHAR(50) UNIQUE,
--     dept_id INT,
--     salary INT DEFAULT 20000,
--     age INT,
--     FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
-- );
-- CREATE TABLE projects (
--     project_id INT PRIMARY KEY AUTO_INCREMENT,
--     project_name VARCHAR(50) UNIQUE NOT NULL
-- );
-- INSERT INTO departments
-- VALUES
-- (1, 'IT'),
-- (2, 'HR'),
-- (3, 'Finance'),
-- (4, 'Sales');
-- INSERT INTO employees (emp_name, email, dept_id, salary, age)
-- VALUES
-- ('Rahul', 'rahul@gmail.com', 1, 50000, 25),
-- ('Priya', 'priya@gmail.com', 2, 35000, 28),
-- ('Arjun', 'arjun@gmail.com', 1, 60000, 30),
-- ('Sneha', 'sneha@gmail.com', 3, 45000, 26),
-- ('Kiran', 'kiran@gmail.com', 2, 30000, 24);
-- INSERT INTO projects (project_name)
-- VALUES
-- ('Banking'),
-- ('E-commerce'),
-- ('Healthcare');
-- SELECT * FROM departments;
-- SELECT * FROM employees;
-- SELECT * FROM projects
-- Display employee names along with their department names.
select e.emp_name, d.dept_name 
	from employees e
    inner join departments d
    on e.dept_id=d.dept_id;
-- Display employee names and salaries along with department names.
select e.emp_name,e.salary, d.dept_name 
	from employees e
    inner join departments d
    on e.dept_id=d.dept_id;
-- Display employees who belong to the IT department.
select e.emp_name, d.dept_name 
	from employees e
    inner join departments d
    on e.dept_id=d.dept_id
    where d.dept_name='it';
-- Display employees who belong to the HR department.
select e.emp_name, d.dept_name 
	from employees e
    inner join departments d
    on e.dept_id=d.dept_id
    where d.dept_name='hr';
-- Display employee ID, employee name, and department ID.
select  e.emp_id,e.emp_name, d.dept_name 
	from employees e
    inner join departments d
    on e.dept_id=d.dept_id
    where d.dept_name='it';
-- Display employees whose salary is greater than 40000 along with department names.
select  e.emp_id,e.emp_name, d.dept_name 
	from employees e
    inner join departments d
    on e.dept_id=d.dept_id
    where e.salary>40000;
-- Display employees working in Finance.
select  e.emp_id,e.emp_name, d.dept_name 
	from employees e
    inner join departments d
    on e.dept_id=d.dept_id
    where d.dept_name='finance';
-- Display department names and employee names in alphabetical order.
select e.emp_name,d.dept_name 
	from employees e
     inner join departments d
     on e.emp_id=d.dept_id
     order by d.dept_name , e.emp_name;
-- Display employees whose age is greater than 25 along with their department names.
select e.emp_name,d.dept_name ,e.age
	from employees e
     inner join departments d
     on e.emp_id=d.dept_id
     where e.age>25;
-- Display employees earning between 30000 and 50000 along with department names.
select e.emp_name,d.dept_name ,e.salary
	from employees e
     inner join departments d
     on e.emp_id=d.dept_id
     where e.salary between 30000 and 50000;
-- Display all departments, including departments that have no employees.
SELECT d.dept_name
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id;
-- Display all employees and their department names.
select e.emp_name,d.dept_name
	from employees e
    inner join departments d
    on e.dept_id=d.dept_id;
-- Find departments that have no employees.
SELECT d.dept_name
	FROM departments d
	LEFT JOIN employees e
	ON d.dept_id = e.dept_id
	WHERE e.emp_id IS NULL;
-- Display the total number of employees in each department, including departments with zero employees.
SELECT d.dept_name, count(*) 
FROM departments d
left  JOIN employees e
ON d.dept_id = e.dept_id
group by d.dept_id;
-- Display all departments and their employees, sorted by department name.
select e.emp_name,d.dept_name
 from employees e
 inner join departments d
 on e.dept_id=d.dept_id
 order by d.dept_name;
-- Display all employees and their corresponding department names.
select e.emp_name,d.dept_name
 from departments d
 right join employees e 
 on e.dept_id=d.dept_id
 order by d.dept_name;
-- Display all departments, including those without employees.
select e.emp_name,d.dept_name
 from employees e
 right join departments d
 on e.dept_id=d.dept_id
 order by d.dept_name;
-- Find employees who have a matching department.
select e.emp_name 
	from employees e
    inner join departments d
    on e.dept_id=d.dept_id;
-- Display department names and the number of employees.
select d.dept_name,count(*)
	from departments d
    left join employees e
    on d.dept_id=e.dept_id
    group by d.dept_name;
-- Display all records from the departments table using RIGHT JOIN.
SELECT *
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;

SELECT d.dept_name, COUNT(e.emp_id) AS total_employees
FROM departments d
INNER JOIN employees e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name
ORDER BY total_employees DESC
LIMIT 1;
-- Find the department with the highest average salary.
select d.dept_name, avg(e.salary) as avgg
FROM departments d
INNER JOIN employees e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name
ORDER BY  avgg DESC
LIMIT 1;
-- Find employees earning more than their department's average salary.
SELECT e.emp_name, e.salary
FROM employees e
INNER JOIN (
    SELECT dept_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY dept_id
) AS d
ON e.dept_id = d.dept_id
WHERE e.salary > d.avg_salary;
-- Find the department with the highest-paid employee.
SELECT e.emp_name, e.salary, d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id
WHERE e.salary = (
    SELECT MAX(salary)
    FROM employees
);
-- Display department-wise minimum, maximum and average salaries.
SELECT d.dept_name,min(e.salary) as min_salary, max(e.salary) as maxium_salary , avg(e.salary) as average_salary
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id
group by d.dept_id;
