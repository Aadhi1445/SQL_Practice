show databases;
-- create database Project; 
use  Project;
-- Day ---222
show tables;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(30),
    department VARCHAR(20),
    city VARCHAR(20),
    salary INT,
    age INT,
    bonus INT
);
INSERT INTO employees
VALUES
(1, 'Rahul', 'IT', 'Hyderabad', 50000, 25, 5000),
(2, 'Priya', 'HR', 'Chennai', 35000, 28, NULL),
(3, 'Arjun', 'IT', 'Hyderabad', 60000, 30, 8000),
(4, 'Sneha', 'Finance', 'Mumbai', 45000, 26, 3000),
(5, 'Kiran', 'HR', 'Hyderabad', 30000, 24, NULL),
(6, 'Anjali', 'IT', 'Bangalore', 70000, 32, 10000),
(7, 'Vijay', 'Finance', 'Chennai', 40000, 29, 4000),
(8, 'Meena', 'IT', 'Mumbai', 55000, 27, NULL),
(9, 'Ravi', 'Sales', 'Hyderabad', 25000, 22, 2000),
(10, 'Divya', 'Sales', 'Bangalore', 38000, 26, NULL);
select *from employees;

-- Level 1: Basic Filtering
-- Display employees whose salary is greater than ₹50,000.
select *from employees 
where salary >50000;
-- Display employees whose age is less than 27.
select * from employees where age <27;
-- Display employees whose salary is exactly ₹40,000.
select *from employees 
where salary =40000;
-- Display employees who are not from Chennai.
select *from employees 
where city <>'Chennai';
-- Display employees whose salary is greater than or equal to ₹45,000.
select *from employees
where salary >=45000;
-- Level 2: AND, OR, NOT
-- Find employees from Hyderabad who earn less than ₹40,000.
select *from employees
where city ='Hyderabad' and salary <40000;
-- Find employees who work in IT and earn more than ₹55,000.
select *from employees 
where department='it' and salary >55000;
-- Find employees who are from Chennai or Mumbai.
select *from employees 
where city in ('chennai','mumbai');
-- Find employees who work in HR or Sales.
select *from employees 
where department in ('hr','sales');
-- Find employees who are not from Hyderabad and whose salary exceeds ₹40,000.
select *from employees
where city <>'hyderabad' and salary >40000;
-- Level 3: BETWEEN
-- Find employees whose salaries are between ₹35,000 and ₹60,000.
select *from employees
where salary between 35000 and 60000;
-- Find employees whose ages are between 25 and 29.
select *from employees 
where age between  25 and 29;
-- Find employees whose salaries are outside the range of ₹30,000 to ₹50,000.
select *from employees
where salary not between 30000 and 50000;
-- Level 4: IN and NOT IN
-- Find employees who work in IT, HR, or Finance.
select *from employees
where department in ('it','hr','finance');
-- Find employees who are from Hyderabad or Bangalore.
select *from employees 
where city in ('hyderabad','bangalore');
-- Find employees whose departments are neither IT nor Sales.
select *from employees
where department in ('it','sales');
-- Level 5: LIKE and Wildcards
-- Find employees whose names start with R.
select *from employees
where emp_name like 'r%';
-- Find employees whose names end with i.
select * from employees 
where  emp_name like '%i';
-- Find employees whose names contain an.
select *from employees
where emp_name like '%an%';
-- Find employees whose names have a as the second character.
select * from employees 
where emp_name like '_a%';
-- Find employees whose names contain exactly two occurrences of the letter a.
select *from employees
where emp_name like '%a%a%'. and 
not emp_name like '%a%a%a%';
-- Level 6: NULL Handling
-- Display employees whose bonus is NULL.
select *from employees
where bonus is null;
-- Display employees whose bonus is not NULL.
select *from employees 
where bonus  is not null;
-- Display every employee's name and bonus, showing 0 when the bonus is NULL.
select emp_name , coalesce(bonus,'aditya') from employees;
-- Level 7: Combining Conditions
-- Find employees from Hyderabad who work in IT or HR.
select *from employees
where city ='hyderabad' 
and department in ('it','hr');
-- Find employees who earn more than ₹40,000 and are either from Chennai or Mumbai.
select *from employees 
where salary >40000 and 
city in ('chennai','mumbai');
-- Find employees from Hyderabad who either work in IT or earn less than ₹35,000.
select *from employees
where city ='hyderabad' and 
(department ='it' or salary <35000);
-- Level 8: Mixed Practice
-- Display employees who are not from Hyderabad and whose salary exceeds ₹40,000.
select *from employees
where city <>'hyderabad' and salary >40000;
-- Display employees who work in IT or Finance, earn between ₹40,000 and ₹65,000, and have a non-NULL bonus.
select *from employees
where department in ('it','finance') and 
salary between 40000 and 65000 and 
bonus is not null;
-- Display employees whose names start with A or R, who are not from Mumbai, and whose salary is at least ₹25,000.
select *from employees 
where emp_name like 'a%' or   emp_name like 'r%' 
and (city <>'mumbai') and salary >=25000;