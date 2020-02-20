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
