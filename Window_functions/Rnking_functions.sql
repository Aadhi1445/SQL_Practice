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
select *,row_number() over(order by salary desc) 
	from company_employee;
select *, rank() over(order by salary desc) 
	from company_employee;
select*, dense_rank() over(order by salary desc) 
	from company_employee;
select *, rank() over(order by salary desc) as rank1,
		dense_rank() over( order by salary desc) as rank2,
        row_number() over(order by salary desc) as rank3
        from company_employee;
select * from 
			(select *, dense_rank() over(order by salary desc) as Highest_rank 
				from company_employee) t  
				where Highest_rank=1;
select * from 
			(select *, rank() over(order by salary desc) as 2nd_Highest_rank 
				from company_employee) t  
				where 2nd_Highest_rank=2;
select * from 
			(select *, dense_rank() over(order by salary desc) as Third_Highest_rank 
				from company_employee) t  
				where Third_Highest_rank=3;
                
                
-- Ranking Within Departments
select emp_name, department,salary,rank() over( partition by department order by salary desc) as rank1 
	from company_employee;
select *, row_number() 
	over(partition by department order by salary desc) as rank1
    from company_employee;
select *, dense_rank() 
	over(partition by department order by salary desc) as rank1
    from company_employee;
select * from (select*, dense_rank()
	over(partition by department order by salary desc) as rank1
    from company_employee)t
    where rank1=1;
select * from (select*, dense_rank()
	over(partition by department order by salary desc) as rank1
    from company_employee)t
    where rank1=2;
select * from (select*, dense_rank()
	over(partition by department order by salary ) as rank1
    from company_employee)t
    where rank1=1;
select * from 
	(select *, row_number() 
		over(partition by department order by salary desc ) as rank1
        from company_employee)t
        where rank1<=2;
select  distinct salary,department, dr 
	from 
	(select salary,department,dense_rank() 
    over(partition by department order by salary desc) as dr
    from company_employee) t
    where dr<=2;
    
    
-- Understand Ties
select*, row_number() over(order by salary desc) as rn
		from company_employee 
        where department='it';
select *, rank() over(order by salary desc ) as rk
		from company_employee
        where department='it';
select *, dense_rank() over( order by salary desc) as dr
		from company_employee
        where department='it';
select * 
	from company_employee
    where salary in
    (select salary 
		from company_employee
        group by salary 
        having count(*)>1);
-- Ranking + Subquery
 select * from
	(select *,
		rank() over ( order by salary desc) as rk
		from company_employee) t
	where rk=1;
select * from
	(select *,
		rank() over ( order by salary desc) as rk
		from company_employee) t
	where rk=2;
select * from
	(select *,
		rank() over ( order by salary desc) as rk
		from company_employee) t
	where rk=3;
select *,
		rank() over ( order by salary desc) as rk
		from company_employee;
select * from 
	( select *, rank() over( partition by department order by salary desc) as rk
			from company_employee) t
		where rk=1;
select * from 
	( select *, rank() over( partition by department order by salary desc) as rk
			from company_employee) t
		where rk=2;
            
select * from 
	( select *, dense_rank() over( partition by department order by salary desc) as rk
			from company_employee) t
		where rk<=2;
-- Advanced Department Questions
-- select department,emp_name,salary from company_employee
-- 	where salary in (select max(salary) 
-- 	from company_employee
--     group by department);
SELECT department, emp_name, salary
FROM (
    SELECT department,
           emp_name,
           salary,
           RANK() OVER (
               PARTITION BY department
               ORDER BY salary DESC
           ) AS r
    FROM company_employee
) t
WHERE r = 1;
SELECT department, emp_name, salary
FROM (
    SELECT department,
           emp_name,
           salary,
           RANK() OVER (
               PARTITION BY department
               ORDER BY salary DESC
           ) AS r
    FROM company_employee
) t
WHERE r = 2;
select department,max(salary)-min(salary) as difference 
	from company_employee
    group by department;
select emp_name, department, salary, 
	dense_rank() 
    over(partition by department order by salary desc)
    as department_rank
    from company_employee;
select emp_name,salary,
	dense_rank() OVER(ORDER BY SALARY) AS COMPANY_RANK,
    dense_rank() over(partition by department order by salary desc) as department_rank
    from company_employee;
-- Multiple Window Functions
select emp_name,department,salary,
	row_number()over(order by salary desc) as row_num,
    rank() over(order by salary desc) as r,
    dense_rank() over (order by salary  desc) as dr
    from company_employee;
select  department,max(salary),avg(salary) from company_employee group by department;

SELECT department,
       emp_name AS name,
       salary,
       avg_salary
FROM (
    SELECT department,
           emp_name,
           salary,
           AVG(salary) OVER (
               PARTITION BY department
           ) AS avg_salary,
           DENSE_RANK() OVER (
               PARTITION BY department
               ORDER BY salary DESC
           ) AS department_rank
    FROM company_employee
) t
WHERE department_rank = 1;