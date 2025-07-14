
select * from jobs
where salary > 10000;


select first_name,hire_date
from   employees
where  to_char(hire_date,'YYYY') between 2002 and 2005;       


select first_name,hire_date
from   employees
where  city= 'noida' or salary = 70000;


select *
from   employees
where  to_char(hire_date,'YYYY')> 2008;


select *
from   employees
where  employee_id IN (301,320);


select first_name,salary
from   employees
where  salary >10000;

--8 Display first name, salary, and round the salary to thousands.

select first_name,salary,round(salary,-3)
from   employees;

--9 Display details of jobs in the descending order of the title

select *
from   jobs
order by department_id desc;

--10 Display employees where the first name or last name starts with S

select *
FROM   employees
where  first_name like 'S%' and last_name like 'S%';

--11 Display employees who joined in the month of May

select *
from   employees
where  to_char(hire_date,'MON') = 'MAY';

--12 Display details of the employees where city is null and salary in the
--   range 50000 to 70000 and department is 303.

select *
from   employees
where  city is null and salary between 50000 and 70000 
       and department_id = 303;
       
--13  Display first name and date of first salary of the employees

select first_name,hire_date,add_months(hire_date,1) as salary_date
from   employees;

--14 Display first name and experience of the employees

select first_name,round(months_between(sysdate,hire_date))||' '||'months' as experience
from   employees;

--15 Display first name of employees who joined in 2001

select first_name
from   employees
where  to_char(hire_date,'YY') = 21;

--16 Display first name and last name after converting the first letter of each name to upper
--   case and the rest to lower case.

select initcap(first_name),initcap(last_name)
from   employees;

--17 Display the first word in profile

select substr(profile,1,1)
from   jobs;

--18 Display the length of first name for employees where last name contain character ‘b’ after
--   3rd position.
select length(first_name),first_name,last_name,employee_id
from   employees
where  last_name like '__b%';

--19 Display first name in upper case and email address in lower case for employees where the
--   first name and email address are same irrespective of the case

select upper(first_name) as first_name,lower(email) as email
from   employees;

--20 Display employees who joined in the current year

select * 
from   employees
where  to_char(hire_date,'YYYY')=2024;

--21 Display the number of days between system date and 1st January 2011

select trunc(sysdate - to_date('01-january-2011','DD-MONTH-YYYY')) as days
FROM   dual;

--22 Display how many employees joined in each month of the current year

select * 
from   employees
where  to_char(hire_date,'YY')=23
order by hire_date asc;


--23 Display number of employees joined after 15th of the month

select first_name||last_name as name,salary,hire_date
from   employees
where  to_char(hire_date,'DD') > 15;

--24 Display the country and number of cities we have in the country

select country,city,count(*)
from   locations
group by country, city;

--25 . Display average salary of employees in each department who have salary

select department_id,trunc(avg(salary))
from   employees
where  salary is not null
group by department_id;
