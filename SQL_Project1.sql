-- * means all coloumns
-- selecting every column from the table
SELECT *
FROM tutorial.us_housing_units

-- when selecting multiple columns: must add the comma!!! but not after last column
Select year,
month,
west
from tutorial.us_housing_units

-- Practice problem:
-- write query to select alll columns without using *

select year,
month,
month_name,
south,
west,
midwest,
northeast
from tutorial.us_housing_units

-- after running a query you obtain a table that isnt stored permanentaly in the database
-- it also dows not alter the original database from which the query was written
-- MODE will store all the results for future use
-- SELECT does not change anything in the tables

-- NOTE: SELECT and select will both work and space and enter also are read the same by SQL
-- ie, the following two are equivalent:

SELECT *        FROM tutorial.us_housing_units

SELECT *
  FROM tutorial.us_housing_units



-- Column names
-- all so far written in lowercase and space is replaced by _, as well as names of tables
-- spaces can be used but are tricky:

-- If results are to be more presentable we can rename them:
-- rename west as West Region

select west as "West Region"
from tutorial.us_housing_units

-- here we chose the west column and renamed it as West Region (note the "")
-- Without using "", the query would read incorrectly and cause an error

--  Note that the results will only return capital letters if you put column names 
--  double ""
-- The following query will give lower case column names (because names are not in ""):


SELECT west as West_Region,
south as South_Region
from tutorial.us_housing_units


-- Practice Problem
-- Write a query to select all of the columns in tutorial.us_housing_units and 
-- rename them so that their first letters are capitalized.


select year as "Year",
 month as "Month",
 month_name as "Month_Name",
 south as "South",
 west as "West",
 midwest as "Midwest",
 northeast as "Northeast"
from tutorial.us_housing_units


-- SQL LIMIT:

-- Automatic Limit in Mode
-- Why should you limit your results
-- using the SQL Limit command
















