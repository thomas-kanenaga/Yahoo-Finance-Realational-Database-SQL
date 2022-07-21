-- **********************************************
-- **                 Overview
-- **
-- ******************* **************************

-- How many employees do we have?
-- SELECT, 
-- AS, 
-- FROM,
-- COUNT()
select count(emp_no) as 'Total number of Employees we have' from employees;

-- How many departments do we have?
-- DISTINCT
select count(distinct title) as 'Total number of Titles we have' from titles;

-- How many managers do we have?

select count(emp_no) as 'Total number of Managers we have' from dept_manager;
-- What positions do we have ?
select distinct title as 'Roles We have ' from titles;

-- What Senior-level positions do we have ?
-- WHERE
-- OR
select distinct title as 'Senior-level positions ' from titles where title like '%Senior%' OR title like '%Manager%';

-- What is the average numnber of team members a department ?
-- FORMAT()
-- AVG(), 
-- GROUP BY,
-- Subquery in a FROM clause
SELECT
format(AVG(count),0) as 'Average number of team members per department'
FROM (select count(emp_no) as count from dept_emp group by dept_no) as sub;







-- **********************************************
-- **                 Salary page
-- **
-- ******************* **************************
 
 -- What is the highest salary over the past  years?
-- Date_format
select date_format(from_date,'%Y') as Year, max(salary) as Highest from salaries 
group by Year 
order by Year ;

-- What was the epense for the company in total salary 
-- Sum
select concat('$',Sum(salary)) as 'Total expense in sallaries' from salaries;

-- Which employees have a salary less than than the mean salary
-- Which 
-- HAVING -- 
-- INNER JOIN --
-- Subquery in a HAVING or WHERE clause --
select
format(avg(salary),2) as Salary,
 employees.first_name as 'Fist name' , employees.last_name as 'Last name'
from employees
inner join salaries on salaries.emp_no = employees.emp_no
group by employees.emp_no
having Salary<(select avg(salary) from salaries)
;


-- **********************************************
-- **                 employee page
-- **
-- ******************* **************************

-- employees first and last names 
-- GROUP_CONCAT
select 
group_concat(distinct concat(' ',employees.first_name, ' ', employees.last_name) order by employees.last_name) as 'Workers'
from employees;

-- Who are the 5 most recent hires
-- Star(*)
-- LIMIT
select * from employees order by hire_date limit 5;

-- How many employees are there per department?
-- JOIN
-- order by 

select departments.dept_name as Department, count(emp_no) as Employees
from dept_emp
join departments on departments.dept_no =dept_emp.dept_no
group by departments.dept_no
order by Employees desc;

