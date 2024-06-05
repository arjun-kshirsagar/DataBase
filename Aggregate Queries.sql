-- https://leetcode.com/problems/customers-who-never-order/

-- https://leetcode.com/problems/employee-bonus/description/

-- SELECT s.name, ta.name
-- FROM student s
-- JOIN student ta using (ta_id);


-- Given an Employee table with id, name, salary, manager_id
-- https://leetcode.com/problems/employees-earning-more-than-their-managers/description/

-- https://leetcode.com/problems/duplicate-emails/

-- Aggregate functions
use sakila;
select count(*) from film; -- count(*) means how many rows are there in the output

select count(*) from film
where title like 'A%';

select count(*) from film
where rental_duration <= 4;

select count(film_id) from film	-- this gives us the count of non null values in the film_id column
where rental_duration <= 4;

select count(original_language_id) from film
where rental_duration <= 4;

select max(rental_duration) from film; -- this outputs the max value in the given column

select min(rental_duration) from film; -- this outputs the min value in the given column

select avg(rental_duration) from film; -- this outputs the avg of all the values in the given column
select round(avg(rental_duration), 2) from film; -- to round of the output from a function

-- the max, min, avg, count functions have single row as output, hence the following will be wrong 
select max(rental_duration), title from film; -- error 1140

select title from film
where rental_duration = max(rental_duration); -- error 1111

select title from film
where max(rental_duration); -- error 1111

-- Group functions
select rental_duration, count(*) from film -- then, the count(*) counts the number of values in it
group by rental_duration; -- this first groups the given table using rental_duration

select rental_duration, count(*) from film
group by rental_duration
order by rental_duration;

select rental_duration, avg(rental_rate) from film
group by rental_duration;

select rental_duration, avg(length) from film -- you cant pick specific rows here, you have to only use aggregate func
group by rental_duration					  -- other than the func, and the col in group by, you cant use anything
order by rental_duration;

select rental_duration, avg(length) from film
where rental_duration > 4				-- we cant use the where clause after group by
group by rental_duration
order by rental_duration;
-- other method using 'having' keyword
select rental_duration, avg(length) from film
group by rental_duration
having rental_duration > 4 -- advantage: we can also use the aggregate fuction in the having, but not in the where clause
order by rental_duration;

-- select email as Email from Person
-- group by email
-- having count(email) > 1;
-- same way
# select distinct p1.email as Email from Person p1
# join Person p2 on (p1.email = p2.email) and (p1.id != p2.id); -- this is faster

-- https://leetcode.com/problems/actors-and-directors-who-cooperated-at-least-three-times/submissions/1278432237/

-- https://leetcode.com/problems/actors-and-directors-who-cooperated-at-least-three-times/submissions/1278432237/
select actor_id, director_id from ActorDirector
group by actor_id, director_id
having count(timestamp) >= 3;