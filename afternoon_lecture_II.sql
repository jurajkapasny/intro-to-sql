
-- ========================================================================
-- FUNCTIONS

-- there is a lot of built-in functions that can be applied to data using SQL

-- we can replace drink_id to be numeric
select * from drink_info;

select substr(drink_id,7) as drink_id,
    type
from drink_info
;

-- change the data type
select cast(substr(drink_id,7) as integer) as drink_id,
    type
from drink_info
;


-- we can round numbers
select * from has_on_menu;

select bar,
    drink_id,
    round(price,2)
from has_on_menu;


-- There are many many more functions we can choose from when writing our queries: 
-- https://www.sqlitetutorial.net/sqlite-functions/

-- ========================================================================
-- CONDITIONALS

select bar,
    drink_id,
    round(price,2),
    CASE WHEN price > 20 THEN 'expensive' ELSE 'cheap' END as price_category
from has_on_menu;


-- Let's count number of orders, where expensive drink was sold
-- What do you think? What table do we need? What calculation do we need?
select * from Orders



-- ========================================================================
-- OTHER OPERATIONS (OTHER THAN SELECT STATEMENTS)

-- 1. create empty db file
-- 2. check it in the explorer


CREATE TABLE IF NOT EXISTS users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  age INTEGER,
  gender TEXT,
  nationality TEXT
);


CREATE TABLE IF NOT EXISTS posts(
  id INTEGER PRIMARY KEY AUTOINCREMENT, 
  title TEXT NOT NULL, 
  description TEXT NOT NULL, 
  user_id INTEGER NOT NULL, 
  FOREIGN KEY (user_id) REFERENCES users (id)
);


CREATE TABLE IF NOT EXISTS comments (
  id INTEGER PRIMARY KEY AUTOINCREMENT, 
  text TEXT NOT NULL, 
  user_id INTEGER NOT NULL, 
  post_id INTEGER NOT NULL, 
  FOREIGN KEY (user_id) REFERENCES users (id) FOREIGN KEY (post_id) REFERENCES posts (id)
);


CREATE TABLE IF NOT EXISTS likes (
  id INTEGER PRIMARY KEY AUTOINCREMENT, 
  user_id INTEGER NOT NULL, 
  post_id integer NOT NULL, 
  FOREIGN KEY (user_id) REFERENCES users (id) FOREIGN KEY (post_id) REFERENCES posts (id)
);

SELECT * FROM users;


INSERT INTO
  users (name, age, gender, nationality)
VALUES
  ('James', 25, 'male', 'USA'),
  ('Leila', 32, 'female', 'France'),
  ('Brigitte', 35, 'female', 'England'),
  ('Mike', 40, 'male', 'Denmark'),
  ('Elizabeth', 21, 'female', 'Canada');


SELECT * FROM users;


INSERT INTO
  posts (title, description, user_id)
VALUES
  ('Happy', 'I am feeling very happy today', 1),
  ('Hot Weather', 'The weather is very hot today', 2),
  ('Help', 'I need some help with my work', 2),
  ('Great News', 'I am getting married', 1),
  ('Interesting Game', 'It was a fantastic game of tennis', 5),
  ('Party', 'Anyone up for a late-night party today?', 3);


INSERT INTO
  comments (text, user_id, post_id)
VALUES
  ('Count me in', 1, 6),
  ('What sort of help?', 5, 3),
  ('Congrats buddy', 2, 4),
  ('I was rooting for Nadal though', 4, 5),
  ('Help with your thesis?', 2, 3),
  ('Many congratulations', 5, 4);


INSERT INTO
  likes (user_id, post_id)
VALUES
  (1, 6),
  (2, 3),
  (1, 5),
  (5, 4),
  (2, 4),
  (4, 2),
  (3, 6)
;


select * from comments;

-- Updating Records
UPDATE posts
SET
    description = 'The weather has become pleasant now'
WHERE id = 2;


-- Deleting Records
DELETE FROM comments 
WHERE id = 5;



-- create table as a result from SELECT statement
select * from drink_info;

create table drink_info_clean AS
select cast(substr(drink_id,7) as integer) as drink_id,
    type
from drink_info
;

select * from drink_info_clean;



-- ==================================================================
-- WINDOW FUNCTIONS
-- Window Functions are similar to aggregate functions, 
-- but where the input values are taken from a "window" of one or more rows in the results set of a SELECT statement


select * from Orders limit 10;

-- imagine, we want to add a cumulative quantity to each order.
SELECT date,
    person,
    bar,
    drink_id,
    quantity,
    SUM(quantity) OVER (ROWS UNBOUNDED PRECEDING) as cum_quantity
FROM Orders
ORDER BY date

-- what did go wrong here?








SELECT date,
    person,
    bar,
    drink_id,
    quantity,
    SUM(quantity) OVER (ORDER BY date ROWS UNBOUNDED PRECEDING) as cum_quantity
FROM Orders
ORDER BY date



-- Now I want to see similar SUM but for person, bar and drink respectively
SELECT date,
    person,
    bar,
    drink_id,
    quantity,
    SUM(quantity) OVER (PARTITION BY person ORDER BY date ROWS UNBOUNDED PRECEDING) as cum_quantity
FROM Orders
ORDER BY date, person;

SELECT date,
    person,
    bar,
    drink_id,
    quantity,
    SUM(quantity) OVER (PARTITION BY bar ORDER BY date ROWS UNBOUNDED PRECEDING) as cum_quantity
FROM Orders
ORDER BY date, bar;


