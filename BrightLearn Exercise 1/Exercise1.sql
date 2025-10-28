-- Retrieve all columns and all rows from the employees table
SELECT * 
FROM employees;   -- The asterisk (*) selects every column in the table

-- Retrieve all unique department names from the employees table
SELECT DISTINCT department
FROM employees;   -- DISTINCT ensures that duplicate department names are removed

-- Select employee names and salaries, ordered from highest to lowest salary
SELECT first_name, 
       last_name, 
       salary
FROM employees
ORDER BY salary DESC;   -- DESC means descending order (highest → lowest)

-- Select the top 5 employees with the highest salaries
SELECT first_name, 
       last_name, 
       salary
FROM employees
ORDER BY salary DESC   -- Sort salaries from highest to lowest
LIMIT 5;               -- Return only the first 5 rows after sorting

-- Select employees who belong to the IT department
SELECT first_name, 
       last_name, 
       department
FROM employees
WHERE department = 'IT';   -- Filter rows where the department is 'IT'

-- Select employees who are in the Finance department and earn more than 58,000
SELECT first_name, 
       last_name, 
       department, 
       salary
FROM employees
WHERE department = 'Finance'    -- Must be in the Finance department
  AND salary > 58000;           -- Must have salary greater than 58,000

-- Select employees who work in either the HR or Marketing departments
SELECT first_name, 
       last_name, 
       department
FROM employees
WHERE department = 'HR'             -- Condition 1: department is HR
   OR department = 'Marketing';     -- Condition 2: department is Marketing

-- Select employees whose department is NOT IT
SELECT first_name, 
       last_name, 
       department
FROM employees
WHERE NOT department = 'IT';   -- Exclude employees in the IT department

-- Select employees who belong to HR, IT, or Finance departments
SELECT first_name, 
       last_name, 
       department
FROM employees
WHERE department IN ('HR', 'IT', 'Finance');  -- IN allows matching multiple values

-- Select IT employees earning more than 50,000 and located in New York
SELECT first_name, 
       last_name, 
       department, 
       salary, 
       city
FROM employees
WHERE department = 'IT'      -- Must be in IT
  AND salary > 50000         -- Must earn more than 50,000
  AND city = 'New York';     -- Must be located in New York

-- Select employees in Finance or Marketing with salary > 52,000, ordered by salary descending
SELECT first_name, 
       last_name, 
       department, 
       salary
FROM employees
WHERE (department = 'Finance' OR department = 'Marketing')  -- Either Finance or Marketing
  AND salary > 52000                                        -- Salary greater than 52,000
ORDER BY salary DESC;                                       -- Sort by salary from highest to lowest

-- Find distinct cities for employees not in IT or HR departments
SELECT DISTINCT city
FROM employees
WHERE department NOT IN ('IT', 'HR');   -- Excludes IT and HR departments

-- Select employees not in Finance with salary > 50,000, ordered by hire date ascending
SELECT first_name, 
       last_name, 
       department, 
       salary, 
       hire_date
FROM employees
WHERE department != 'Finance'     -- Exclude Finance department
  AND salary > 50000              -- Salary greater than 50,000
ORDER BY hire_date ASC;           -- Sort from oldest to newest hire date

-- Select employees in Chicago or Los Angeles, and in IT or Marketing, limit to 3 results
SELECT first_name, 
       last_name, 
       department, 
       city
FROM employees
WHERE city IN ('Chicago', 'Los Angeles')   -- Cities filter
  AND department IN ('IT', 'Marketing')    -- Departments filter
LIMIT 3;                                   -- Return only first 3 matching rows

-- Complex query: IT or Finance employees, not in San Francisco, salary > 55,000, top 5 by salary
SELECT first_name, 
       last_name, 
       department, 
       salary, 
       city
FROM employees
WHERE (department = 'IT' OR department = 'Finance')  -- Department filter
  AND city != 'San Francisco'                        -- Exclude San Francisco
  AND salary > 55000                                 -- Salary filter
ORDER BY salary DESC                                  -- Sort highest salary first
LIMIT 5;                                             -- Return top 5 employees


