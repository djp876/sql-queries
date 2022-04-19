PROGRAM-1:
1.  Display the department names in the lower case but the initial must be in uppercase. 

select initcap(dname) from dept1;
-------------------------------------------------------------------------------------------------------------------------------------------------

2. Determine the ‘ename’, ‘job’, ‘sal’ rename the title as Job-sal the output must be Job-Sal as SMITH[CLERKRS.2000]

select ename,'[',job,'-',sal,']' from employee;
------------------------------------------------------------------------------------------------------------------------------------------------

3.  Count the number of times S occurs in department names.

select dname,length(dname)-length(replace(dname,'s') "occurances of s" from dept1;
----------------------------------------------------------------------------------------------------------------------------------------------

4.  Write a query to display the department name which does not contains any employees.

select dname from dept1
where deptno not in(select deptno from employee);
----------------------------------------------------------------------------------------------------------------------------------------------

5.  Write a query to display all employee details where employee was joined during the years 1980 to 1990 and in the 2nd week of a month

select hiredate from employee
where to_char (hiredate,'yyyy') between 1980 and 1990
to_char(hiredate,'w')=2
-----------------------------------------------------------------------------------------------------------------------------------------------

6.  Write an SQL statement to convert the current date to new date picture 
ex: MONDAY  10th 2005 10:30.00 PM

select to_char(sysdate,'Day DD YYYY HH12 M1 SS PM') from dual;
------------------------------------------------------------------------------------------------------------------------------------------------

7.  Write a query to display details of all employees who joined on last Monday of a month and whose experience is more than 20 months.

 select months_between(sysdate,hiredate)>20 and to_char(hiredate,'D')=2 and hiredate between last_day(hiredate)-6 and
last_day(hiredate);
------------------------------------------------------------------------------------------------------------------------------------------------

8.  Write a query to calculate the service of employees rounded to years.

select round((sysdate-hiredate)/365) service 
from employee
-------------------------------------------------------------------------------------------------------------------------------------------------

9.  Write a query that will display all different job types.

 select distinct job from employee
 ------------------------------------------------------------------------------------------------------------------------------------------------

10.  Write a query that will display list of employees and their salary and the comments as follows.
 	If the salary is more than 1500 then display “above target”
      If the salary is equal to 1500 then display “on the target”
      If the salary is less than 1500 then display “below the target”

select ename,sal,case
when sal>1500 then 'above target'
when sal<1500 then 'below target'
else 'on target'
end  "target"
from employee
-------------------------------------------------------------------------------------------------------------------------------------------------

11. Display all employee names, employee number, department names & salary grades for all employees who are working in department 30.

select ename,empno,dname,grade
from e.deptno=d.deptno and sal between losal and hisal and d.deptno=30;
--------------------------------------------------------------------------------------------------------------------------------------------------

12. Display the time of day.

select to_char(sysdate,'HH12:MI:SS')


EMPLOYEE DATA BASE--------------------------------------------------------------------------------------------------------------------------------


1. Find all employees who earn a salary greater than the average salary of their departments.

select ename,sal from employee e
where sal>(select avg(sal) from employee
where e.deptno=deptno);
-------------------------------------------------------------------------------------------------------------------------------------------------
2. Write a query to sort names of employees in department 10 & 20 in alphabetical order

select ename from employee 
where deptno in (10,20)
order by ename;
-----------------------------------------------------------------------------------------------------------------------------------------------

3.Write a query to display all job types.

select distinct job from employee;
----------------------------------------------------------------------------------------------------------------------------------------------

4.Calculate the number of employees and average salary of each department

select deptno,count(*),avg(sal) from employee
group by deptno;
-----------------------------------------------------------------------------------------------------------------------------------------------

5. Write a query to find the name of the manager and number of sub-ordinates.

select m.ename,count(m.ename)
from employee e,employee m
where e.mgr=m.empno
group by m.ename;
------------------------------------------------------------------------------------------------------------------------------------------------

6.Write a query to find out the manager having Maximum number of sub-ordinates.

select m.ename,count(*)
from employee e,employee m
where e.mgr=m.empno
group by m.ename
having count(*) in (select max(count(*))
from employee e,employee m
where e.mgr=m.empno
group by m.ename;
--------------------------------------------------------------------------------------------------------------------------------------------------

7.Display the average, monthly salary bill for each job type within department.

select deptno,job,avg(sal) from employee
group by job,deptno;
---------------------------------------------------------------------------------------------------------------------------------------------------
8.Find all employees whose dept is not in dept table.

select *from employee where deptno not in(select  deptno from dept);
----------------------------------------------------------------------------------------------------------------------------------------------------

9.(a)  Write a query to find out the employees who have joined before their managers.

   select e.name from employee e,employee m
   where e.mgr=m.empno and e.hiredate(m.hiredate);
---------------------------------------------------------------------------------------------------------------------------------------------------

(b) Write a query to find out the year, where most people join in the company displays the   year and No. of Employees.

    select to_char(hiredate,'YYYY') year,count(*)
    from employee group by to_char(hiredate,'YYYY')
    having count(*) in (select max(count(*))  
  from employee group by to_char(hiredate,'YYYY'));
--------------------------------------------------------------------------------------------------------------------------------------------------
10(a) List the department names of each employee.

     select dname,ename from employee e,dept1 d
      where e.deptno=d.deptno
----------------------------------------------------------------------------------------------------------------------------------------------------

(b) Find all employees who earn lowest salary in each department.

    select min(sal),deptno from employee
    group by deptno
---------------------------------------------------------------------------------------------------------------------------------------------------
11(a) Display all employees who earn more than the lowest salary of department 30.

      select ename,sal from employee
      where sal>(select min(sal) from employee where deptno=30)
---------------------------------------------------------------------------------------------------------------------------------------------------
(b) Display all departments, which have the average salary more than average salary of department.

     select deptno,avg(sal) from employee
     group by deptno
     having avg(sal)>any (select avg(sal) from employee
     group by deptno)
------------------------------------------------------------------------------------------------------------------------------------------------
12 Write a query which will return the DAY of the week. (i.e. MONDAY), for any date entered in the format: DD.MM.YY.

   select to_char(date '1982-03-09','DAY') from dual;
-------------------------------------------------------------------------------------------------------------------------------------------- 

UNIVERSITY DATA BASE------------- ----- - -  - - --------------------------     ------------     - - - - - - - - -

Simple queries:
1.	Write a query to retrieve the names of all instructors.

select name
from instructoru;
----------------------------------------------------------------------------------------------------------------------------------------
2.	Write a query to retrieve the department names of all instructors

select name,dep_name
from instructoru;
--------------------------------------------------------------------------------------------------------------------------------------------
3.	Write a query to retrieve the unique department names of all instructors.

select distinct dept_name
from instructoru;
-------------------------------------------------------------------------------------------------------------------------------------------------
4.	Write a query to show resulting salaries if each instructor is given a 10 percent raise

select name,salary+(salary*0.1)"10%rasie in sal"
from instructoru;
-----------------------------------------------------------------------------------------------------------------------------------------------------
5.	Write a query to retrieve the names of all instructors in the Computer Science department who have salary more than $70,000.

select name
from instructoru
where dep_name='com.sci'
and salary>70000;
----------------------------------------------------------------------------------------------------------------------------------------------------
QUERIES ON MULITPLE RELATIONSHIPS

1.	Write a query to retrieve the name of all instructors along with their department names and department building name.

select i.anem,i.dep_name,d.building
from instructoru i,deptu d
where i.dept_name=d.dept_name
order by i.id;
-----------------------------------------------------------------------------------------------------------------------------------------------------
2.	Write a query to retrieve name of the instructors and course id that he/she teaches the course.

select i.name,t.course_id
from instructoru i,teachesu t
where i.id=t.id;
------------------------------------------------------------------------------------------------------------------------------------------------------
3.	Write a query to retrieve name of the instructors and courses who taught Biology department courses.

select name,dept_name
from instructoru
where dept_name='biology';
-------------------------------------------------------------------------------------------------------------------------------------------------------
4.	Write a query to retrieve the names of instructors, and title of the courses that they teach.

select i.name,c.title
from instructoru i,courseu c,teachesu t
where i.id=t.id and t.course_id=c.course_id;
------------------------------------------------------------------------------------------------------------------------------------------------------
5.	Write a query to retrieve the names of all instructors whose salary is greater than at least one instructor in the Biology department.

select name,salary
from instructoru
where salary>any(select salary from
instructoru
where dept_name='biology');
-------------------------------------------------------------------------------------------------------------------------------------------------------
6.	Write a query to retrieve names of all departments whose building name includes 'Watson'.

select dept_name
from deptu
where building in('watson');
-----------------------------------------------------------------------------------------------------------------------------------------------------
7.	Write a query to retrieve the names of the Physics department instructors in ascending order.

select name
from instructoru
where dept_name='physics'
order by name;
-------------------------------------------------------------------------------------------------------------------------------------------------
8.	Write a query to retrieve the name and salary of instructors order by salary in descending order and if
more than one instructor have the same salary, order by names in ascending order.

select name,salary
from instructoru
order by salary desc,name;
-------------------------------------------------------------------------------------------------------------------------------------------------
9.	Write a query to retrieve the names of instructors whose salary amounts in the range $90,000 and $100,000.

select name,salary
from instructoru
where salary between 90000 and 100000;
---------------------------------------------------------------------------------------------------------------------------------------------------
10.	Write a query to retrieve all the courses taught in the Fall 2009 semester.

select course_id from section1
where semester='fall' and year=2009;
---------------------------------------------------------------------------------------------------------------------------------------------------
11.	 Write a query to retrieve all the courses taught in the Spring 2010 semester.

select course_id from section1
where semester='spring'and year=2010;
-----------------------------------------------------------------------------------------------------------------------------------------------------
12.Write a query to retrieve all the courses taught either in Fall 2009 or in Spring 2010 or both

(select course_id
from section1
where semester='fall'andyear=2009)
union
(select course_id
from section1
where semester='spring'and year=2010)
----------------------------------------------------------------------------------------------------------------------------------------------------
13.Write a query to retrieve all the courses taught in the Fall 2009 as well as in Spring 2010

(select course_id
from section1
where semester='fall'andyear=2009)
intersection
(select course_id
from section1
where semester='spring'and year=2010)
--------------------------------------------------------------------------------------------------------------------------------------------------------------
14.	Write a query to retrieve all courses taught in the Fall 2009 semester but not in the Spring 2010 semester.

(select course_id
from section1
where semester='fall'andyear=2009)
minus
(select course_id
from section1
where semester='spring'and year=2010)
------------------------------------------------------------------------------------------------------------------------------------------------------
15.	Write a query to retrieve the average salary of all instructors.

avg(salary)
from instructor1;
avg(salary)
----------------------------------------------------------------------------------------------------------------------------------------------------
16.	Write a query to retrieve the average salary of instructors in the Computer Science department.

select avg(salary)
from instructor1
where dept_name='com.sci'
avg(salary)
------------------------------------------------------------------------------------------------------------------------------------
17.	Write a query to retrieve the average salary in each department.

select dept_name,avg(salary)
from instructor1
group by dept_name
------------------------------------------------------------------------------------------------------------------------------------------
17.	Write a query to retrieve the average salary in each department.

selct dept_name,avg(salary)
from insructor1
group by dept_name
----------------------------------------------------------------------------------------------------------------------------------------------
18.	Write a query to retrieve the number of instructors in each department who teach a course in the Spring 2010 semester.

select i.dept_name,cout(i.id)from instructor i,teachesu t
where i.id=t.id and semester='spring'
and year=2010
group by i.dept_name
----------------------------------------------------------------------------------------------------------------------------------------------------
19.Write a query to retrieve the average salary of the instructors in those departments where the average salary is more than $80000

select dept_num,avg(salary)from'
instructoru
group by dept_name
having avg(salary)>80000;
-----------------------------------------------------------------------------------------------------------------------------------------------------
20.Write a query to retrieve the names of all instructors that have a salary value greater than of each instructor in the Computer Science department

selct name from instructor
where salary >all(select salary from instructoru where dept_name='comp.sci.');
-------------------------------------------------------------------------------------------------------------------------------------------------------
21.	Write a query to retrieve the names of all instructors that have a salary value greater than at least one instructor in the Comp. Sci. department.

select name from instructor
where salary>any(select salary from instructor where dept_name='comp.sci.');
----------------------------------------------------------------------------------------------------------------------------------------------------------
22.Write a query to retrieve the departments that have the highest average salary.

select dept_name,avg(salary)
from instructor
group by dept_name
having avg(salary)>=all
(select avg(salary)
from instructor
group by dept_name);
--------------------------------------------------------------------------------------------------------------------------------
