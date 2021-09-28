-- 1. SETUP CONNECTION TO DB
-- 2. OPEN DATABASE EXPLORER

-- TEST QUERY
SELECT * FROM Orders;
SELECT * FROM Orders LIMIT 5;

/*The most basic form of the SQL SELECT statement must include SELECT and FROM keywords. 

SELECT - defines what we want to take from the source
FROM - defines our data source (table)
*/

SELECT person,
    drink_id,
    quantity
FROM Orders
LIMIT 5;


-- In addition, if we want to filter the result set of the query, we should use the WHERE kayword.

SELECT person,
    drink_id,
    quantity
FROM Orders
WHERE drink_id = 'drink 4'
LIMIT 5;

-- We can use more than one filter
SELECT person,
    drink_id,
    quantity
FROM Orders
WHERE drink_id = 'drink 4'
    AND quantity > 1
LIMIT 5;


-- DRINKS
SELECT * FROM drink_info LIMIT 10;

SELECT * 
FROM drink_info 
WHERE type = 'cocktail'
LIMIT 10;

-- LIKE I
SELECT * 
FROM drink_info 
WHERE type LIKE 'cocktail'
LIMIT 10;

-- LIKE II
SELECT * 
FROM drink_info 
WHERE type LIKE 'w%'
LIMIT 10;

-- LIKE III
SELECT * 
FROM drink_info 
WHERE type LIKE '%e%'
LIMIT 10;

-- IN
SELECT * 
FROM drink_info 
WHERE type IN ('wine','whisky')
LIMIT 10;

-- BETWEEN
SELECT *
FROM Orders
WHERE quantity BETWEEN 5 AND 10
LIMIT 5;

-- we can use negation as well
SELECT * 
FROM drink_info 
WHERE type NOT IN ('wine','whisky')
LIMIT 10;



-- HOW TO LIST ALL TABLES IN DB
SELECT name
FROM sqlite_master 
WHERE type ='table' 
    AND name NOT LIKE 'sqlite_%';


SELECT *
FROM sqlite_master;

-- ORDER BY 
SELECT bar,
    drink_id,
    price
FROM has_on_menu
ORDER BY price DESC;

SELECT bar,
    drink_id,
    price
FROM has_on_menu
ORDER BY price ASC;

-- COMBINE
SELECT bar,
    drink_id,
    price
FROM has_on_menu
WHERE bar = 'bar 1'
ORDER BY price DESC;

-- BE CAREFULL ABOUT THE ORDER
SELECT bar,
    drink_id,
    price
WHERE bar = 'bar 1'
ORDER BY price DESC
FROM has_on_menu;


SELECT bar,
    drink_id,
    price
FROM has_on_menu
ORDER BY price DESC
WHERE bar = 'bar 1';

/* 
THE ORDER NEEDS TO BE THE SAME EVERY TIME
1. SELECT
2. FROM
3. WHERE
4. ORDER BY
5. LIMIT
*/


-- Which bar sells the cheapest drink? Which drink and what's the price?
-- What do you think? What table do we need? What calculation do we need?