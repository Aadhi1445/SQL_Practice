show databases;
create database Project; 
use  Project;
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
select *from employees;
-- Q1. Display all employees in ascending order of salary.
select *from employees order by salary ;
-- Q2. Display all employees in descending order of salary.
select *from employees order by salary desc;
-- Q3. Display employees from youngest to oldest.
select *from employees order by age ;
-- Q4. Sort employees by department in ascending order.
select *from employees order by department;
-- Q5. Sort employees by department in ascending order and salary in descending order within each department.
select *from employees order by department ,salary desc;
-- 🟢 Part B: LIMIT and OFFSET

-- Q6. Display the top 3 highest-paid employees.
select *from employees
order by salary desc
limit 3;
-- Q7. Display the 5 employees with the lowest salaries.
select *from employees 
order by salary 
limit 5;
-- Q8. Find the employee with the highest salary.
select *from employees 
order by salary desc
limit 1;
-- Q9. Find the employee with the second-highest distinct salary.
select *  from employees
where salary = (select distinct(salary)
					from employees 
                    order by salary desc
                    limit 1
                    offset 1);
-- Q10. Display the third-highest distinct salary.
select *  from employees
where salary = (select distinct(salary)
					from employees 
                    order by salary desc
                    limit 1
                    offset 2);
-- Q11. Display the next 3 employees after skipping the first 2 employees when sorted by salary in descending order.
select *from employees
order by salary desc
limit 3
offset 2;
-- Q12. Display employee names as Employee_Name and salaries as Monthly_Salary.
select emp_name  as Employee_Name , salary as Mothly_Salary from employees;
-- Q13. Display employee names and calculate their annual salary, assuming the monthly salary remains constant for 12 months. Name the calculated column Annual_Salary.
select emp_name , (salary*12) as Annaual_Salary from employees;
-- Q14. Display employee names and their total compensation, calculated as salary plus bonus. Name the calculated column Total_Compensation.
select emp_name,  salary, bonus ,(salary + bonus ) as Total_Compensation from employees;
-- 🟡 Part D: LIKE Operator
-- Q15. Find employees whose names start with A.
select * from employees 
	where emp_name like 'a%';
-- Q16. Find employees whose names end with a.
select * from employees 
	where emp_name like '%a';
-- Q17. Find employees whose names contain the letter a.
select * from employees 
	where emp_name like '%a%';
-- Q18. Find employees whose names have exactly 5 characters.
select * from employees 
	where emp_name like '_____';
-- Q19. Find employees whose names have a as the second character.
select * from employees 
	where emp_name like '_a%';
-- Q20. Find employees whose salaries are between ₹30,000 and ₹50,000.
select *from employees 
	where salary between 30000 and 50000;
-- Q21. Find employees whose ages are between 22 and 28.
select *from employees 
	where age between 22 and 28;
-- Q22. Find employees who belong to either the IT or HR department.
select *from employees 
	where department  in ('it','hr');
-- Q23. Find employees who live in Hyderabad, Chennai, or Mumbai.
select *from employees 
	where city  in ('hyderabad','mumbai','chennai');
-- Q24. Find employees whose salaries are not between ₹20,000 and ₹40,000.
select *from employees 
	where salary  not between 20000 and 40000;
-- Q25. Find the second-highest distinct salary without using a subquery.
select distinct(salary) from employees
	order by salary desc
    limit 1
    offset 1;
-- Q26. Find the employee who receives the second-highest bonus.
select emp_name from employees
	order  by bonus desc
    limit 1
    offset 1;
-- Q27. Display the top 3 highest-paid employees, but show only their names and salaries.
select emp_name, salary from employees 
	order by salary desc
    limit 3;
-- Q28. Find employees whose names contain exactly two occurrences of the letter a.
select *from employees
	where emp_name like '%a%a%' and emp_name not like '%a%a%a%';
-- Q29. Find employees who are not from Hyderabad and whose salary exceeds ₹40,000.
select *from employees
	where city <> 'Hyderabad' and salary >=40000;
-- Q30. Display the top 3 highest-paid employees from the IT department.
select *from employees 
	where department='it'
    order by salary desc
    limit 3; 