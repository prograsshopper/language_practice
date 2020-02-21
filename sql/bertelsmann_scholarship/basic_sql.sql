-- SELECT

select id, account_id, occurred_at from orders;

-- LIMIT
SELECT occurred_at, account_id, channel FROM web_events LIMIT 15;

-- ORDER BY
SELECT id, occurred_at, total_amt_usd 
FROM orders;

SELECT id, account_id, total_amt_usd 
FROM orders
ORDER BY total_amt_usd DESC
LIMIT 5;

SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd ASC
LIMIT 20;

SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY account_id ASC, total_amt_usd DESC;

SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC, account_id ASC;

-- WHERE
SELECT gloss_amt_usd 
FROM orders 
WHERE gloss_amt_usd >= 1000
LIMIT 5;

SELECT * 
FROM orders 
WHERE total_amt_usd < 500
LIMIT 10;

SELECT name, website, primary_poc
FROM accounts
WHERE name = 'Exxon Mobil';

-- Arithmetic operators
SELECT id, account_id, standard_amt_usd/standard_qty AS unit_price
FROM orders
LIMIT 10;

SELECT id, account_id, poster_amt_usd/(standard_amt_usd + gloss_amt_usd + poster_amt_usd) AS post_rev
FROM orders
LIMIT 10;

-- LIKE
-- This allows you to perform operations similar to using WHERE and =, but for cases when you might not know exactly what you are looking for.
SELECT *
FROM accounts
WHERE name LIKE '%one%';

SELECT *
FROM accounts
WHERE name LIKE '%s';

-- IN
-- This allows you to perform operations similar to using WHERE and =, but for more than one condition.
SELECT name, primary_poc, sales_rep_id 
FROM accounts
WHERE name IN ('Walmart', 'Target', 'Nordstrom');

SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords')

-- NOT
-- This is used with IN and LIKE to select all of the rows NOT LIKE or NOT IN a certain condition.
SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name NOT IN ('Walmart', 'Target', 'Nordstrom');

 SELECT *
 FROM web_events
 WHERE channel NOT IN ('organic', 'adwords');

-- AND & BETWEEN
-- These allow you to combine operations where all combined conditions must be true.
SELECT *
FROM orders
WHERE standard_qty > 1000 AND poster_qty = 0 AND gloss_qty = 0;

SELECT name
FROM accounts
WHERE name NOT LIKE 'C%' AND name LIKE '%s';

SELECT occurred_at, gloss_qty 
FROM orders
WHERE gloss_qty BETWEEN 24 AND 29;
--EXample
SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords') AND occurred_at BETWEEN '2016-01-01' AND '2017-01-01'
ORDER BY occurred_at DESC;

-- OR
-- This allow you to combine operations where at least one of the combined conditions must be true.
SELECT id
FROM ORDERS
WHERE gloss_qty > 4000 or poster_qty > 4000;

SELECT *
FROM ORDERS
WHERE standard_qty = 0 AND (
  gloss_qty > 1000 OR
  poster_qty > 1000);

SELECT *
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE 'W%') 
           AND ((primary_poc LIKE '%ana%' OR primary_poc LIKE '%Ana%') 
           AND primary_poc NOT LIKE '%eana%');