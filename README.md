SQL Exercises Portfolio

Welcome to my SQL Exercises repository! This project demonstrates my proficiency in SQL across various concepts, including querying, joins, aggregate functions,
date/time functions, conditional logic, and data cleaning. The exercises are based on multiple sample datasets covering employees, students, sales, products, and more.

Table of Contents

1. Basic Queries
2. Aggregate Functions
3. JOIN Operations
4. CASE Statements
5. Date and Time Functions
6. Handling NULL Values
7. Combining Tables with UNION
8. Author

Basic Queries

SELECT: Retrieve all columns or specific columns from a table.
SELECT DISTINCT: Find unique values in a column.
ORDER BY: Sort results by one or more columns.
LIMIT: Display a specific number of rows.

Example:
-- Retrieve all employees
SELECT * FROM employees;

-- List unique departments
SELECT DISTINCT department FROM employees;

-- Top 5 highest-paid employees
SELECT first_name, last_name, salary
FROM employees
ORDER BY salary DESC
LIMIT 5;

Aggregate Functions

COUNT, SUM, AVG, MIN, MAX to analyze datasets.
GROUP BY for aggregation per category.
HAVING to filter aggregated results.

Example:
-- Average age per department
SELECT department, AVG(age) AS avg_age
FROM students
GROUP BY department;

-- Count students per department with more than 1 student
SELECT department, COUNT(*) AS student_count
FROM students
GROUP BY department
HAVING COUNT(*) > 1;

Filtering and Conditions

WHERE for row-level filtering.
AND, OR, NOT, IN, BETWEEN to combine conditions.
CASE statements for conditional classification.

Example:
-- Students aged between 21 and 23
SELECT student_id, name, age
FROM students
WHERE age BETWEEN 21 AND 23;

-- Classify products by price
SELECT product_name, price,
CASE
  WHEN price > 1000 THEN 'Expensive'
  WHEN price BETWEEN 100 AND 1000 THEN 'Mid-range'
  ELSE 'Budget'
END AS price_category
FROM products;

JOIN Operations

INNER JOIN: Match rows present in both tables.
LEFT JOIN: Include all rows from the left table, even if no match exists.
FULL OUTER JOIN: Include all rows from both tables.

Example:
-- Students with grades
SELECT A.student_id, student_name, grade
FROM students AS A
INNER JOIN grades AS B
ON A.student_id = B.student_id;

-- Total sales per region, including regions with no sales
SELECT A.region_id, region_name, SUM(amount) AS total_sales
FROM regions AS A
LEFT JOIN sales AS B
ON A.region_id = B.region_id
GROUP BY A.region_id, region_name;

Date and Time Functions

DATEADD: Add or subtract time intervals.
DATEDIFF: Calculate the difference between dates.
TO_CHAR / DATEFROMPARTS: Format or construct dates.
CURRENT_DATE / CURRENT_TIMESTAMP: Work with today’s date/time.

Example:
-- Add 6 months to the hire date
SELECT emp_id, name, hire_date,
DATEADD(MONTH, 6, hire_date) AS hire_plus_6_months
FROM Employees;

-- Calculate days remaining until events
SELECT event_id, event_name,
DATEDIFF(DAY, CURRENT_DATE, event_date) AS days_remaining
FROM Events;

Handling NULL Values

IFNULL / ISNULL / COALESCE to handle missing data.
Replace NULLs with default values for reporting.

Example:
-- Display salary as 0 if NULL
SELECT employee_id, name,
IFNULL(salary, 0) AS salary_with_default
FROM Employees;

-- Show email or 'No Email'
SELECT customer_id, name,
COALESCE(email, 'No Email') AS email_display
FROM Customers;

Combining Tables with UNION

UNION: Combine results and remove duplicates.
UNION ALL: Combine results, keeping duplicates.

Example:
-- Unique customer names from online and store sales
SELECT customer_name FROM online_sales
UNION
SELECT customer_name FROM store_sales;

-- Total combined sales per customer
SELECT customer_name, SUM(amount) AS total_spent
FROM (
  SELECT customer_name, amount FROM online_sales
  UNION ALL
  SELECT customer_name, amount FROM store_sales
) AS combined_sales
GROUP BY customer_name
ORDER BY total_spent DESC;

Author

Name: Phindile Mnisi
Email: mnisiphindile21@gmail.com
