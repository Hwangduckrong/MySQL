/*문제 1*/
select count(salary)
from employees
where salary<(select avg(salary)
			  from employees);

/*문제 2*/
select employee_id,
	   first_name,
       salary,
       avg(salary),
       max(salary)
from employees
where salary in(select salary
				from employees
                where salary>avg(salary)
                or salary<max(salary));
                
/*문제 3*/
/*select 	first_name,
		last_name,
		locatioin_id
from departments
where first_name='Steven'and last_name='king';*/

select d.location_id,
	   l.street_address,
       l.postal_code,
       l.city,
       l.state_province,
       l.country_id
from departments d
join locations l on d.location_id=l.location_id
where l.location_id in(select location_id
						from departments
						where d.department_id in(select manager_id
												from departments
												where manager_id is not null));
                                                

/*문제 4*/
select employee_id,
	   first_name,
	   salary
from employees
where salary<any(select salary
				 from employees
                 where job_id='ST_MAN')
order by salary desc;

/*문제 5*/

/*조건절*/
select employee_id,
	   first_name,
       salary,
       department_id
from employees
where(department_id,salary) in (select department_id,max(salary)
								from employees
                                group by department_id);

/*테이블에서 조인*/
select e.department_id,
	   e.employee_id,
       e.first_name,
       e.salary
from employees e,(select department_id,max(salary) salary
				  from employees
                  group by department_id) s
where e.department_id = s.department_id
and e.salary = s.salary;	   

/*문제6*/
select j.job_title,
	   sum(e.salary)
from jobs j join employees e on j.job_id=e.job_id
group by j.job_title
order by sum(e.salary) desc;    

/*문제 7*/                                    

select  e.employee_id,
		e.first_name,
		e.salary,
		e.department_id
from employees e,(select department_id, avg(salary) salary
				 from employees
                 group by department_id)s
where e.salary >s.salary
and e.department_id=s.department_id
;
