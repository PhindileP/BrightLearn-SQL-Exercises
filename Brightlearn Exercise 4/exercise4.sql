-- Retrieve students who have grades recorded
SELECT
    A.student_id,
    A.student_name,
    B.grade
FROM students AS A               -- Alias A for students table
INNER JOIN grades AS B           -- Alias B for grades table
    ON A.student_id = B.student_id;  -- Join condition matching student_id

-- Retrieve all employees and their corresponding department names
-- Include employees even if they are not assigned to any department
SELECT 
    A.emp_id,
    A.emp_name,
    B.dept_name
FROM employees AS A              -- Alias A for employees table
LEFT JOIN departments AS B       -- Alias B for departments table
    ON A.emp_id = B.emp_id;      -- Join condition matching employee ID

-- Retrieve all products and their sold quantities
-- Include products even if they have no sales, and sales not linked to products
SELECT 
    COALESCE(A.product_id, B.product_id) AS product_id,  -- Use COALESCE to get non-NULL product_id
    COALESCE(A.product_name, B.product_name) AS product_name,  -- Ensure product_name is included
    B.quantity                                          -- Quantity sold (NULL if no sale)
FROM products AS A
FULL OUTER JOIN sales AS B
    ON A.product_id = B.product_id;                    -- Join on product_id

-- Calculate total sales per region, including regions with no sales
SELECT 
    A.region_id,
    A.region_name,
    SUM(B.amount) AS total_sales     -- Sum of sales per region; NULL if no sales
FROM regions AS A
LEFT JOIN sales AS B
    ON A.region_id = B.region_id     -- Match sales to regions
GROUP BY 
    A.region_id, 
    A.region_name;                   -- Group by region to aggregate sales

-- Assign attendance status to students based on days present
SELECT 
    A.student_id,
    A.name,
    B.days_present,
    CASE
        WHEN B.days_present >= 15 THEN 'Excellent'            -- 15 or more days
        WHEN B.days_present BETWEEN 6 AND 14 THEN 'Needs Improvement'
        WHEN B.days_present <= 5 THEN 'Poor Attendance'
        ELSE 'No Record'                                      -- No attendance record
    END AS attendance_status
FROM students AS A
LEFT JOIN attendance AS B
    ON A.student_id = B.student_id;                          -- Match students to attendance records

-- Count the number of tasks for each project (only projects that have tasks)
SELECT 
    A.project_id,
    A.name AS project_name,
    COUNT(B.task_id) AS task_count     -- Count of tasks per project
FROM projects AS A
INNER JOIN tasks AS B
    ON A.project_id = B.project_id    -- Match tasks to their projects
GROUP BY 
    A.project_id, 
    A.name;                            -- Group by project to aggregate task count

-- Classify customers as 'Returned' or 'No Return' and filter orders > 100
SELECT 
    COALESCE(A.cust_id, B.cust_id) AS cust_id,  -- Use non-NULL customer ID from either table
    A.order_total,
    B.return_total,
    CASE
        WHEN B.return_total IS NOT NULL THEN 'Returned'  -- Customer made a return
        ELSE 'No Return'                                 -- No return recorded
    END AS return_status
FROM orders AS A
FULL OUTER JOIN returns AS B
    ON A.cust_id = B.cust_id          -- Match orders to returns
WHERE A.order_total > 100;           -- Only include orders with total > 100

-- Count how many times each user logged in
SELECT 
    A.user_id,
    A.name,
    COUNT(B.login_date) AS login_count   -- Count of login entries per user
FROM users AS A
LEFT JOIN logins AS B
    ON A.user_id = B.user_id            -- Match users with their login records
GROUP BY 
    A.user_id, 
    A.name                               -- Group by user to aggregate login counts
ORDER BY 
    login_count DESC;                     -- Sort users by login count in descending order

-- Show all teachers and their assigned subjects; label 'No Subject Assigned' if none
SELECT 
    A.teacher_id,
    A.teacher_name,
    COALESCE(B.subject_name, 'No Subject Assigned') AS subject_name  -- Replace NULL with label
FROM teachers AS A
LEFT JOIN subjects AS B
    ON A.teacher_id = B.teacher_id       -- Match teachers with their subjects
ORDER BY 
    A.teacher_name ASC;                  -- Sort by teacher name alphabetically

