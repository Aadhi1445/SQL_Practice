show databases;
create database Project; 
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

-- Count all employees.
select count(*) as count from employees;
-- Find the total salary paid to employees.
select sum(salary) as total_salary from employees;
-- Find the average salary.
select  avg(salary) from employees;
-- Find the highest salary.
select max(salary) as Maximum from employees;
-- Find the difference between the highest and lowest salaries.
select max(salary)-min(salary) as difference from employees;
-- Display the number of employees in each department.
select department,count(*) as total_count from employees group by department;
-- Display the total salary for each department.
select department,sum(salary) as total_count from employees group by department;
-- Display the average salary for each department.
select department,avg(salary) as total_count from employees group by department;
-- Display the highest salary in each department.
select department,max(salary) as total_count from employees group by department;
-- Display the number of employees in each city.
select city,count(*) as total_count from employees group by city;
-- Display departments whose average salary exceeds ₹40,000.
select department,avg(salary)
	from employees
    group by department
    having avg(salary)>=40000;
-- Display departments with more than three employees.
select department,count(*)  as count
	from employees
    group by department
    having count >3;
-- Display cities with at least two employees.
select city , count(*) as count 
	from employees
    group by city
    having count(*) >1;
-- Display departments whose total bonus exceeds ₹10,000.
select department,sum(bonus) as bonus
from employees
group by department
having bonus >2000;
-- Find departments where the highest salary exceeds ₹60,000.
select department,max(salary) as highest_salary
from employees
group by department
having highest_salary>60000;
-- Count employees earning more than ₹50,000.
select 
	count(
		case 
			when salary>50000 then 1
		end) as hhh from employees;
-- Count employees earning less than ₹30,000.
select 
	count(
		case 
			when salary<30000 then 1
		end) as hhh from employees;
-- Calculate the total salary of employees working in IT using conditional aggregation.
select sum(
			case
            when department='it' then salary
            else 0 end)  as sum from employees;
-- select sum(salary) as total_salary
-- from employees
-- where department='it';
-- Count employees from Hyderabad using conditional aggregation.
select count(
			case when  city='hyderabad' then 1
            end ) as count from employees;
-- Count employees earning more than ₹40,000 and those earning ₹40,000 or less in separate columns
select count(
			case when salary >40000 then 1 end ) as highest, 
	   count(case when salary <=40000 then 1 end) as lowest from employees;
-- Find the second-highest distinct salary in the employees table.
select distinct(salary) from employees
order by salary desc
limit 1
offset 1;
-- Display departments whose average salary is greater than the company's overall average salary.
select department , avg(salary) as avgr
from employees
group by department
having avgr>(select avg(salary ) from employees);
-- Display departments having more than two employees and an average salary above ₹40,000.
select department from employees
group by department
having count(*) >2 and avg(salary) >40000;
-- Display each department and count how many employees in that department earn more than ₹40,000.
select department, count(
						case 
							when salary >40000 then 1 end) as countt 
                            from employees 
                            group by department;
-- Find the total salary for each department, considering only employees whose salary exceeds ₹30,000. Display only departments whose resulting total salary exceeds ₹100,000.
select department, sum(salary) as total from employees 
where salary >30000
group by department
having total >100000;