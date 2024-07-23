/*문제1*/
select e.employee_id,
	   e.first_name,
       e.last_name,
	   d.department_name
from employees e, departments d
order by department_name asc, employee_id desc;

/*문제2*/
select e.employee_id,
	   e.first_name,
       e.salary,
       d.department_name,
       j.job_title
from  employees e 
inner join departments d
	  on e.department_id =d.department_id
inner join jobs j
	  on e.job_id=j.job_id
order by employee_id asc;    

/*문제2-1*/

  select 
		e.employee_id,
	    e.first_name,
        e.salary,
        d.department_name,
        j.job_title
from  employees e 
left outer join departments d on e.department_id = d.department_id
left outer join jobs j on e.job_id=j.job_id;

/*문제 3번*/

select l.location_id,
	   l.city,
       d.department_id,
       d.department_name
from departments d
inner join locations l on l.location_id=d.location_id
order by l.location_id asc;

/*문제 3-1번*/
select l.location_id,
	   l.city,
       d.department_id,
       d.department_name
from departments d
right outer join locations l on l.location_id=d.location_id
order by l.location_id  asc;

/* 문제4*/
select r.region_name,
	   c.country_name
from regions r
inner join countries c on c.region_id=r.region_id;

/*문제 5*/

select emp.employee_id,
	   emp.first_name,
	   emp.hire_date,
       man.first_name,
       man.hire_date
from employees emp inner join employees man
on emp.manager_id = man.employee_id
where emp.hire_date<man.hire_date;


/*문제6*/

select c.country_name,
	   c.country_id,
       l.city,
       l.location_id,
       d.department_name,
       d.department_id
from countries c
inner join locations l on c.country_id=l.country_id
inner join departments d on d.location_id=l.location_id
order by c.country_name asc;

/*문제 7*/
select e.employee_id,
	   concat(e.first_name,e.last_name)as 이름,
       j.job_id,
       j.start_date,
       j.end_date
from job_history j inner join employees e
	 on e.job_id=j.job_id
where j.job_id in ('AC_ACCOUNT');

/*문제 8*/

select d.department_id,
	   d.department_name,
	   man.first_name,
       l.city,
       c.country_name,
       r.region_name
from departments d
inner join employees man on d.manager_id = man.employee_id
inner join employees e on e.employee_id=man.employee_id
inner join locations l on d.location_id = l.location_id
inner join countries c on l.country_id = c.country_id
inner join regions r on c.region_id = r.region_id;

select e.employee_id,
	   emp.first_name,
       d.department_name,
       man.first_name as 'manager'
from employees e 
left outer join departments d on d.department_id=e.department_id
inner join employees emp on e.employee_id=emp.employee_id
left outer join employees man on emp.manager_id = man.employee_id;

/*문제 9-1*/
select e.employee_id,
	   emp.first_name,
       d.department_name,
       man.first_name as 'manager'
from employees e 
left outer join departments d on d.department_id=e.department_id
inner join employees emp on e.employee_id=emp.employee_id
left outer join employees man on emp.manager_id = man.employee_id
where man.first_name is not null;

/*문제 9-2*/
select e.employee_id,
	   emp.first_name,
       d.department_name,
       man.first_name as 'manager'
from employees e 
left outer join departments d on d.department_id=e.department_id
inner join employees emp on e.employee_id=emp.employee_id
left outer join employees man on emp.manager_id = man.employee_id
where man.first_name is not null
and d.department_name is not null;



