-- https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/description/ 
-- https://leetcode.com/problems/managers-with-at-least-5-direct-reports/description/
-- https://leetcode.com/problems/customers-who-bought-all-products/description/
-- https://leetcode.com/problems/biggest-single-number/

-- ifnull function: https://leetcode.com/problems/biggest-single-number/
-- Case statement: https://leetcode.com/problems/triangle-judgement/
-- update function: https://leetcode.com/problems/swap-salary/
use sakila;

-- Most basic way to save data in the server is CSV(Comma Separated Values)
-- Iterating over an array has lesser execution time compared to the data in CSV file, 
-- we cant execute anythink in the harddisk
-- first we have to load it into main memory, this operation is most time consuming step
-- arrays are already there in the main memory, hence they are 70-80 times faster
-- but they are not persistent, if you switch off the PC, they get deleted
-- hence we need CSV to store in the hard disk

-- things are stored in the hard disk in different parts
	-- There are multiple shards or blocks, 
    
    -- hard disk is read block by block and not line by line
    
-- to optimize this we have something called as "Dense Index"