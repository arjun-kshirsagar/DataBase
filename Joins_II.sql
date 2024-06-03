use sakila;
-- if we are doing select * from table_1, table_2 there would be table_1 + table_2 cols
-- cross join:
	-- all rows of table1 joined with table2
    

-- on clause is better than where, bcoz while using where clause, a temp data is created of all the rows, it then iterates
-- over the complete data and decided which to pick and not

-- inner join: only for the data which is common in both the tables

-- by default a join is inner join

-- fetch the film_id, film title and film category for all the films
select film.film_id, film.title, film_category.category_id from film
left join film_category on film.film_id = film_category.film_id;
-- following is the better code than the above
select film.film_id, title, category_id from film -- title and category_id is present in only 1 table
left join film_category using (film_id); -- we can use this 'using' because it is same in both the tables

-- fetch the film_id, film title, film category and the name of category for all the films
select film.film_id, title, film_category.category_id, category.name from film f
left join film_category fc using(film_id) -- this helps us to reduce the code, we have used alias for the table_name
left join category c using(category_id);

-- fetch the film_id, film title, film category and the name of category for all the films where rental duration > 4
-- and name = action or comedy
select film.film_id, title, film_category.category_id, name from film
left join film_category using(film_id)
left join category using(category_id)
where name in ['Action', 'Comedy'] -- array comparator, if the name matches with any one of them it fetches them
and rental_duration > 4;

-- select the film_id, film_title and the inventory_id where it is rented for all the films
select film.film_id, title, inventory_id from film
join inventory using (film_id);

select * from inventory;

-- add the store id and the address with this data
select film.film_id, title, inventory_id, address from film
join inventory using (film_id) -- this is inner join
join store using (store_id)
join address using(address_id);

-- fecth film_id film_title, customer_id, customre_name cutstomer_district
-- relationship: film => inventory => rental => customer => address
select f.film_id, title, c.customer_id, first_name, last_name, district from film f
join inventory i using (film_id)
join rental r using(inventory_id)
join customer c using(customer_id)
join address a using(address_id);

select f.film_id, title, c.customer_id, first_name, last_name, district, city from film f
join inventory i using (film_id)
join rental r using(inventory_id)
join customer c using(customer_id)
join address a using(address_id)
join city using(city_id);

