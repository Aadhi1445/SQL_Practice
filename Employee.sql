show databases;
use college;
create table employee (id int,name varchar(50),age int, location varchar(30),dept varchar(30));
select*from employee; 
insert into employee values  (1,'Aditya',22,'rjy','it');
insert into employee values (2,'satwik',21,'sklm','mec'),
(2,'sai',19,'vizag','cse'),(4,'hemanth',23,'sklm','aiml'),
(5,'shiva',20,'sklm','cse');
alter table employee add column salary int; 
alter table employee rename column dept to department;
update employee
set salary=54000 where id=1;
update employee 
set salary= case id 
when  2 then 40000
when 3 then 30000
when 4 then 25000
when 5 then 59000
end;
select *from employee;
select name , salary from employee;
select name ,age,department from employee;
select * from employee where location='sklm';
select name from employee where department='cse';
select name,salary from employee where salary>40000;
select *from employee where age=22;
select * from employee where salary=40000;
select name,location from employee;
select distinct department from employee;
select * from employee where age >20;
select *from employee where age<21;
select *from employee where salary>50000;
select * from employee where salary <=40000;
select * from employee where age!=22;
select * from employee where department<>'cse';
select *from employee where location <>'sklm';
select *from employee where age between 20 and 22;
select *from employee where location='sklm' and department='cse';
select*from employee where location in ('sklm','vizag');
select *from employee where salary between 30000 and 60000;
select *from employee where salary >30000 and department<>'cse';
select *from employee where department in ('cse','mec');
select * from employee where salary between 30000 and 50000;
select * from employee where age  between 19 and 21;
select *from employee where department in ('cse','mec','it');
select *from employee where location  in ('sklm','rjy');
select *from employee where salary not between 30000 and 50000;
select * from employee where department not in ('cse','it');
select *from employee where name like 's%';
select *from employee where name like '%a';
select * from employee where name like  '%a%';
select *from employee where name like '%a%';
select *from employee where location like 's%';
select *from employee where department like '%e';
select *from employee where name like '_____';
select *from employee where name like '____';
select *from employee where name like 's%i%';
select *from employee  order by salary;
select *from employee order by salary desc;
select * from employee order by age;
select *from employee order by age desc;
select *from employee order by name;
select *from employee order  by name desc;
select *from employee order by department;
select *from employee order by salary desc,name ;
select * from employee order by salary desc limit 1;
select *from employee order by salary limit 1;
select *from employee order by salary limit 2;
select*from employee order by age desc limit 3;
select *from employee order by age limit 1;
-- select *, count(*) from employee ;
select count(*) as Total_number from employee;
select sum(salary) as total_salary from employee;
select avg(salary) as avg_salary from employee;
select floor(avg(salary)) as g1 from employee;
select round(avg(salary),2) from employee; 
select max(salary) from employee;
select min(salary) from employee;
select max(age) from employee;
select min(age) from employee;
select max(name) from employee;
select count(*) from employee where salary >40000;
select sum(salary) from employee where location ='sklm';
select department, count(*) from employee group by department;
select department , avg(salary) from employee group by department;
select department , max(salary) from employee group by department;
select department , min(salary) from employee group by department;
-- select department , sum(name) from employee group by department;
select department , sum(salary) from employee group by department;
-- select count(*) from employee group by location;
select location, count(*) from employee group by location;
select department, sum(salary) from employee group by department order by sum(salary) desc;
select department, count(*) from employee group by department having count(*)>1;
select department , round(avg(salary)) from employee group by department having avg(salary) >40000;
select department , max(salary) from employee group by department having max(salary) >50000;
select department , min(salary) from employee group by department having min(salary) <30000;
select location, count(*) from employee group by location having count(*) >1;
select department , sum(salary) from employee group by department having sum(salary) >50000;
select location , avg(salary) from employee group by location having avg(salary) >40000;
select name, salary, case  when salary >=50000 then 'High'
when salary>=30000 then  'medium' 
else 'low' 
end as compare from employee;
select*from employee;
select name, age,
case  
when age>=22 then 'Senior'
when age<22 then 'Junior'
end as age_category from employee;
select count(case 
when salary>=40000 then 1
when salary<40000 then 0 
end) as gp, count(case 
when salary >=40000 then 0 
when salary <40000 then 1
end) as lp from employee;
select name, salary,case 
when salary>=40000 then 'High'
when salary<40000 then 'Low'
end as Category  from employee;
select * , case 
when department='it' then salary+floor(salary*20/100)
when department ='cse' then salary+floor(salary*10/100)
when department = 'mec' then salary+floor(salary*15/100)
when department= 'aiml' then salary+floor(salary*25/100)
end
as result from employee;
update employee 
set salary=60000 where name='Aditya';
update employee
set salary=salary+5000 where name = 'shiva';
update employee
set salary= salary+floor(salary*10/100) where department= 'cse';
update employee set location = 'hyd' where name='hemanth';
update employee set salary=35000 where salary<30000;
update employee
set salary= case id
when 1 then 60000
when 2 then 45000
when 3 then 30000
when 4 then 65000
end;
update employee 
set salary = case department
when 'it' then salary=salary+floor(salary*20/100)
when  'cse' then salary=salary+floor(salary*10/100)
when 'mec' then salary=salary+floor(salary*15/100)
when 'aiml' then salary=salary+floor(salary*25/100)
end;
update employee
set salary=45000
where id=5;
select avg(salary) from employee;
select *from employee;
select * from employee where salary> (select avg(salary) from employee);
select*from employee where salary=(select max(salary) from employee);
select *from employee where department=(select department from employee where name='sai');
select*from employee where department=
(select department  from employee 
group by department order by avg(salary) desc limit 1);
select *from employee order by salary desc limit 1 offset 1;
select *from employee where salary> (select salary from employee where name like 'shiva');
select *from employee where age > (select age from employee where name='Aditya');
-- select *from employee where age> (Select age from employee where name is 'Aditya');
 -- ANY
select *from employee where salary > any(select salary from employee where department ='cse');
select *from employee where salary> all(select salary from employee where department='cse');
select *from employee where age < any(select age from employee where location ='sklm');
select *from employee where salary > all(select  salary from employee where department='mec');
select*from employee where salary =any(select salary from employee where department='cse');
select *from employee where location in ('sklm','rjy') order by  salary desc;

select*from employee where name like 's%' and salary>40000;
select *from employee where name like '%a%' and department <>'cse';
select department ,sum(salary)as Total_salary from employee group by department;
select department , round(avg(salary),2) as avg from employee group by department having avg(salary) >40000;
select location , count(*) as g from employee group by location having g>1;
-- we can use as with aggregate functions temporary names
select department , max(salary) from employee group by department order by max(salary) desc limit 1;
select department , min(salary) from employee group by department order by min(salary) limit 1;
select name, salary, case 
when salary>=50000 then 'Hig'
when salary>=30000 then 'Med'
else 'low'
end as category from employee;
select  name, department, salary, case department
when 'it' then salary+(salary*(20/100))
when 'cse' then salary+(salary*(10/100))
when 'mec' then salary+(salary*(15/100))
when 'aiml' then salary+(salary*(25/100))
end as gggg from employee; 
select *from (select  name , department, salary,case department
when 'it' then salary+(salary*(20/100))
when 'cse' then salary+(salary*(10/100))
when 'mec' then salary+(salary*(15/100))
when 'aiml' then salary+(salary*(25/100))
end as gggg from employee) as e where gggg>40000;
select sum((case 
	when salary>=40000 then 1 
    else 0
    end)) as max 
    ,sum((case when salary<40000 then 1 else 0 end)) as min from employee;
select*from employee;
select *from employee where salary>(select avg(salary) from employee);
select *from employee where department=(select department from employee where name like 'sai');
select *from employee where department=(select department  from employee group by department order by avg(salary) desc limit 1);
select name, department, salary from employee where salary in (select max(salary) from employee group by department);