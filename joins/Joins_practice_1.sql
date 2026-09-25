create database join_practice;
use join_practice;
create table 
	departments
		(dept_id int primary key,
        dept_name varchar(30),
        location varchar(30));
insert  into departments 
	values(1,'it','hyd'),
		   (2,'hr','chennai'),
           (3,'finance','mumbai'),
           (4,'sales','banglore'),
           ( 5,'marketing','delhi'),
           (6,'operations','pune');
select *from departments;
create table employees 
		(emp_id int primary key,
        emp_name varchar(30),
        dept_id int,
        manager_id int,
        salary int,
        city varchar(50));
select *from employees;
INSERT INTO employees VALUES
(101, 'Rahul', 1, NULL, 55000, 'Hyderabad'),
(102, 'Priya', 2, NULL, 45000, 'Chennai'),
(103, 'Arjun', 1, 101, 70000, 'Bangalore'),
(104, 'Sneha', 3, NULL, 60000, 'Hyderabad'),
(105, 'Kiran', 4, NULL, 65000, 'Bangalore'),
(106, 'Anjali', 1, 101, 50000, 'Hyderabad'),
(107, 'Vijay', 5, NULL, 48000, 'Delhi'),
(108, 'Ravi', NULL, NULL, 40000, 'Pune'),
(109, 'Pooja', 3, 104, 75000, 'Mumbai'),
(110, 'Suresh', 6, NULL, 52000, 'Pune'),
(111, 'Neha', NULL, NULL, 42000, 'Chennai');
CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    dept_id INT
);
INSERT INTO projects VALUES
(201, 'E-Commerce', 1),
(202, 'Recruitment System', 2),
(203, 'Banking System', 3),
(204, 'Sales Dashboard', 4),
(205, 'Marketing Campaign', 5),
(206, 'Payroll System', 3),
(207, 'Inventory System', 6),
(208, 'AI Chatbot', 1);
CREATE TABLE employee_projects (
    emp_id INT,
    project_id INT,
    hours_worked INT,
    PRIMARY KEY (emp_id, project_id)
);
INSERT INTO employee_projects VALUES
(101, 201, 120),
(103, 201, 150),
(106, 201, 100),
(101, 208, 80),
(103, 208, 140),
(102, 202, 110),
(104, 203, 130),
(109, 203, 160),
(105, 204, 100),
(107, 205, 90),
(109, 206, 120),
(110, 207, 140);
select emp_name , dept_name
	from employees 
		inner join departments
			on employees.dept_id = departments.dept_id;
select emp_name, salary,dept_name
	from employees 
		inner join  departments
        on employees.dept_id = departments.dept_id;
select * from employees
	inner join departments
    on employees.dept_id=departments.dept_id
    where departments.dept_name='IT';
select emp_name,city , location 
	from employees
    inner join departments
    on employees.dept_id=departments.dept_id;
select * from employees
	inner join departments
    on employees.dept_id=departments.dept_id
	where departments.location='Hyderabad';
-- LEFT JOIN
select *from employees
	left join departments
    on employees.dept_id=departments.dept_id;
select emp_name,dept_name 
	from employees
    left join departments
    on employees.dept_id=departments.dept_id;
select *from employees
	left join departments
    on employees.dept_id=departments.dept_id
    where departments.dept_name is null;
select *from departments
	left join employees
    on departments.dept_id=employees.dept_id;
select dept_name from departments
	left join employees
    on departments.dept_id=employees.dept_id
    where employees.dept_id is null;
-- RIGHT JOIN
 select *from departments
	right join employees
    on departments.dept_id=employees.dept_id;
select *from employees
	right join departments
    on departments.dept_id= employees.dept_id