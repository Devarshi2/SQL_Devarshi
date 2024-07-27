#select and from and alias fun(as)
select * 
from film ;

#condition : where
select rating ,title from film 
where rating="G";



select rating , length , title
from film
where length > 120 and rating = 'R';

#like = similar this ; fun (%,_)
select * from film where title like "h%";

select * from film where title like "w%y";
select * from film where title like "c%r_";

select * from film where title like "__l%";
select * from film where title like "c%rr_";
select * from film where rating like "_";

# insert into fun

insert into actor (first_name , last_name) value ('bhagi_rath' , 'pan%choli');
insert into actor (first_name , last_name) value ('bhagi_rath_', 'pancholi');
select * from actor where last_name like '%o%';
select * from actor where last_name like '%!%%'escape "!";
select * from actor where first_name like '%!_%'escape "!";
select * from actor where first_name like '%^_%^_%'escape "^";

# limit and order by(sorting mwthod)

select * from actor limit 5;
select * from city order by country_id limit 5;
select * from city order by country_id desc limit 10;

#between fun

select * from film where actor_id between 100 and 200;

# in and not in  fun

select*  from film where rating in ( 'g' , 'r', 'pg-13');

select *  from film where rating not in ( 'g' , 'r', 'pg-13');

#is and not in fun

select * from address where address2 is null;
select * from address where address2 is not null;

#aggregate fun

select avg(length)
from film ;

#movies having length > avg length
select* from film where length > (select avg(length) from film)address

select sum(length)
from film ;

select count(length) # give non null count of length values
from film ;

# naming of column
select count(length) as abc # give non null count of length values
from film ;

select count(address2) from address; #count without null values
select count(*) from address; # count with vlaues

# min and max fun 

select min(lengh) from film;

#aggregate fun : sum, count,avg , min ,max

#group by + having
select rating, avg(length) , count(rating)
from film
group by rating;

select special_features , max(length)
from film
group by special_features;

#city wise how many addresses are there?
select city_id, count(address_id) as cid
from address
group by city_id
having cid > 1; 

#category wise film id
select category_id , count(film_id)
from film_category
group by category_id;

select count(city) , country_id
from city
group by country_id
having count(city)>20;

# contry_id wise count city
select count(city) , country_id
from city
group by country_id
having count(city)>20;

select rating , avg(length)
from film
where length > 100
group by rating
having avg(length) >140
order by avg(length) desc
limit 5;


#join fun
select category.name , count(film_id)
from film_category join category on film_category.category_id = category.category_id
group by category.name;

select 
from address join city on address.address_id = city.address_id join counrty on country.country_id = city.country_id




select count(film_id),first_name, last_name
from actor join film_actor on actor. actor_id = film_actor. actor_id
group by actor.first_name , actor.last_name
having count(film_id)>20 and actor.first_name like 'n%';


# hr

#1Display all information in the tables EMP and DEPT.
select*
from employees join departments on employees.department_id =departments.departments_id;

#2Display only the hire date and employee name for each employee.


#3 Display the ename concatenated with the job ID, separated by a comma and space, and name the column Employee and Title
select concat(job_id,", ",first_name) as "Empoyee and title"
from employees;

#4 Display the hire date, name and department number for all clerks.
select hire_date , first_name ,department_id,job_id
from employees 
where job_id like "%clerk%";

#5 Create a query to display all the data from the EMP table. Separate each column by a comma. Name the column THE OUTPUT
select concat(employee_id ,",", first_name, "," , last_name,"," ,email) as THE_OUTPUT
from employees;

#6 Display the names and salaries of all employees with a salary greater than 2000.
select first_name ,last_name , salary
from employees
where salary>2000;

#7 Display the names and dates of employees with the column headers "Name" and "Start Date"
select First_name as NAME,hire_date AS START_DATE
from EMPLOYEES

#select and from and alias fun(as)
select * 
from film ;

#condition : where
select rating ,title from film 
where rating="G";



select rating , length , title
from film
where length > 120 and rating = 'R';

#like = similar this ; fun (%,_)
select * from film where title like "h%";

select * from film where title like "w%y";
select * from film where title like "c%r_";

select * from film where title like "__l%";
select * from film where title like "c%rr_";
select * from film where rating like "_";

# insert into fun

insert into actor (first_name , last_name) value ('bhagi_rath' , 'pan%choli');
insert into actor (first_name , last_name) value ('bhagi_rath_', 'pancholi');
select * from actor where last_name like '%o%';
select * from actor where last_name like '%!%%'escape "!";
select * from actor where first_name like '%!_%'escape "!";
select * from actor where first_name like '%^_%^_%'escape "^";

# limit and order by(sorting mwthod)

select * from actor limit 5;
select * from city order by country_id limit 5;
select * from city order by country_id desc limit 10;

#between fun

select * from film where actor_id between 100 and 200;

# in and not in  fun

select*  from film where rating in ( 'g' , 'r', 'pg-13');

select *  from film where rating not in ( 'g' , 'r', 'pg-13');

#is and not in fun

select * from address where address2 is null;
select * from address where address2 is not null;

#aggregate fun

select avg(length)
from film ;

#movies having length > avg length
select* from film where length > (select avg(length) from film)address

select sum(length)
from film ;

select count(length) # give non null count of length values
from film ;

# naming of column
select count(length) as abc # give non null count of length values
from film ;

select count(address2) from address; #count without null values
select count(*) from address; # count with vlaues

# min and max fun 

select min(lengh) from film;

#aggregate fun : sum, count,avg , min ,max

#group by + having
select rating, avg(length) , count(rating)
from film
group by rating;

select special_features , max(length)
from film
group by special_features;

#city wise how many addresses are there?
select city_id, count(address_id) as cid
from address
group by city_id
having cid > 1; 

#category wise film id
select category_id , count(film_id)
from film_category
group by category_id;

select count(city) , country_id
from city
group by country_id
having count(city)>20;

# contry_id wise count city
select count(city) , country_id
from city
group by country_id
having count(city)>20;

select rating , avg(length)
from film
where length > 100
group by rating
having avg(length) >140
order by avg(length) desc
limit 5;


#join fun
select category.name , count(film_id)
from film_category join category on film_category.category_id = category.category_id
group by category.name;

select 
from address join city on address.address_id = city.address_id join counrty on country.country_id = city.country_id




select count(film_id),first_name, last_name
from actor join film_actor on actor. actor_id = film_actor. actor_id
group by actor.first_name , actor.last_name
having count(film_id)>20 and actor.first_name like 'n%';


# hr

#1Display all information in the tables EMP and DEPT.
select*
from employees join departments on employees.department_id =departments.departments_id;

#2Display only the hire date and employee name for each employee.


#3 Display the ename concatenated with the job ID, separated by a comma and space, and name the column Employee and Title
select concat(job_id,", ",first_name) as "Empoyee and title"
from employees;

#4 Display the hire date, name and department number for all clerks.
select hire_date , first_name ,department_id,job_id
from employees 
where job_id like "%clerk%";

#5 Create a query to display all the data from the EMP table. Separate each column by a comma. Name the column THE OUTPUT
select concat(employee_id ,",", first_name, "," , last_name,"," ,email) as THE_OUTPUT
from employees;

#6 Display the names and salaries of all employees with a salary greater than 2000.
select first_name ,last_name , salary
from employees
where salary>2000;

#7 Display the names and dates of employees with the column headers "Name" and "Start Date"
select First_name as NAME,hire_date AS START_DATE
from EMPLOYEES

#8 Display the names and salaries of all employees in reverse salary order.

#9 Display 'ename" and "deptno" who are all earned commission and display salary in reverse order.

#10 Display the last name and job title of all employees who do not have a manager

#11 Display the last name, job, and salary for all employees whose job is sales representative or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000

#12 Display the maximum, minimum and average salary and commission earned.

#13 Display the department number, total salary payout and total commission payout for each department.

#14 Display the department number and number of employees in each department.

#15 Display the department number and total salary of employees in each department.

#16 Display the employee's name who doesn't earn a commission. Order the result set without using the column name

#17 Display the employees name, department id and commission. If an Employee doesn't earn the commission, then display as 'No commission'. Name the columns appropriately

#18 Display the employee's name, salary and commission multiplied by 2. If an Employee doesn't earn the commission, then display as 'No commission. Name the columns appropriately

select concat('first_name' , " ", 'last_name') , salary 
case
when commission_pct is not null then "no commission"
else commission_pct*2
end
from employees ;

#19 Display the employee's name, department id who have the first name same as another employee in the same department
select 
from employees
group by first_name , department_id
#20 Display the sum of salaries of the employees working under each Manager.

#21 Select the Managers name, the count of employees working under and the department ID of the manager.
select m.last_name as 'employee' , m. first_name as 'manager' ,count(*) ,m.department_id
from employees as e join employees as m on e.manager_id = m.employee_id
group by m.employee_id

#22 Select the employee name, department id, and the salary. Group the result with the manager name and the employee last name should have second letter 'a'
   #error
#23 Display the average of sum of the salaries and group the result with the department id. Order the result with the department id.

#24 Select the maximum salary of each department along with the department id
select max(salary) , department_id
from employees
group by department_id;
#25 Display the commission, if not null display 10% of salary, if null display a default value 1
select commission_pct
case
when commission_pct is not null then (10*salary/100)
else salary = 1
end from employees
