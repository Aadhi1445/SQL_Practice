show databases;
use college;
show tables like 'company_employee';
create table company_employee(
	emp_id int,
    emp_name varchar(50),
    department varchar(30),
    city varchar(30),
    age int,
    salary int
    );
select * from company_employee;
INSERT INTO company_employee
(emp_id, emp_name, department, city, age, salary)
VALUES
(101, 'Rahul', 'IT', 'Hyderabad', 24, 55000),
(102, 'Priya', 'HR', 'Chennai', 26, 45000),
(103, 'Arjun', 'IT', 'Bangalore', 25, 70000),
(104, 'Sneha', 'Finance', 'Hyderabad', 28, 60000),
(105, 'Kiran', 'IT', 'Chennai', 23, 70000),
(106, 'Meena', 'HR', 'Bangalore', 27, 50000),
(107, 'Ravi', 'Finance', 'Chennai', 29, 75000),
(108, 'Anjali', 'IT', 'Hyderabad', 22, 45000),
(109, 'Vikram', 'Finance', 'Bangalore', 31, 60000),
(110, 'Divya', 'HR', 'Hyderabad', 24, 45000),
(111, 'Suresh', 'Sales', 'Chennai', 30, 55000),
(112, 'Pooja', 'Sales', 'Hyderabad', 25, 65000),
(113, 'Manoj', 'Sales', 'Bangalore', 27, 65000),
(114, 'Neha', 'Finance', 'Hyderabad', 26, 50000),
(115, 'Amit', 'HR', 'Chennai', 23, 50000);
drop table  company_employee;
-- count
select count(*) from company_employee;
select count(*) from company_employee where department='IT';
-- sum
select sum(salary) from company_employee;
-- avg
select avg(salary) from company_employee;
-- select*,avg(salary) from company_employee; 
-- max
select max(salary) from company_employee;
-- min
select min(salary) from company_employee;
-- count+where
select count(*) from company_employee where salary>50000;
-- sum+where
select sum(salary) from company_employee where department='Finance';
-- avg + Where
select avg(salary) from company_employee
	where department='IT';
-- Max+Where
select max(salary) from company_employee 
	 where department='HR';
     
     
-- GROUP BY
select department, count(*) from company_employee 
	group by department;
select  department,sum(salary) as Total_Salalry from company_employee
	group by department;
select department, avg(salary) as Average_Salary from company_employee
	group by department;
select department, max(salary)  as Highest_salary from company_employee
	group by department;
select department, min(salary) as Lowest_salary from company_employee
	group by department;
select city, count(*) as NO_OF_employees from company_employee
	group by city;
select  city, sum(salary) as total_salary from company_employee
	group by city;
select city, avg(salary) as Average_salary from company_employee
	 group by city;
-- GROUP BY + WHERE
select  department, avg(salary) as Average_salary  from company_employee 
    where salary>45000
    group by department;
select department, sum(salary) as Total_salary from company_employee
	where age>25
    group by department;
select department, count(*) as No_of_employees from company_employee
	where salary>=50000
    group by department;
select department, max(salary) as Highest_salary from company_employee
	where city='Hyderabad'
    group by department;
select city, avg(salary) as average_salary from company_employee
	where age>=25
    group by city;
    
    
-- HAVING
select department , count(*) as No_of_employees  from company_employee
	group by department
    having count(*)>=3;
select department, avg(salary) as Average_salary from company_employee
	group by department
    having average_salary>55000;
select department, sum(salary) as Total_salary from company_employee
	group by department
    having sum(salary) >200000;
select city from company_employee
	group by city
    having count(*)>=3;
select department from company_employee
	group by department
    having max(salary)>70000;
select department from company_employee
	group by department
    having min(salary)<=45000;
    
    
-- GROUP BY + HAVING + Multiple Aggregates
select department, count(*) as Employee_count,sum(salary) as Total_salary ,avg(salary) as Average_salary 
	from company_employee
    group by department;
select department, 
	max(salary) as Highest_salary ,
    min(salary) as Lowest_salary,
    max(salary)-min(salary) as salary_difference
    from company_employee
    group by department;
select department from company_employee
	group by department
    having count(*)>3 and
    avg(salary)>50000;
select department, sum(salary) as Total_salary , max(salary) as Highest_salary from company_employee
	group by department
    having total_salary>200000 and
    Highest_salary>=70000;
select city, count(*) as number_of_employees, 
	sum(salary) as total_salary,
    avg(salary) as average_salary,
    max(salary) as highest_salary,
    min(salary) as lowest_salary from company_employee
    group by city;


-- DISTINCT + Aggregate Functions
select distinct department from company_employee;
select count(distinct department) from company_employee;
select count(distinct city) as no_of_cities from company_employee;
select count(distinct salary) as salary_values from company_employee;
select department, sum(salary) as total_salary from company_employee
	group by department;
    
    
-- Subquery + Aggregate Functions
select * from company_employee
	where salary>(select avg(salary) from company_employee);
select * from company_employee 
	where salary=(select max(salary) from company_employee);
select * from company_employee
	where salary< (select avg(salary) from company_employee);
select department from company_employee
	group by department
    order by avg(salary) desc limit 1;
SELECT department, avg_salary
	FROM (
		SELECT department,
			   avg_salary,
			   DENSE_RANK() OVER (ORDER BY avg_salary) AS r
		FROM (
			SELECT department, AVG(salary) AS avg_salary
			FROM company_employee
			GROUP BY department
		) t
	) x
	WHERE r = 1;
SELECT department, avg_salary
	FROM (
		SELECT department,
			   avg_salary,
			   DENSE_RANK() OVER (ORDER BY avg_salary desc) AS r
		FROM (
			SELECT department, AVG(salary) AS avg_salary
			FROM company_employee
			GROUP BY department
		) t
	) x
	WHERE r = 2;
select department , sum(salary) as total_salary 
	from company_employee
    group by department
    order by total_salary desc limit 1;
-- Advanced Aggregate Practice
-- Find the average salary of each department, and display only departments whose average salary is greater than the company-wide average salary.
select department, avg(salary)
	from company_employee
    group by department
    having avg(salary)>(select avg(salary) 
	from company_employee);
-- Find departments where the highest salary is greater than the overall average salary.
select department, max(salary)
	from company_employee
    group by department
    having max(salary) >
		(select avg(salary)
			from company_employee);
-- Find departments where the total salary is greater than the average department total salary.
SELECT department, SUM(salary) AS total_salary
FROM company_employee
GROUP BY department
HAVING SUM(salary) > (
    SELECT AVG(total_salary)
    FROM (
        SELECT department, SUM(salary) AS total_salary
        FROM company_employee
        GROUP BY department
    ) t
);
-- Find the city having the highest average salary.
select city,avg(salary) 
	from company_employee 
    group by city 
    order by avg(salary)  desc limit 1;
select city,sum(salary) 
	from company_employee 
    group by city 
    order by sum(salary)  desc limit 1;
-- Find the department with the largest difference between highest and lowest salary.
select department, max(salary)-min(salary) as difference 
	from company_employee 
    group by department
    order by difference desc limit 1;
--  Find the department with the most employees.
select department, count(*) as employees 
	from company_employee
	group by department
    order by employees desc limit 1;