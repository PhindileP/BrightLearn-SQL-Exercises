-- Display all employees and replace NULL salaries with 0
SELECT 
    employee_id,
    name,
    IFNULL(salary, 0) AS salary_with_default  -- If salary is NULL, show 0
FROM Employees;

-- Show employee names with department, replacing NULL with 'Not Assigned'
SELECT 
    employee_id,
    name,
    COALESCE(department, 'Not Assigned') AS department_name  -- Replace NULL with 'Not Assigned'
FROM Employees;

-- Retrieve orders where customer_id is NULL
SELECT 
    order_id,
    customer_id
FROM Orders
WHERE ISNULL(customer_id);  -- Returns TRUE if customer_id is NULL

-- Display all orders and mark delivery_date as 'Pending' if NULL
SELECT 
    order_id,
    customer_id,
    COALESCE(delivery_date, 'Pending') AS delivery_status  -- Replace NULL with 'Pending'
FROM Orders;

-- Show all students and replace NULL grades with 0
SELECT 
    student_id,
    name,
    IFNULL(grade, 0) AS final_grade  -- Replace NULL grade with 0
FROM Students;

SELECT COUNT(*) AS not_graded_count
FROM Students
WHERE grade IS NULL;  -- Count rows where grade is NULL

SELECT product_id, name,
       price - IFNULL(discount, 0) AS final_price  -- If discount is NULL, treat as 0
FROM Products;

-- count customers with no email
SELECT COUNT(*) AS missing_email_count
FROM Customers
WHERE email IS NULL;

-- customers with email or no email
SELECT customer_id, name,
       COALESCE(email, 'No Email') AS email_display
FROM Customers;

-- payment method or unknown
SELECT payment_id,
       COALESCE(method, 'Unknown') AS method_display,
       status
FROM Payments;

-- item quantity, replace with 0
SELECT item_id, item_name,
       IFNULL(quantity, 0) AS quantity_checked
FROM Inventory;

-- first available reward, bonus, commission, 0
SELECT emp_id,
       COALESCE(bonus, commission, 0) AS first_available_reward
FROM Employees_Extra;

-- count classes without assigned room
SELECT COUNT(*) AS no_room_count
FROM Classes
WHERE room IS NULL;

-- attendance with status
SELECT student_id, date,
       COALESCE(status, 'Not Marked') AS attendance_status
FROM Attendance;

-- bank accounts with defaults
SELECT account_id,
       COALESCE(account_type, 'Unknown') AS type_display,
       IFNULL(balance, 0) AS balance_checked
FROM Bank_Accounts;

-- project start date, show 'TBD' if Null
SELECT project_id, title,
       COALESCE(start_date, 'TBD') AS start_display
FROM Projects;

-- Reviews with default comment and rating
SELECT review_id, product_id,
       COALESCE(comment, 'No Comment') AS comment_display,
       IFNULL(rating, 0) AS rating_display
FROM Reviews;

-- supplier contact number
SELECT supplier_id, name,
       COALESCE(phone, alt_phone, 'No Contact') AS contact_number
FROM Suppliers;

-- user settings default
SELECT user_id,
       COALESCE(theme, 'Light') AS theme_set,
       COALESCE(language, 'English') AS language_set,
       COALESCE(timezone, 'UTC') AS timezone_set
FROM User_Settings;

--Maintenance log with defaults
SELECT record_id, machine_id,
       COALESCE(issue, 'Unknown Issue') AS issue_log,
       COALESCE(technician, 'Not Assigned') AS technician_name
FROM Maintenance;


