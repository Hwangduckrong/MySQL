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

/*문제5*/

select job_id,
	    round(avg(salary), 0),
        max(salary),
        min(salary)
from employees
group by job_id
order by min(salary) desc,round(avg(salary), 0) asc;	

/*문제 6*/
select date_format(min(hire_date), '%Y-%m-%d %W') 
from employees;

/*문제 7*/
select department_id,
	    avg(salary), 
		min(salary), 
        avg(salary)-min(salary)
from employees
group by department_id
having avg(salary)-min(salary) <2000
order by avg(salary)-min(salary) desc;

/*문제 8*/

select job_id,
	   max_salary-min_salary
from jobs
order by max_salary-min_salary desc;

/*문제 9*/
select manager_id,
	   round(avg(salary), 1) avg,
	   min(salary) 'min',
	   max(salary) 'max'
from employees
where hire_date >= 2005/01/01
group by manager_id
having avg(salary) >= 5000
order by avg(salary) desc;

/*문제 10*/
select first_name,
	  case
	   when hire_date <= '02/12/31' then '창립멤버'
	   when hire_date > '02/12/31' and hire_date <= '03/12/31' then '03년입사'
	   when hire_date > '03/12/31' and hire_date <= '04/12/31' then '04년입사'  
	    else '상장이후입사'
		end 'optDate'
from employees
order by hire_date asc;
/*문제 11*/

날이 좋을 때 풀겠습니다....
