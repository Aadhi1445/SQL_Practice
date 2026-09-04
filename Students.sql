show databases;
use college;
show tables like 'students';
select*from students;
select *from students where marks > any (select marks from students where branch ='ece');
select* from students where marks < any(select marks from students where branch='ece');
select*from students where marks= any (select marks from students where branch='eee');
select*from students where marks > any (select marks from students where location = 'hyd');
select*from students where date_of_joining > any (select date_of_joining  from students where branch = 'ece');
select*from students where marks>70;
select*from students where marks<40;
select *from students where marks=80;
select *from students where name like 'a%';
select*from students where name like '%n';
select*from students where name like '%a%';
select count(*) from students;
select sum(marks) from students;
select avg(marks) from students;
select floor(avg(marks)) from students;  
select max(marks) from students;
select min(marks) from students;
select branch, count(*) from students where branch='cse';
select branch , avg(marks) from students where branch='cse';
select  max(marks) from students where branch ='eee';
select min(marks) from students where branch ='mec';
select sum(marks) from students where branch ='cse';
select count(*) from students where marks>60;
select avg(marks) from students where location ='hyd';
select branch , count(*) from students group by branch;
select branch , avg(marks) from students group by branch;
select branch, max(marks) from students group by branch;
select branch , min(marks) from students group by branch;
select branch , sum(marks) from students group by branch;
select location , count(*) from students group by location;
select location , avg(marks) from students group by location ;
select gender, count(*) from students group by gender;
select  branch,gender,count(*) from students group by branch, gender;
select branch,gender, avg(marks) from students group by branch,gender;
select branch, max(marks) from students group by branch;
select location, min(marks) from students group by location;
select branch , count(*) from students group by branch having count(*)>2;
select branch , avg(marks) from students group by branch having avg(marks)>70;
select branch, max(marks) from students group by branch having max(marks)>90;
select branch, min(marks) from students group by branch having min(marks)>40;
select branch , sum(marks) from students group by branch having sum(marks)>200;
select location , count(*) from students group by location having count(*) >2;
select gender, avg(marks) from students group by gender having avg(marks)>60;
select branch, avg(marks) from students group by branch having avg(marks) between 60 and 80;
select branch, count(*) from students group by branch having count(*)>2;
select gender , avg(marks) from students group by gender having avg(marks)>60;
select branch , avg(marks) from students group by branch having avg(marks) between 60 and 80;
select branch ,count(*) from students group by branch having count(*) >3;
select branch, min(marks) from students group by branch having min(marks)<40;
select  branch , avg(marks) from students where marks>50  group by branch;
select branch , count(*) from students where marks>50 group by branch;
select *from students order by marks;
select *from  students order by name;
select *from students order by branch;
select *from students order by marks desc, name ;
select *from students order by marks desc limit 1 offset 1;
select max(marks)
from students
where marks<(
select max(marks)
from students
);
select *,case
when marks>90 then 'excellent' when marks>80 then 'v.good'
when  marks>70 then 'good' when marks>60 then 'better' when marks>50 then 'ok'
when marks>40 then 'improve' else 'improve weell' end as performance
from students;
select *,case when marks>=40 then 'pass' else  'fail' end as grade from students;
select *, case when marks >90 then 'a' when marks between 75 and 89 then 'V.good' when marks between 60 and 74 then 'good'
when marks<60 then 'Average' end as grade from students;
select name, marks, case when marks >=90 then ' A' when marks between 80 and 89 then 'B' when marks between 70 and 79 then 'C' 
when marks between 60 and 69 then 'D' when marks<60 then 'F' end as grade from students;
select *, case  branch when 'cse' then ' C_s_e' when 'eee' then 'e_e_e' when 'ece' then 'e_c_e' when 'mec' then 'm_e_c'
when 'it' then 'i_t' end as abb from students; 
select *, case gender when 'm' then 'male' when 'f' then 'female' end as abb from students;
select *, case when marks>=80 then 'High performer' when marks>=60 then 'Avergaa performer' when marks <60 then 'low performerance' end as performance from students;
select sum( case when  marks>=40 then 1 else 0 end ) as passed ,
 sum(case when marks<40 then 1 else 0 end ) as failed  from students;
 select*from students;
 select name , marks+5 as new_marks from students;
 select name, marks-10 as reduced_marks from students;
 select name, marks*2 as double_marks from students;
 select name , floor(marks/2) as half_marks from students;
 select name, marks%2 as remainder from students;
 select * from students where marks+10 >100;
 select *from students where marks-5<50;
 select*from students where marks*2>150;
 select *from students where marks/2 >30;
 select*from students where marks%2=0;
 select name, marks, case when marks >=60 then 'good' else 'need Improvement' end as final_marks from students where marks+5;
 select name,marks, round(marks*(10/100),2)as bonus from students;
 update students set marks=marks+marks*(10/100) where marks;
 select name,marks from students;
select *from students where marks%5=0;
select name,marks, marks+10 as marks_after_bonus,marks-10 as marks_after_penalty from students;
select * from  students where  marks+20>100;
select*from students where marks-20>50;
select name,marks*10+5 from students;
select name, marks, case when marks+5>=40 then 'pass' else 'fail' end  as result from students;
select*from students;
select count(*) from students;
select sum(marks) from students;
select avg(marks) from students;
select max(marks) from students;
select min(marks) from students;
select count(*) from students where marks>70;
select sum(marks) from students where branch='cse';
select avg(marks) from students where branch='ece';
select max(marks) from students where branch='eee';
select count(*) from students where gender='f';
select branch,count(*)  from students  group by branch;
select branch , avg(marks) from students group by  branch;
select branch, sum(marks) from students group by branch;
select branch, max(marks) from students group by branch;
select branch , min(marks) from students group by branch;
select branch, avg(marks) from students where marks>50 group by branch;
select branch, count(*) from students where marks >=40 group by branch;
select  location, sum(marks) from students group by location;
select location, count(*) from students group by location;
select branch , avg(marks) from students where gender='m' group by branch;
select branch, count(*) from students where gender='f' group by branch;
select branch, count(*) from students group by branch having count(*) >2; 
select branch, avg(marks) from students group by branch having avg(marks) >70;
select branch, sum(marks) from students group by branch having sum(marks) >150;
select branch, max(marks) from students group by branch having max(marks) >100;
select branch, avg(marks),count(*) from students  group by branch having count(*)>=2 and avg(marks)>60; 
select sum(case when marks>=40 then 1 else 0 end)as passed_students from students ;
select sum(case when marks>=40 then 1 else 0 end) as passed_students, sum(case when marks<40 then 1 else 0 end) as failed_students from students;
select branch, count( *),sum(case when marks>=40 then 1 else 0 end) as passed , sum(case when marks<40 then 1 else 0 end) as failed from students group by branch;
select branch ,avg(marks) from students group by branch  order by avg(marks) desc  limit 1;
select * from students where marks>(select avg(marks) from students);
select branch,count(*), avg(marks), max(marks) from students group by branch having count(*)>=2 and avg(marks)>60 and max(marks)>90;
select branch, max(marks)-min(marks) from students group by branch having max(marks)-min(marks)>50;
select branch, avg(marks) from students  group by  branch having min(marks)<40 and avg(marks)>60;
select branch from students group by branch having min(marks)>40;
select branch  
from students
group by branch
having max(marks)>100;
select *, dense_rank() over(order by marks desc)from  students;
select * from (select *, dense_rank() over(order by marks desc ) as dr from students ) as t where dr=1;