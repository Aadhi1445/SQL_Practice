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
select e.emp_name, ep.project_id, p.project_name
	from employees e
	inner join employee_projects ep
    on e.emp_id=ep.emp_id
    inner join projects p
    on ep.project_id=p.project_id;
select e.emp_name,d.dept_name,p.project_name,ep.hours_worked
	from employees e
    inner join departments d
    on e.dept_id=d.dept_id
    inner join projects p
    on d.dept_id=p.dept_id
    inner join employee_projects ep
    on p.project_id = ep.project_id;
 select e.emp_name , p.project_name
	from employees e
	inner join employee_projects ep
    on e.emp_id=ep.emp_id
	inner join projects p
    on ep.project_id=p.project_id
    where project_name=(select project_name 	
		from projects
		where project_name like 'E-Commerce') ;
select e.emp_name , p.project_name
	from employees e
	inner join employee_projects ep
    on e.emp_id=ep.emp_id
	inner join projects p
    on ep.project_id=p.project_id
    where p.project_name='E-Commerce';
select e.emp_name,d.dept_id,d.dept_name
	from employees e
    inner join departments d
    on e.dept_id=d.dept_id
    inner join projects p
    on e.dept_id=p.dept_id
    where d.dept_name='IT';
-- — JOIN + WHERE
select e.emp_name,d.dept_name,e.salary
	from employees e
    inner join departments d
    on e.dept_id=d.dept_id
    where e.salary>60000;
select e.emp_name,d.dept_name,e.salary
	from employees e
    inner join departments d
    on e.dept_id=d.dept_id
    where d.dept_name='IT' and e.salary>50000;
-- — JOIN + GROUP BY
select d.dept_name, count(*) as dept_count
	from employees e
    inner join departments d
    on e.dept_id=d.dept_id
    group by d.dept_name;
select d.dept_name, sum(e.salary) as total_salary
	from employees e
    inner join departments d
    on e.dept_id=d.dept_id
    group by d.dept_name;
select d.dept_name, round(avg(e.salary),2) as avg_salary
	from employees e
    inner join departments d
    on e.dept_id=d.dept_id
    group by d.dept_name;
select d.dept_name,count(*) as dept_count
	from employees e
    inner join departments d
    on e.dept_id=d.dept_id
    group by d.dept_name
    having count(*)>1; 
-- select  dept_name,count(*) from departments
-- group by dept_name;
select d.dept_name,max(e.salary) as highest_salary
	from employees e
    inner join departments d
    on e.dept_id=d.dept_id
    group by d.dept_name;
    
-- — JOIN + GROUP BY + HAVING

select d.dept_name,avg(e.salary)
	from employees e
    inner join departments d
    on e.dept_id=d.dept_id
    group by d.dept_name
    having avg(e.salary)>55000;
select d.dept_name,count(*) as counttt
	from employees e
    inner join departments d
    on e.dept_id=d.dept_id
    group by d.dept_name
    having count(*)>2;
select p.project_name,sum(ep.hours_worked) as total_hours
	from projects p
    inner join employee_projects ep
    on p.project_id=ep.project_id
    group by p.project_name
    having sum(ep.hours_worked)>200;
    
-- — SELF JOIN
select e.emp_name as employee_name, m.emp_name as manager_name
	from employees e
     inner join employees m
    on m.manager_id=e.emp_id;
select e.emp_name as employees_name ,m.emp_name as manager_name
	from employees e
    inner join employees m
    on e.emp_id=m.manager_id;
select e.emp_name as employees_name 
	from employees e
    inner join employees m
    on e.emp_id=m.manager_id;
select e.emp_name as employee_name,m.emp_name  as manager_name,e.salary as employee_salary,m.salary as manager_salary
	from employees e
    inner join employees m
    on e.emp_id = m.manager_id;
select e.emp_name as employees_name
	from employees e
    inner join employees m
    on e.manager_id=m.emp_id
    where e.salary>m.salary;
select e.emp_name,p.project_name
	from employees as e
    inner join employee_projects as ep
    on e.emp_id=ep.emp_id
    inner join projects as p
    on ep.project_id=p.project_id;
select e.emp_name,count(*) as Project_count
	from employees as e
    inner join employee_projects as ep
    on e.emp_id=ep.emp_id
    group by e.emp_name;
select e.emp_name,count(*) as Project_count
	from employees as e
    inner join employee_projects as ep
    on e.emp_id=ep.emp_id
    group by ep.project_id;
select e.emp_name 
	from employees e
    inner join employee_projects as ep
    on e.emp_id=ep.emp_id
    inner join projects as p
    on ep.project_id=p.project_id
