-- Add 6 months to each employee's hire date
SELECT 
    emp_id,
    name,
    hire_date,
    DATEADD(MONTH, 6, hire_date) AS hire_plus_6_months
FROM Employees;

-- Find age in days from date of birth to today
SELECT 
    student_id,
    name,
    DATEDIFF(DAY, dob, CURRENT_DATE) AS age_in_days
FROM Students;

-- Calculate number of days left until each event
SELECT 
    event_id,
    event_name,
    DATEDIFF(DAY, CURRENT_DATE, event_date) AS days_remaining
FROM Events;

-- Calculate number of days between invoice issue and due dates
SELECT 
    invoice_id,
    issue_date,
    due_date,
    DATEDIFF(DAY, issue_date, due_date) AS days_between
FROM Invoices;

-- Format start_date as 'Month YYYY'
SELECT 
    course_id,
    name,
    TO_CHAR(start_date, 'Month YYYY') AS formatted_date
FROM Courses;

-- Construct a date from year, month, and day
SELECT 
    member_id,
    DATEFROMPARTS(start_year, start_month, start_day) AS full_start_date
FROM Memberships;

-- Add 1 year to each subscription renewal date
SELECT 
    sub_id,
    plan,
    DATEADD(YEAR, 1, renewal_date) AS extended_renewal_date
FROM Subscriptions;

-- Display the current date and calculate days since each order
SELECT 
    order_id,
    order_date,
    CURRENT_DATE AS today_date,                          -- Today's date
    DATEDIFF(DAY, order_date, CURRENT_DATE) AS days_since_order  -- Days elapsed since order_date
FROM Orders;

-- Extract the year from training_date
SELECT 
    training_id,
    topic,
    EXTRACT(YEAR FROM training_date) AS training_year  -- Get the year part of the date
FROM Trainings;

-- Calculate number of days remaining until license expiry
SELECT 
    driver_id,
    license_expiry,
    DATEDIFF(DAY, CURRENT_DATE, license_expiry) AS days_left  -- Days from today to expiry
FROM Drivers;

-- Display current timestamp and calculate seconds elapsed since the message was sent
SELECT 
    message_id,
    sent_timestamp,
    CURRENT_TIMESTAMP AS current_timestamp,                         -- Current date and time
    DATEDIFF(SECOND, sent_timestamp, CURRENT_TIMESTAMP) AS seconds_since_sent  -- Seconds elapsed
FROM Messages;

-- Calculate restock date by adding 15 days to the return date
SELECT 
    return_id,
    return_date,
    DATEADD(DAY, 15, return_date) AS restock_date  -- Add 15 days to return_date
FROM Returns;

-- Convert assigned_on (string) to proper date format
SELECT 
    assign_id,
    TO_DATE(assigned_on, 'YYYY-MM-DD') AS assigned_on_date  -- Parse string to date
FROM Assignments;

-- Format scheduled_time as a readable string
SELECT 
    meeting_id,
    TO_CHAR(scheduled_time, 'Month DD, YYYY "at" HH:MI AM') AS formatted_meeting_time
FROM Meetings;

