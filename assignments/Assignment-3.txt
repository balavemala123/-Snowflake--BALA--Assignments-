use hr;

show tables;

use schema vitech;

select * from employees

21) Display the
names of employees whose names have second alphabet A in  their names.;

select first_name from employees
where first_name like '%_a%';

22) select the names of the employee
whose names is exactly five characters 
in length.;

select first_name from employees
where LENGTH(first_name) =5;

23) Display the names of the employee who
are not working as MANAGERS. ;

select first_name from employees
where job_title != 'manager';

24) Display the names of the employee who
are not working as SALESMAN OR  CLERK
OR ANALYST. 

select first_name from employees 
where job_title not in('salesman','clerk','analyst');


25) Display all rows from emp table. The
system should wait after every  screen
full of information. ;

select * from employees
limit 10 ;

26) Display the total number of employee
working in the company. ;

select count(*) from employees;


27) Display the total salary begging paid
to all employees.;

select sum(salary) from employees;

28) Display the maximum salary from emp
table.;

select max(salary) from employees;

29) Display the minimum salary from emp
table. ;

select min(salary) from employees;

30) Display the average salary from emp
table.;

select avg(salary) from employees;