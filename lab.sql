use sakila;
-- 1) How many distinct (different) actors' last names are there?
select count(distinct (concat(first_name,' ',last_name))) from actor;

-- 2) In how many different languages where the films originally produced? (Use the column language_id from the film table)
select count(distinct(language_id)) from film;

-- 3) How many movies were released with "PG-13" rating?
select count(title) from film
where rating = 'PG-13';

-- 4) Get 10 the longest movies from 2006.
select title, length from film
order by (length) desc
limit 10;

-- 5) How many days has been the company operating (check DATEDIFF() function)?
select datediff(max(convert(last_update,date)),min(convert(payment_date,date))) from payment;

-- 6) Show rental info with additional columns month and weekday. Get 20.
select * from rental;
select *, Weekday(convert(rental_date, Date)) as weekday, date_format(convert(rental_date,date),'%M') as 'Month'  from rental;

-- 7) Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select *, 
case when Weekday(convert(rental_date, Date)) = 5 or Weekday(convert(rental_date, Date)) = 6 then 'Weekend'
else 'Workday'
end as day_type 

from rental;

-- 8) How many rentals were in the last month of activity?
select count(rental_id) from rental
where date_format(rental_date,'%m') = (select max(date_format(rental_date,'%m')) from rental);
