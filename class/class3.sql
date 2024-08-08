Select 
  --------
  show tables;


select * from EMPLOYEES



select * from EMPLOYEES where salary >= 10000

> < >= <= != =



select * from EMPLOYEES where DEPARTMENT_ID = 8



select employee_id ,
      first_name ,
      salary ,
      email
      from employees 



select employee_id ,
      first_name ,
      salary ,
      email
      from employees  where employee_id = 202
                             or 
                            employee_id = 203 
                            or 
                            employee_id = 204

select employee_id ,
      first_name ,
      salary ,
      email
      from employees  where employee_id in( 202,203,204)

      select from max(salary)

      select from count(highestsecondsalry) from salar
      
                            
                            
      
and --> both condtions  should satisfy 
or --> any one 


select * from EMPLOYEES   where first_name like 'N%'
                                           and 
                                           salary >= 15000 

select * from employees where manager_id is not null



select count(*) from employees;

select count(first_name) from employees;

select count(manager_id) from employees;


select employee_id ,
      first_name ,
      salary ,
      email
      from employees order by salary 

select employee_id ,
      first_name ,
      salary ,
      email
      from employees order by salary desc


  select employee_id ,
      first_name ,
      salary ,
      email
      from employees order by first_name  


      



      Janu
      feb
      mar
      apr
      ..
      Dec
      

select * from employees where salary between 10000 and 20000 
order by salary 

select count(*) from employees where DEPARTMENT_ID = 3


select DEPARTMENT_ID from employees

select distinct(DEPARTMENT_ID) from employees order by 1


select DEPARTMENT_ID,count(*) from employees group by DEPARTMENT_ID

select DEPARTMENT_ID from employees group by DEPARTMENT_ID


// iwant to identify duplcate names 

select first_name from employees 


select distinct(first_name) from employees 

select first_name ,count(*) from employees    group by  first_name



select first_name ,count(*) from employees    group by  first_name
                                 having count(*) > 1   --> optional 


max() , min () ,avg () ---Aggrgate functions


   select salary from employees    


 select * from employees 
           where salary in ( select max(salary) from employees)
   
   

    select min(salary) from employees 


    select sum(salary) from employees


select DEPARTMENT_ID ,sum(salary) from employees    group by  DEPARTMENT_ID



select * from employees 
           where salary in ( select max(salary) from employees ) <= 
           ( salary in ( select max(salary) from employees ))
