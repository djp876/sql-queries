Simple queries:
1.	Write a query to retrieve the names of all instructors.

select name
from instructoru;
2.	Write a query to retrieve the department names of all instructors

select name,dep_name
from instructoru;
3.	Write a query to retrieve the unique department names of all instructors.

select distinct dept_name
from instructoru;
4.	Write a query to show resulting salaries if each instructor is given a 10 percent raise

select name,salary+(salary*0.1)"10%rasie in sal"
from instructoru;
5.	Write a query to retrieve the names of all instructors in the Computer Science department who have salary more than $70,000.

select name
from instructoru
where dep_name='com.sci'
and salary>70000;
Queries on multiple relations:

1.	Write a query to retrieve the name of all instructors along with their department names and department building name.

select i.anem,i.dep_name,d.building
from instructoru i,deptu d
where i.dept_name=d.dept_name
order by i.id;
2.	Write a query to retrieve name of the instructors and course id that he/she teaches the course.

select i.name,t.course_id
from instructoru i,teachesu t
where i.id=t.id;
3.	Write a query to retrieve name of the instructors and courses who taught Biology department courses.

select name,dept_name
from instructoru
where dept_name='biology';
4.	Write a query to retrieve the names of instructors, and title of the courses that they teach.

select i.name,c.title
from instructoru i,courseu c,teachesu t
where i.id=t.id and t.course_id=c.course_id;
5.	Write a query to retrieve the names of all instructors whose salary is greater than at least one instructor in the Biology department.

select name,salary
from instructoru
where salary>any(select salary from
instructoru
where dept_name='biology');
6.	Write a query to retrieve names of all departments whose building name includes 'Watson'.

select dept_name
from deptu
where building in('watson');
7.	Write a query to retrieve the names of the Physics department instructors in ascending order.

select name
from instructoru
where dept_name='physics'
order by name;
8.	Write a query to retrieve the name and salary of instructors order by salary in descending order and if more than one instructor have the same salary, order by names in ascending order.

select name,salary
from instructoru
order by salary desc,name;
9.	Write a query to retrieve the names of instructors whose salary amounts in the range $90,000 and $100,000.

select name,salary
from instructoru
where salary between 90000 and 100000;
10.	Write a query to retrieve all the courses taught in the Fall 2009 semester.

select course_id from section1
where semester='fall' and year=2009;
11.	 Write a query to retrieve all the courses taught in the Spring 2010 semester.

select course_id from section1
where semester='spring'and year=2010;
12.Write a query to retrieve all the courses taught either in Fall 2009 or in Spring 2010 or both

(select course_id
from section1
where semester='fall'andyear=2009)
union
(select course_id
from section1
where semester='spring'and year=2010)
13.Write a query to retrieve all the courses taught in the Fall 2009 as well as in Spring 2010

(select course_id
from section1
where semester='fall'andyear=2009)
intersection
(select course_id
from section1
where semester='spring'and year=2010)
14.	Write a query to retrieve all courses taught in the Fall 2009 semester but not in the Spring 2010 semester.

(select course_id
from section1
where semester='fall'andyear=2009)
minus
(select course_id
from section1
where semester='spring'and year=2010)
15.	Write a query to retrieve the average salary of all instructors.

avg(salary)
from instructor1;
avg(salary)
16.	Write a query to retrieve the average salary of instructors in the Computer Science department.

select avg(salary)
from instructor1
where dept_name='com.sci'
avg(salary)
17.	Write a query to retrieve the average salary in each department.

select dept_name,avg(salary)
from instructor1
group by dept_name
17.	Write a query to retrieve the average salary in each department.

selct dept_name,avg(salary)
from insructor1
group by dept_name
18.	Write a query to retrieve the number of instructors in each department who teach a course in the Spring 2010 semester.

select i.dept_name,cout(i.id)from instructor i,teachesu t
where i.id=t.id and semester='spring'
and year=2010
group by i.dept_name
19.Write a query to retrieve the average salary of the instructors in those departments where the average salary is more than $80000

select dept_num,avg(salary)from'
instructoru
group by dept_name
having avg(salary)>80000
20.Write a query to retrieve the names of all instructors that have a salary value greater than of each instructor in the Computer Science department

selct name from instructor
where salary >all(select salary from instructoru where dept_name='comp.sci.')
21.	Write a query to retrieve the names of all instructors that have a salary value greater than at least one instructor in the Comp. Sci. department.

select name from instructor
where salary>any(select salary from instructor where dept_name='comp.sci.')
22.Write a query to retrieve the departments that have the highest average salary.

select dept_name,avg(salary)
from instructor
group by dept_name
having avg(salary)>=all
(select avg(salary)
from instructor
group by dept_name);

