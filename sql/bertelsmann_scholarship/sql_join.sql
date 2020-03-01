-- Normalization
-- When creating a database, it is really important to think about how data will be stored. 
-- This is known as normalization, and it is a huge part of most SQL classes. 
-- If you are in charge of setting up a new database, it is important to have a thorough understanding of database normalization.
-- here are essentially three ideas that are aimed at database normalization:
--  - Are the tables storing logical groupings of the data?
--  - Can I make changes in a single location, rather than in many tables for the same information?
--  - Can I access and manipulate data quickly and efficiently?

-- Inner Join

-- Again - JOINs are useful for allowing us to pull data from multiple tables. This is both simple and powerful all at the same time.
-- With the addition of the JOIN statement to our toolkit, we will also be adding the ON statement.
-- We use ON clause to specify a JOIN condition which is a logical statement to combine the table in FROM and JOIN statements.

SELECT DISTINCT accounts.id, accounts.name
FROM accounts
JOIN orders
ON accounts.id = orders.account_id;

-- 1. Try pulling all the data from the accounts table, and all the data from the orders table.
SELECT orders.*, accounts.*
FROM accounts
JOIN orders
ON accounts.id = orders.account_id;
-- 2. Try pulling standard_qty, gloss_qty, and poster_qty from the orders table, and the website and the primary_poc from the accounts table.
SELECT orders.standard_qty, orders.gloss_qty, orders.poster_qty, accounts.website, accounts.primary_poc
FROM orders
JOIN accounts
ON orders.account_id = accounts.id

-- JOIN three tables
SELECT *
FROM web_events
JOIN accounts
ON web_events.account_id = accounts.id
JOIN orders
ON accounts.id = orders.account_id

-- 1. Provide a table for all web_events associated with account name of Walmart. There should be three columns. 
-- Be sure to include the primary_poc, time of the event, and the channel for each event. 
-- Additionally, you might choose to add a fourth column to assure only Walmart events were chosen.
SELECT acc.primary_poc, we.occurred_at, we.channel
FROM web_events AS we
JOIN accounts as acc
ON we.account_id = acc.id
WHERE acc.name = 'Walmart'

-- 2. Provide a table that provides the region for each sales_rep along with their associated accounts. 
-- Your final table should include three columns: the region name, the sales rep name, and the account name. 
-- Sort the accounts alphabetically (A-Z) according to account name.
SELECT r.name, sr.name, acc.name
FROM sales_reps as sr
JOIN accounts as acc
ON acc.sales_rep_id = sr.id
JOIN region as r
ON sr.region_id = r.id
ORDER BY acc.name

-- 3. Provide the name for each region for every order, as well as the account name \ 
-- and the unit price they paid (total_amt_usd/total) for the order. 
-- Your final table should have 3 columns: region name, account name, and unit price. 
-- A few accounts have 0 for total, so I divided by (total + 0.01) to assure not dividing by zero.
SELECT r.name region, a.name account, 
       o.total_amt_usd/(o.total + 0.01) unit_price
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id;

-- Outer join (https://www.w3resource.com/sql/joins/perform-a-full-outer-join.php)
-- Provide a table that provides the region for each sales_rep along with their associated accounts. 
-- This time only for the Midwest region. 
-- Your final table should include three columns: the region name, the sales rep name, and the account name. 
-- Sort the accounts alphabetically (A-Z) according to account name.
select r.name r_name, s.name s_name, acc.name acc_name
from region as r
join sales_reps as s
on s.region_id = r.id
join accounts as acc
on acc.sales_rep_id = s.id
where r.name = 'Midwest'
order by acc.name

-- Provide a table that provides the region for each sales_rep along with their associated accounts. 
-- This time only for accounts where the sales rep has a first name starting with S and in the Midwest region. 
-- Your final table should include three columns: the region name, the sales rep name, and the account name. 
-- Sort the accounts alphabetically (A-Z) according to account name.
SELECT r.name region, s.name rep, a.name account
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
WHERE r.name = 'Midwest' AND s.name LIKE 'S%'
ORDER BY a.name;

-- Provide a table that provides the region for each sales_rep along with their associated accounts. 
-- This time only for accounts where the sales rep has a last name starting with K and in the Midwest region. 
-- Your final table should include three columns: the region name, the sales rep name, and the account name. 
-- Sort the accounts alphabetically (A-Z) according to account name.
SELECT r.name region, s.name rep, a.name account
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
WHERE r.name = 'Midwest' AND s.name LIKE '% K%'
ORDER BY a.name;


-- Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. 
-- However, you should only provide the results if the standard order quantity exceeds 100. Your final table should have 3 columns: 
-- region name, account name, and unit price. In order to avoid a division by zero error, adding .01 to the denominator here is helpful total_amt_usd/(total+0.01).
Select r.name r_name, acc.name acc_name, (total_amt_usd/(total+0.01)) unit_price
From orders o
Join accounts acc
On o.account_id = acc.id
Join sales_reps s
On acc.sales_rep_id = s.id
Join region r
On s.region_id = r.id
Where o.standard_qty > 100;

-- Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. 
-- However, you should only provide the results if the standard order quantity exceeds 100 and the poster order quantity exceeds 50.
--  Your final table should have 3 columns: region name, account name, and unit price. Sort for the smallest unit price first. In order to avoid a division by zero error, adding .01 to the denominator here is helpful (total_amt_usd/(total+0.01).
SELECT r.name region, a.name account, o.total_amt_usd/(o.total + 0.01) unit_price
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
WHERE o.standard_qty > 100 AND o.poster_qty > 50
ORDER BY unit_price;

-- Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. 
-- However, you should only provide the results if the standard order quantity exceeds 100 and the poster order quantity exceeds 50.
--  Your final table should have 3 columns: region name, account name, and unit price. Sort for the largest unit price first. In order to avoid a division by zero error, adding .01 to the denominator here is helpful (total_amt_usd/(total+0.01).
SELECT r.name region, a.name account, o.total_amt_usd/(o.total + 0.01) unit_price
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
WHERE o.standard_qty > 100 AND o.poster_qty > 50
ORDER BY unit_price DESC;

-- What are the different channels used by account id 1001? 
-- Your final table should have only 2 columns: account name and the different channels. 
-- You can try SELECT DISTINCT to narrow down the results to only the unique values.
SELECT DISTINCT a.name, w.channel
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
WHERE a.id = '1001';

-- Find all the orders that occurred in 2015. Your final table should have 4 columns: 
-- occurred_at, account name, order total, and order total_amt_usd.
SELECT o.occurred_at, a.name, o.total, o.total_amt_usd
FROM accounts a
JOIN orders o
ON o.account_id = a.id
WHERE o.occurred_at BETWEEN '01-01-2015' AND '01-01-2016'
ORDER BY o.occurred_at DESC;


