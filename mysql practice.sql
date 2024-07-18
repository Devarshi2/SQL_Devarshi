select first_name, last_name
from actor;

select * 
from city;

select *
from country;

select *
from language;

# aliasing(using of as)
select first_name as fname, last_name as lname
from actor;

# condotional extraction
# select , where;;(arithmetic oprators) < > <= >= <> != 
select title,length
from film
where length<120;

select title,length
from film
where length!=46;

select title,length
from film
where length<>46;

select title,rating
from film
where rating='G';

select title,rating
from film
where rating='G' or rating='R';

select title,rating,length
from film
where rating='R' and length>120;

# string matching

# selects movie which starts with ha
select *
from film
where title like "ha%";

# selects film that are starts with w and ends with y
select *
from film 
where title like "w%y";

# extraction of film which have 3rd letter l
select *
from film
where title like "__l%";

#  selects movies which starts with c and ends with second last r
select *
from film 
where title like "c%" and title like "%r_";
#where title like "c%r_"


# selcts movies which starts with c and third and second last letter is r
select * 
from film
where title like "c%rr_";

#selects movives which have only one character in rating
select *
from film
where rating like"_";

# only gives 5 output
select *
from actor
limit 5;

# gives city by country id in default asc but if you want in desc you can write at last or you can double click the id
select *
from city
order by country_id desc
limit 10;

#between function 
select *
from film
where length between 100 and 200;

# in function where you can give conditions in short form(alternate for or)
select *
from film
where rating in ("G","R","PG-13");

# negative version of above condition
select *
from film
where rating not in ("G","R","PG-13");

# lets find the output which have null values
select *
from address
where address2 is null;

# lets find the output which does not have null value
# blank and null are diff for mysql
select *
from address
where address2 is not null;

# aggregate functions
select avg(length)
from film ;

select sum(length)
from film;

#non null count of length values
select count(length)
from film;

select count(length) as abc 
from film;

# does not count null value
select count(address2)
from address;

# counts value which are blank and null
select count(*)
from address;

select min(length) from film;

select max(length)
from film;

# movies having length>avg length
select avg(length)
from film;

select *
from film
where length > 115.2720;

select *
from film
where length >(select avg(length) from film);

describe actor;

#groupby fun uses
select rating, avg(length) as AVG_LEN, count(rating)
from film
group by rating;

select *
from address;

# city wise how many address are there
select city_id,count(address_id) as cid 
from address
group by city_id
having cid>1;

select*
from city;

# find country wise city 
select country_id,count(city) as tcc
from city
group by country_id
having tcc >20;

# category table
select *
from film_category;

# category wise film
select category_id,count(film_id) as fi
from film_category
group by category_id;
#having fi>70;

select rating, avg(length) as AVG_LEN, count(rating)
from film
where length>100
group by rating
having AVG_LEN > 140
order by AVG_LEN desc
limit 2











