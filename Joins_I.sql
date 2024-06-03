use sakila;

select title from film
where title like "B%"; -- to get the films whose title starts with the character 'B'
-- '%' matches with anything, even empty string

select title from film
where title like "BIRD%"; -- to get the films which start with the string "BIRD"

select title from film
where title like "%E"; -- to get the films whose title ends with 'E'

select title from film
where title like "%LOVE%"; -- to get the titles which has "LOVE" anywhere in it

select * from actor
where first_name like "H%"
and last_name like "%H"; -- we can combine the like queries using booleans 'like' and and 'or'

select * from film
where original_language_id is null; -- select all films where the original_language_id is null

-- fetch all the titles which has second character as 'R'
select * from film
where title like "_R%"; -- '_' means it matches with exactly one character

-- the following is a wrong query, it fails for the film "lovelove"
-- never judge a query based on its outcome
-- select * from film
-- where title like '_%LOVE%'; -- select all the films which has 'love' in it but it doesnt start with 'love'

-- the below query is correct
SELECT title FROM film
WHERE title LIKE '%love%' AND title NOT LIKE 'love%'; -- chatgpt


-- fetch only top 10 films sorted by title in descending order which has original_lang_id as null
select * from film
where original_language_id is null
order by title desc
limit 10;

-- fetch only rows 11-20, if we put limit to 20 sorted by title in descending order which has original_lang_id as null
select * from film
where original_language_id is null
order by title desc
limit 10 offset 10; -- offset helps us to skip those number of rows

-- same as the above query
select * from (select * from film
where original_language_id is null
order by title desc
limit 20) subquery
order by title limit 10;

-- fetch the film with second highest rental_rate, if there are multiple movies get the movie with lower film_id
select * from film
order by rental_rate desc, film_id
limit 1 offset 1;


-- ---------- JOINS -------------
select * from film
join actor;

-- this will join all the rows from language table to all the rows of film table
select title, language_id from film
join language;

-- this will only join if the language ids of both the rows from film and language table match
select film.title, language.name from film
join language on film.language_id = language.language_id; -- Inner Join

select distinct language_id from film;
select * from language where language_id = 1;

-- for all films output the film_id, film_title, actor_name and sort it using film_title
select film.film_id, film.title, actor.first_name, actor.last_name 
from film
join film_actor on film.film_id = film_actor.film_id 
join actor on film_actor.actor_id = actor.actor_id
order by film.title;

