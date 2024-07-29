#Display all information in the tables EMP and DEPT.
select *
from employees join departments on employees.department_id = departments.department_id;

#Display only the hire date and employee name for each employee.
select hire_date,first_name,last_name
from employees;

#Display the ename concatenated with the job ID,
#separated by a comma and space, and name the column Employee and Title
select concat(first_name," ",last_name," :-- ",job_id) as "Employees AND Title" 
from employees;

#Display the hire date, name and department number for all clerks.
select hire_date,concat(first_name," ",last_name) as "full name",
departments.department_name,job_id
from employees join departments on employees.department_id= departments.department_id
where job_id like "%clerk%";

#Create a query to display all the data from the EMP table.
# Separate each column by a comma. Name the column THE OUTPUT
select concat(employee_id," ",first_name," ",last_name," ",email," ",
phone_number," ",hire_date," ",job_id," ",salary," ",
manager_id," ",department_id) as "THE OUTPUT"
from employees;

#Display the names and salaries of all employees with a salary greater than 2000.
select concat(first_name," ",last_name),salary
from employees
where salary>2000;

#Display the names and dates of employees with the column headers "Name" and "Start Date"
select concat(first_name," ",last_name) as "Name" , hire_date as "Start Date"
from employees; 

## Display the names and hire dates of all employees in the order they were hired.
select concat(first_name," ",last_name) as "Name" , hire_date as "Start Date" 
from employees
order by hire_date;

#Display the names and salaries of all employees in reverse salary order.
select first_name, last_name,  salary
from employees
order by salary desc
limit 5;

# Display 'ename" and "deptno" who are all earned commission and display salary in reverse order.
select first_name ,  last_name , commission_pct, salary
from employees
where commission_pct is not null
order by salary desc;

#Display the last name and job title of all employees who do not have a manager
select last_name, job_title,manager_id 
from employees join jobs on employees.job_id = jobs.job_id
where manager_id is null;

#Display the last name, job, and salary for all employees
# whose job is sales representative\
# or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000
select last_name , job_id , salary, job_title
from employees join jobs using(job_id)
where job_id in ("sa_rep","st_clerk") and 
salary not in ("2500","3500","5000");

#Database Name: HR	
#Display the maximum, minimum and average salary and commission earned.
select max(salary), min(salary), avg(salary), sum(commission_pct)
from employees;

#Display the department number, 
#total salary payout and total commission payout for each department.
select department_id , sum(salary) as "total salary", sum(commission_pct) as "total commision"
, department_name
from employees join departments using (department_id)
group by department_id;

#Display the department number and number of employees in each department.
select department_id, count(*) as "total num in each department"
from employees
group by department_id;

#Display the department number and total salary of employees in each department.
select department_id,SUM(salary) as total_salary
from employees
group by department_id;

##Display the employee's name who doesn't earn a commission.
# Order the result set without using the column name
select first_name , last_name , commission_pct 
from employees 
where commission_pct is null
order by 1;

#Display the employees name,
#department id and commission. If an Employee doesn't earn the commission,
#then display as 'No commission'. Name the columns appropriatel
select *
from employees;

# case and when function practice(if else)
select concat(first_name," ",last_name) as "Full Name" , department_id as "Departments", 
case 
when commission_pct is null then "NO COMMISSION"
when commission_pct >.30 then "Excellent"
else commission_pct
end
as "commission"
from employees;

#Display the employee's name, salary and commission multiplied by 2.
#If an Employee doesn't earn the commission,
#then display as 'No commission. Name the columns appropriately
select concat(first_name," ", last_name) as "Full Name" , salary* 2 as "Double Salary",
case
when commission_pct is null then "no commission"
when commission_pct is not null  then commission_pct *2
end
as "commission",
case 
when salary < 10000 then "lower salary"
when salary between 10000 and 20000 then "group-3"
when salary between 20000 and 30000 then "group-2"
when salary between 30000 and 40000 then "group 1"
when salary > 40000 then "higher salary"
end
as "grouping"
from employees;

#Display the employee's name, 
#department id who have the first name same as another employee in the same department
select first_name, department_id,count(*), sum(salary)
from employees
group by first_name, department_id
having count(*)>1;

#Display the sum of salaries of the employees working under each Manager.
select manager_id,sum(salary), count(manager_id)
from employees
group by manager_id ;

##Select the Managers name, the count of employees working under and the department ID of the manager.
#(self join concept)
select concat (m.first_name," ",m.last_name) as "Manager Name",count(*) as "employees working under" ,
 m.department_id,department_name
from employees as e join employees as m on e.manager_id = m.employee_id join departments 
on m.department_id= departments.department_id
group by m.employee_id;

#Display the average of sum of the salaries and group the result with the department id.
#Order the result with the department id.
select avg(salary), department_id
from employees
group by department_id;

#Select the maximum salary of each department along with the department id
select max(salary), department_id
from employees
group by department_id;

#Display the commission, if not null display 10% of salary, if null display a default value 1
select salary,
case 
when commission_pct is not null then salary*0.10 + salary
when commission_pct is null then "1"
end
as "modified salary"
from employees
