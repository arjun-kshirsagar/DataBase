-- https://leetcode.com/problems/customer-placing-the-largest-number-of-orders/submissions/1280413687/
-- Soln : 
-- select customer_number from Orders
-- group by customer_number
-- order by count(order_number) desc limit 1;


-- https://leetcode.com/problems/rising-temperature/
-- select w1.id from Weather w1
-- join Weather w2 on DATEDIFF(w1.recordDate, w2.recordDate) = 1
-- where w1.temperature > w2.temperature;
-- DATEDIFF function, check the difference b/w the two dates

-- https://leetcode.com/problems/project-employees-i/
-- select project_id, ROUND(avg(experience_years), 2) as average_years from Project
-- join Employee using (employee_id)
-- group by project_id;

-- https://leetcode.com/problems/game-play-analysis-i/description/
-- select player_id, min(event_date) as first_login from Activity
-- group by player_id;

use sakila;

-- return avg length of all films whose rental_duration is max
select rental_duration, avg(length) from film
group by rental_duration
having rental_duration = max(rental_duration); -- this is wrong bcoz, you are applying the aggregate queries 
-- individually on all the groups, hence you are getting output of all the groups

-- SQL has internal query optimizer, which helps us to optimize the query which was made using subquery


select avg(length) from film
where rental_duration = (select max(rental_duration) from film );

-- https://leetcode.com/problems/employees-whose-manager-left-the-company/
-- SELECT employee_id 
-- FROM Employees 
-- WHERE salary < 30000 
-- AND manager_id IS NOT NULL
-- AND manager_id NOT IN (SELECT employee_id FROM Employees)
-- ORDER BY employee_id;
