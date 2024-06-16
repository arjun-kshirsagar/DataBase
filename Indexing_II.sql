-- Some practice problems
-- https://leetcode.com/problems/tree-node/
-- https://leetcode.com/problems/queries-quality-and-percentage/description/
-- https://leetcode.com/problems/trips-and-users/description/


-- Indexing Concepts
use sakila;
Explain Analyze
select * from film
where title = 'Academy';
-- -> Index lookup on film using idx_title (title='Academy')  (cost=0.35 rows=1) (actual time=0.0181..0.0181 rows=0 loops=1)

-- Explain Analyze
drop index idx_title on film;

Explain Analyze
select * from film
where title = 'Academy';
-- -> Filter: (film.title = 'Academy')  (cost=103 rows=100) (actual time=1.31..1.31 rows=0 loops=1)
-- -> Table scan on film  (cost=103 rows=1000) (actual time=0.0439..1.2 rows=1000 loops=1)

create index idx_title on film(title); -- Convention: always keep the prefix idx, so that SQL knows its a index


explain analyze
select distinct 
-- Transactions Lec Starts