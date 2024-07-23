/*문제1*/
select count(*) as haveMngCnt
from employees
where manager_id is not null;

/*문제2*/
select max_salary as '최고임금',
	   min_salary as '최저임금',
       max_salary-min_salary as '최고임금-최저임금'
from jobs;       
 
 /*문제3*/
select date_format(max(hire_date),'%Y년%m월%d일')
from employees;

/*문제4*/

select  department_id,
		sum(salary)/count(*),
	    max_salary,
        min_salary
from employees,jobs
group by employees.department_id=jobs.department_id;


select e.first_name,
	   d.department_name,
       e.department_id,
       d.department_id
from employees e inner join departments d
on e.department_id = d.department_id;    