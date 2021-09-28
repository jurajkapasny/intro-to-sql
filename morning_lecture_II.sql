-- ========================================================================
-- AGGREGATION

SELECT COUNT(*) FROM Orders;
SELECT COUNT(*) FROM Orders LIMIT 5;

/*The most important functions are:
    COUNT - counts how many rows are in a particular column.
    SUM - adds together all the values in a particular column.
    MIN and MAX - return the lowest and highest values in a particular column, respectively.
    AVG - calculates the average of a group of selected values.
*/

-- We can have more than 1 aggregation in query
SELECT COUNT(*) AS number_of_orders,
    SUM(quantity) AS total_quantity
FROM Orders;


-- GROUP BY ROWS BY SPECIFIC COLUMN
-- how many drinks were ordered by each person
SELECT person, 
    COUNT(*) AS number_of_orders,
    SUM(quantity) AS total_quantity
FROM Orders
GROUP BY person;

SELECT person, 
    COUNT(*) AS number_of_orders,
    SUM(quantity) AS total_quantity
FROM Orders
GROUP BY 1;

SELECT person, 
    COUNT(*) AS number_of_orders,
    SUM(quantity) AS total_quantity
FROM Orders
GROUP BY 1
ORDER BY 2 DESC;

-- be careful about the order of the keywords
SELECT person, 
    COUNT(*) AS number_of_orders,
    SUM(quantity) AS total_quantity
FROM Orders
ORDER BY 2 DESC
GROUP BY 1;

-- group by more than 1 column
SELECT person, 
    bar,
    COUNT(*) AS number_of_orders,
    SUM(quantity) AS total_quantity
FROM Orders
GROUP BY 1,2
ORDER BY 3 DESC;

/* 
THE ORDER NEEDS TO BE THE SAME EVERY TIME
1. SELECT
2. FROM
3. WHERE
4. GROUP BY
5. ORDER BY
6. LIMIT
*/

SELECT person, 
    COUNT(*) AS number_of_orders,
    SUM(quantity) AS total_quantity
FROM Orders
WHERE person = 'person 1'
GROUP BY 1
ORDER BY 2 DESC
;

-- we can't use WHERE clause on aggregated column
SELECT person, 
    COUNT(*) AS number_of_orders,
    SUM(quantity) AS total_quantity
FROM Orders
WHERE total_quantity > 100
GROUP BY 1
ORDER BY 2 DESC
;


-- keyword HAVING
SELECT person, 
    COUNT(*) AS number_of_orders,
    SUM(quantity) AS total_quantity
FROM Orders
GROUP BY 1
HAVING SUM(quantity) > 100
ORDER BY 2 DESC
;

SELECT person, 
    COUNT(*) AS number_of_orders,
    SUM(quantity) AS total_quantity
FROM Orders
GROUP BY 1
HAVING total_quantity > 100
ORDER BY 2 DESC
;

/* 
THE ORDER NEEDS TO BE THE SAME EVERY TIME
1. SELECT
2. FROM
3. WHERE
4. GROUP BY
5. HAVING
6. ORDER BY
7. LIMIT
*/

-- FULL QUERY
SELECT person, 
    COUNT(*) AS number_of_orders,
    SUM(quantity) AS total_quantity
FROM Orders
WHERE person in ('person 23','person 57','person 81')
GROUP BY 1
HAVING total_quantity > 105
ORDER BY 2 DESC
LIMIT 1
;


-- ==========================================================
-- SUBQUERIES

-- so far, we have used only tables as our data source. However, we can also use output of the query.
SELECT * 
FROM (
    SELECT person,
        bar,
        quantity
    FROM Orders
) as sub_query;


-- more complex example
SELECT * 
FROM (
    SELECT person, 
        COUNT(*) AS number_of_orders,
        SUM(quantity) AS total_quantity
    FROM Orders
    GROUP BY 1
    ORDER BY 2 DESC
) as sub_query
WHERE total_quantity > 100;

-- same performance as before
SELECT person, 
    COUNT(*) AS number_of_orders,
    SUM(quantity) AS total_quantity
FROM Orders
GROUP BY 1
HAVING total_quantity > 100
ORDER BY 2 DESC


-- SUBQUERY IN WHERE CLAUSE
-- SHOW ORDERS OF DRINKS WHICH ARE ON THE MENU OF BAR 1

select * 
from Orders
where drink_id in (
    select drink_id
    from has_on_menu
    where bar = 'bar 1'
);

select * 
from Orders
where drink_id not in (
    select drink_id
    from has_on_menu
    where bar = 'bar 1'
);


-- Get the bar name and average price of each bar
-- What do you think? What table do we need? What calculation do we need?

