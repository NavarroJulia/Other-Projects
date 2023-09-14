------ 14 Sep 2023: --------


-- SQL LIMIT:

-- Automatic Limit in Mode
-- Why should you limit your results
-- using the SQL Limit command


-- Check output when limit 100 is turned off:

SELECT *
  FROM tutorial.us_housing_units

-- keep it checked to reduce lenght of code running since often times queries involve
-- looking at how tables look like and then how to manipulate them (cleaning etc.)

-- Outside of Mode, this can be done manually as follows:

Select * 
from tutorial.us_housing_units
limit 100


-- Practice Problem
-- Write a query that uses the LIMIT command to restrict the result set to 
-- only 15 rows.

Select * 
from tutorial.us_housing_units
limit 15



----

-- SQL where

----

-- Cover SQL where clausa, and
-- how Where works

-- Refamiliarize ourselves with the data:

SELECT * FROM tutorial.us_housing_units

-- Filter data using where:

Select *
from tutorial.us_housing_units
where month = 1

-- Month == 1 is January (filtering out by January)

-- Note to self: the order: Select, From, and Where

-- How Where works:
-- SQL filters all the data by what is placed after WHERE
-- In our case it filters the data to include rwos where the month coloumn is = 1
-- i.e., when the month_name is January


-- SQL Comparison Operators:
-- Comparison operators on num data, non-num data
-- Arithmetic in SQL
-- Practice problems


-- On num data (as expected)

-- Equal to : =
-- Not equal to : <> or !=
-- Greater than : >
-- Less than : <
-- Greater/Less than or equal to : >=, <=

-- applying these to a dataset only makes sense if applied to a numerical column,
-- for example, filtering west:

select * 
from tutorial.us_housing_units 
where west > 30


-- Practice Problem
-- Did the West Region ever produce more than 50,000 housing units in one month?


select * 
from tutorial.us_housing_units 
where west > 50

-- Assuming 50,000 is equiv to 50 in the dataset, yes, in the months June, August and December

--Practice Problem
--Did the South Region ever produce 20,000 or fewer housing units in one month?

select * 
from tutorial.us_housing_units 
where south <=20

-- Yes, in the months, January (2x), February, and May


-- Comparison to non-num data:
-- Here we can make use of =!:
-- Select data by all months except January:

select *
from tutorial.us_housing_units
where month_name != 'January'

-- Notes: if using non-num data operator, need to place the value in ''
-- SQL uses single quotes to reference column values

-- If > or < are used on January, it would not follow month before or after, but
-- by alphabetical order:

select *
from tutorial.us_housing_units
where month_name > 'January'


-- But we also do not need to be too specific:

select *
from tutorial.us_housing_units
where month_name > 'J'

-- Selects rows of data where the first letter of the month is J: J,K,L,M....


-- Practice Problem
-- Write a query that only shows rows for which the month name is February

select *
from tutorial.us_housing_units
where month_name  = 'February'

-- Practice Problem
-- Write a query that only shows rows for which the month_name starts with the 
-- letter "N" or an earlier letter in the alphabet.

select *
from tutorial.us_housing_units
where month_name <= 'N'


-- Arithmetic in SQL:
-- Can only perform arithmetic across a given row:
-- odd values in multiple columns from the SAME rwo together using +
-- if want to add across multiple rows, need to use aggregate function

-- An example of using +:

-- Note that AS can store a result in a new column

select year, month, west, south, west + south as south_plus_west
from tutorial.us_housing_units

-- Can also add numbers, not only values from our data:

SELECT year,
       month,
       west,
       south,
       west + south - 4 * year AS nonsense_column
  FROM tutorial.us_housing_units

-- these columns we obtain are called 'derived columns'
-- since their values are obtained by the data


-- Practice Problem
-- Write a query that calculates the sum of all four regions in a separate column.

select south, west, midwest, northeast, south + west + midwest + northeast AS Four_regions_Sum 
from tutorial.us_housing_units


-- Order of operations: use ()

sELECT year,
       month,
       west,
       south,
       (west + south)/2 AS south_west_avg
  FROM tutorial.us_housing_units
  
  
-- Practice Problem
-- Write a query that returns all rows for which more units were produced
-- in the West region than in the Midwest and Northeast combined.  
  
select *
from tutorial.us_housing_units
where West > Midwest + Northeast

  
-- Practice Problem
-- Write a query that calculates the percentage of all houses completed in 
-- the United States represented by each region. Only return results from
-- the year 2000 and later.

-- Hint: There should be four columns of percentages. 

select *, 
 
west/(west + south + midwest + northeast)*100 as west_pct,
south/(west + south + midwest + northeast)*100 as south_pct,
midwest/(west + south + midwest + northeast)*100 as midwest_pct,
northeast/(west + south + midwest + northeast)*100 as northeast_pct

from tutorial.us_housing_units
where year >= 2000

























