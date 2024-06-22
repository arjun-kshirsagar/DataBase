-- https://leetcode.com/problems/students-and-examinations/

-- It is possible that, you only need to update the data in DB or you only have to retrieve data
-- the Schema Design for both the DB can be completely different

-- There is no perfect Schema, it depends on the use cases.

-- Every column should be atomic

-- Understand why a particular schema is bad?
-- Dont jump to solving a good schema directly

-- Class and Instructor Schema
-- There can be issues in Insert, Update, Delete Name of Instructor


-- Steps to Building a Schema

-- Gather the requirements
-- Create the tables (identify the entities required) {tables => entities}
	-- Browse through your PRD and identify all the nouns, the nouns are generally tables, if they are required
-- Identify the cols for each table
-- Analyse the use case, and decide the primary keys
	-- Primary key creates the clustered index
-- Identify the relationships and store them in a optimal way

-- V0 of Scaler Academy Schema

-- What all features do I need to support? What all things I need to store?
-- 	There are students
-- 		Name, Email, Ph No, etc.
-- There are batches
-- Every student is associated to a single batch

-- What kind of APIs will use this Schema?
	-- Will it be for fetching data, or storing data
    -- When a student logs in they should be able to see their details and batchnames
    
    
    
-- Tables: Students, Batches

-- Students Table
	-- id(primary key), email, name, batch id(foreign key)
-- Batches
	-- id(primary key), name
    
    
-- Adding a new col will cause downtime, so this is not recommended

-- Whenever you have many to many relationship, you can have a foreign key
-- Have a separate student, subject table
    
-- create database scaler;
-- use scaler;
-- CREATE TABLE students (
--     id int,
--     name varchar,
--     email varchar
-- );