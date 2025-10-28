--1 Get all unique customer names from both tables
SELECT customer_name
FROM online_sales
UNION  -- Removes duplicates
SELECT customer_name
FROM store_sales;

--2 List all customer names from both tables including duplicates
SELECT customer_name
FROM online_sales
UNION ALL  -- Keeps duplicates
SELECT customer_name
FROM store_sales;

--3 Show all unique sale dates from both tables, sorted ascending
SELECT sale_date
FROM online_sales
UNION  -- Removes duplicates
SELECT sale_date
FROM store_sales
ORDER BY sale_date ASC;

--4 List all sale dates from both tables including duplicates
SELECT sale_date
FROM online_sales
UNION ALL  -- Keeps duplicates
SELECT sale_date
FROM store_sales;

--5 Combine both tables and show unique customers with purchases > 250
SELECT customer_name, amount
FROM online_sales
WHERE amount > 250
UNION  -- Removes duplicates
SELECT customer_name, amount
FROM store_sales
WHERE amount > 250;

--6 Combine all records from both tables including duplicates
SELECT customer_name, amount, sale_date
FROM online_sales
UNION ALL  -- Keeps all duplicates
SELECT customer_name, amount, sale_date
FROM store_sales;

--7 Combine both tables and indicate the sales source
SELECT customer_name, amount, sale_date, 'Online' AS source
FROM online_sales
UNION ALL
SELECT customer_name, amount, sale_date, 'Store' AS source
FROM store_sales;

--8 Find customers who appear in both online and store sales
SELECT customer_name,
       COUNT(*) AS occurrences
FROM (
    SELECT customer_name FROM online_sales
    UNION ALL
    SELECT customer_name FROM store_sales
) AS combined_sales
GROUP BY customer_name
HAVING COUNT(*) > 1;  -- Appears more than once across tables

--9 Calculate total sales amount across both tables
SELECT SUM(amount) AS total_amount
FROM (
    SELECT amount FROM online_sales
    UNION ALL
    SELECT amount FROM store_sales
) AS combined_sales;

--(optional challenge) List each customer with total combined purchases from both tables
SELECT customer_name,
       SUM(amount) AS total_spent
FROM (
    SELECT customer_name, amount FROM online_sales
    UNION ALL
    SELECT customer_name, amount FROM store_sales
) AS combined_sales
GROUP BY customer_name
ORDER BY total_spent DESC;
