-- ========================================================================
-- JOINS


/* 5 main types of JOINS:
- inner join
- right join
- left join
- full outer join
- cross join
*/

-- let's check the type of the drink in the order
SELECT A.date,
    A.bar,
    B.type as drink,
    A.quantity
FROM Orders as A
INNER JOIN drink_info as B
    ON A.drink_id = B.drink_id
;


-- Now, we can add price of the drink as well
SELECT A.date,
    A.bar,
    B.type as drink,
    A.quantity,
    C.price
FROM Orders as A
INNER JOIN drink_info as B
    ON A.drink_id = B.drink_id
INNER JOIN has_on_menu as C
    ON A.bar = C.bar
        AND A.drink_id = C.drink_id
;


-- Problem I
-- Which bars have the most expensive and cheapest beers respectively?
-- What do you think? What table do we need? What calculation do we need?





-- Problem II
-- Which bar did make the biggest revenue?
-- What do you think? What table do we need? What calculation do we need?


