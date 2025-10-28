--1 Categorize products as Expensive, Mid-range, or Budget based on price
SELECT
    product_name,
    price,
    CASE
        WHEN price > 1000 THEN 'Expensive'                 -- Price over 1000
        WHEN price BETWEEN 100 AND 1000 THEN 'Mid-range'  -- Price between 100 and 1000
        ELSE 'Budget'                                     -- Price below 100
    END AS price_category
FROM products;

--2 Categorize orders as High Value, Medium Value, or Low Value
SELECT
    customer_name,
    amount,
    CASE
        WHEN amount >= 1000 THEN 'High Value'               -- Orders >= 1000
        WHEN amount BETWEEN 500 AND 999.99 THEN 'Medium Value' -- Orders 500–999.99
        ELSE 'Low Value'                                   -- Orders below 500
    END AS order_value_category
FROM orders;

--3 Assign position level based on department and salary
SELECT
    emp_name,
    department,
    salary,
    CASE
        WHEN department = 'IT' AND salary > 80000 THEN 'Senior IT'
        WHEN department = 'HR' AND salary > 55000 THEN 'Experienced HR'
        ELSE 'Staff'
    END AS position_level
FROM employees;

--4 Convert numeric scores into letter grades
SELECT
    student_name,
    score,
    CASE
        WHEN score >= 90 THEN 'A'
        WHEN score BETWEEN 80 AND 89 THEN 'B'
        WHEN score BETWEEN 70 AND 79 THEN 'C'
        WHEN score BETWEEN 60 AND 69 THEN 'D'
        ELSE 'F'
    END AS grade
FROM students;

--5 Categorize delivery speed based on delivery time
SELECT
    delivery_id,
    delivery_time_minutes,
    CASE
        WHEN delivery_time_minutes <= 30 THEN 'Fast'
        WHEN delivery_time_minutes BETWEEN 31 AND 60 THEN 'On Time'
        ELSE 'Late'
    END AS performance
FROM deliveries;

--6 Assign priority labels based on numeric priority
SELECT
    issue_type,
    priority,
    CASE
        WHEN priority = 3 THEN 'High'
        WHEN priority = 2 THEN 'Medium'
        WHEN priority = 1 THEN 'Low'
    END AS priority_label
FROM tickets;

--7 Calculate attendance percentage and assign status
SELECT
    student_id,
    (days_present * 100.0 / total_days) AS attendance_percentage,  -- Compute attendance %
    CASE
        WHEN (days_present * 100.0 / total_days) >= 90 THEN 'Excellent'
        WHEN (days_present * 100.0 / total_days) BETWEEN 75 AND 89 THEN 'Good'
        ELSE 'Needs Improvement'
    END AS attendance_status
FROM attendance;

--8 Categorize products based on stock quantity
SELECT
    product_id,
    stock_qty,
    CASE
        WHEN stock_qty = 0 THEN 'Out of Stock'      -- No stock available
        WHEN stock_qty BETWEEN 1 AND 4 THEN 'Low Stock'  -- Stock is low
        ELSE 'In Stock'                             -- Stock is sufficient
    END AS stock_status
FROM products_inventory;

--9 Categorize classes based on the number of enrolled students
SELECT
    subject,
    enrolled_students,
    CASE
        WHEN enrolled_students >= 25 THEN 'Large'       -- 25 or more students
        WHEN enrolled_students BETWEEN 10 AND 24 THEN 'Medium'  -- 10–24 students
        ELSE 'Small'                                   -- Fewer than 10 students
    END AS class_size_category
FROM classes;

--10 Determine discount eligibility based on payment method and amount
SELECT
    payment_id,
    payment_method,
    amount,
    CASE
        WHEN payment_method = 'Cash' AND amount >= 200 THEN 'Eligible for Discount'  -- Cash payments >= 200
        ELSE 'Not Eligible'                                                          -- All other cases
    END AS discount_eligibility
FROM payments;

