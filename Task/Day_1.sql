show databases;
-- create database Project; 
use  Project;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    age INT,
    department VARCHAR(30),
    salary DECIMAL(10,2),
    city VARCHAR(30)
);
INSERT INTO employees
(emp_id, emp_name, age, department, salary, city)
VALUES
(1, 'Rahul', 25, 'IT', 45000, 'Hyderabad'),
(2, 'Priya', 24, 'HR', 35000, 'Chennai'),
(3, 'Arjun', 28, 'IT', 60000, 'Hyderabad'),
(4, 'Sneha', 26, 'Sales', 40000, 'Bangalore'),
(5, 'Kiran', 30, 'HR', 50000, 'Chennai'),
(6, 'Anjali', 23, 'IT', 30000, 'Pune'),
(7, 'Vijay', 27, 'Finance', 55000, 'Hyderabad'),
(8, 'Divya', 24, 'Sales', 42000, 'Pune'),
(9, 'Ravi', 29, 'Finance', 65000, 'Chennai'),
(10, 'Meena', 25, 'IT', 38000, 'Bangalore');
select *from employees;
show tables;
-- Level 1: Basic — Questions 1–10
-- Q1. Display all employee records.
select *from employees;
-- Q2. Display only employee names.
select emp_name from employees;
-- Q3. Display employee names and their departments.
select emp_name,department from employees;
-- Q4. Find employees whose age is greater than 25.
select *from employees where age >25;
-- Q5. Find employees whose salary is less than ₹40,000.
select *from employees where salary <40000;
-- Q6. Find employees working in the Finance department.
select *from employees where department='Finance';
-- Q7. Find employees who live in Hyderabad.
select *from employees where city like 'hyderabad';
-- Q8. Display employees who do not work in the HR department.
select *from employees where department not like 'Hr';
-- Q9. Display all unique department names.
select distinct department from employees;
-- Q10. Display only the first five employee records.
select *from employees limit 5;
-- Q11. Find employees whose salary is greater than ₹40,000 and who work in IT.
select *from employees
where salary>40000
and department='HR';
-- Q12. Find employees working in either HR or Finance.
select *from employees
where department in ('HR','Finance');
-- Q13. Find employees whose age is less than or equal to 25.
select *from employees
where age <=25;
-- Q14. Find employees who live in Chennai and earn more than ₹40,000.
select *from employees 
where city ='chennai' and salary >40000;
-- Q15. Display employees sorted by salary from highest to lowest.
select *from employees 
order by salary desc;
-- Q16. Display employees sorted by age from lowest to highest.
select *from employees 
order by salary;
-- Q17. Find the highest-paid employee.
select *from employees
order by salary desc
limit 1;
-- Q18. Find the lowest-paid employee.
select *from employees 
order by salary 
limit 1;
-- Q19. Display the three highest-paid employees.
select *from employees
order by salary desc 
limit 3;
-- Q20. Display the three lowest-paid employees.
select *from employees
order by salary  
limit 3;
-- Q21. Find employees who work in IT and earn at least ₹40,000.
select * from employees
where department ='It'
and salary >=40000;
-- Q22. Find employees who work in either IT or Sales and earn more than ₹40,000.
select *from employees
where department in ('it','Sales') and 
salary >40000;
-- Q23. Display unique city names in alphabetical order.
select distinct city from employees
order by city;
-- Q24. Display employees whose names start with the letter A.
select *from employees
where emp_name like 'a%';
-- Q25. Display employees whose names end with the letter a.
select *from employees
where emp_name like '%a';
-- Q26. Find employees whose salaries are between ₹40,000 and ₹60,000, inclusive.
select *from employees
where salary between 40000 and 60000;
-- Q27. Display the employee with the second-highest salary.
select *from employees 
order by salary desc
limit 1
offset 1;
-- Q28. Find the two employees with the lowest salaries.
select *from employees
order by salary 
limit 2;
-- Q29. Display employees who are not from Hyderabad and whose salary exceeds ₹40,000.
select *from employees
where city!='hyderabad' and salary >40000;
-- Q30. Display employees in descending salary order, but skip the first two employees and return the next three.
select*from employees
order by salary desc
limit 3 offset 2;
 -- Q31. Display employee names and salaries for employees working in IT or Finance, sorted by salary in descending order.
select emp_name, salary 
from employees
where department in ('finance','it') 
order by salary desc;
-- Q32. Display unique combinations of departments and cities, sorted first by department and then by city.
select department,city
from employees
order by department ,city;