1. Find all employees who earn a salary greater than the average salary of their departments.

select ename,sal from employee e
where sal>(select avg(sal) from employee
where e.deptno=deptno);

2. Write a query to sort names of employees in department 10 & 20 in alphabetical order

select ename from employee 
where deptno in (10,20)
order by ename;

3.Write a query to display all job types.

select distinct job from employee;

4.Calculate the number of employees and average salary of each department

select deptno,count(*),avg(sal) from employee
group by deptno;

5. Write a query to find the name of the manager and number of sub-ordinates.

select m.ename,count(m.ename)
from employee e,employee m
where e.mgr=m.empno
group by m.ename;

6.Write a query to find out the manager having Maximum number of sub-ordinates.

select m.ename,count(*)
from employee e,employee m
where e.mgr=m.empno
group by m.ename
having count(*) in (select max(count(*))
from employee e,employee m
where e.mgr=m.empno
group by m.ename;


7.Display the average, monthly salary bill for each job type within department.

select deptno,job,avg(sal) from employee
group by job,deptno;

8.Find all employees whose dept is not in dept table.

select *from employee where deptno not in(select  deptno from dept);

9.(a)  Write a query to find out the employees who have joined before their managers.

   select e.name from employee e,employee m
   where e.mgr=m.empno and e.hiredate(m.hiredate)

(b) Write a query to find out the year, where most people join in the company displays the   year and No. of Employees.

    select to_char(hiredate,'YYYY') year,count(*)
    from employee group by to_char(hiredate,'YYYY')
    having count(*) in (select max(count(*))  
  from employee group by to_char(hiredate,'YYYY'));

10(a) List the department names of each employee.

     select dname,ename from employee e,dept1 d
      where e.deptno=d.deptno

(b) Find all employees who earn lowest salary in each department.

    select min(sal),deptno from employee
    group by deptno

11(a) Display all employees who earn more than the lowest salary of department 30.

      select ename,sal from employee
      where sal>(select min(sal) from employee where deptno=30)

(b) Display all departments, which have the average salary more than average salary of department.

     select deptno,avg(sal) from employee
     group by deptno
     having avg(sal)>any (select avg(sal) from employee
     group by deptno)

12 Write a query which will return the DAY of the week. (i.e. MONDAY), for any date entered in the format: DD.MM.YY.

   select to_char(date '1982-03-09','DAY') from dual;
 
