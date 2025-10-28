--1 Select unique department names from the students table
SELECT DISTINCT department
FROM students;

--2 Select each department and calculate the average age of its students
SELECT department, 
       AVG(age) AS avg_age   -- Compute the average age and rename the column as 'avg_age'
FROM students
GROUP BY department;         -- Group records by department so each department's average is calculated separately

--3 Count how many students belong to each department
SELECT department, 
       COUNT(*) AS student_count   -- Count all students in each department
FROM students
GROUP BY department                -- Group by department to perform the count per group
HAVING COUNT(*) > 1;               -- Show only departments that have more than one student

--4 Select student details for those aged between 21 and 23 (inclusive)
SELECT student_id, 
       name, 
       age, 
       department
FROM students
WHERE age BETWEEN 21 AND 23;   -- The BETWEEN operator includes both 21 and 23

--5 Select students who belong to IT or HR departments and are older than 21
SELECT student_id, 
       name, 
       age, 
       department
FROM students
WHERE (department IN ('IT', 'HR'))   -- Filters only students in IT or HR
  AND age > 21;                      -- Further filters those older than 21

--6 Calculate total course credits for each department
SELECT department, 
       SUM(credits) AS total_credits   -- Sum the credits per department
FROM courses
GROUP BY department                     -- Group results by department
HAVING SUM(credits) > 5;                -- Only show departments where total credits exceed 5

--7 Select course details where the number of credits is not equal to 4
SELECT course_id, 
       course_name, 
       department, 
       credits
FROM courses
WHERE credits <> 4;   -- '<>' means 'not equal to' in SQL

--8 Select the top 3 courses with the highest credit values
SELECT course_id, 
       course_name, 
       credits
FROM courses
ORDER BY credits DESC    -- Sort courses from highest to lowest credits
LIMIT 3;                 -- Return only the top 3 results

--9 Retrieve overall grade statistics from the enrollments table
SELECT MAX(grade) AS max_grade,   -- Highest grade value
       MIN(grade) AS min_grade,   -- Lowest grade value
       AVG(grade) AS avg_grade    -- Average grade across all enrollments
FROM enrollments;

--10 Count the total number of enrollments for each course
SELECT course_id, 
       COUNT(*) AS enrollment_count   -- Count all enrollment records per course
FROM enrollments
GROUP BY course_id;                   -- Group results by course to count enrollments for each one

--11 Calculate total salary and total bonus for each department
SELECT department,
       SUM(salary) AS total_salary,   -- Add up all salaries in each department
       SUM(bonus) AS total_bonus      -- Add up all bonuses in each department
FROM salaries
GROUP BY department;                  -- Group by department to perform aggregation

--12 Find departments whose average salary exceeds 55,000
SELECT department, 
       AVG(salary) AS avg_salary        -- Calculate the average salary per department
FROM salaries
GROUP BY department                     -- Group by department to compute averages separately
HAVING AVG(salary) > 55000;             -- Filter to only include departments with avg salary > 55,000

--13 Select employees whose total compensation (salary + bonus) exceeds 60,000
SELECT employee_id, 
       name, 
       salary, 
       bonus,
       (salary + bonus) AS total_compensation   -- Calculate total compensation
FROM salaries
WHERE (salary + bonus) > 60000;                 -- Filter employees with total pay above 60,000

--14 Calculate total and average project budgets by department
SELECT department, 
       SUM(budget) AS total_budget,    -- Total budget for each department
       AVG(budget) AS avg_budget       -- Average budget per project in each department
FROM projects
GROUP BY department                    -- Group data by department
HAVING AVG(budget) > 70000;            -- Only include departments with avg budget above 70,000

--15 Select projects with budgets between 50,000 and 120,000 
-- while excluding any projects from the Marketing department
SELECT project_id, 
       project_name, 
       department, 
       budget
FROM projects
WHERE budget BETWEEN 50000 AND 120000   -- Include only budgets in this range (inclusive)
  AND department <> 'Marketing';        -- Exclude projects belonging to the Marketing department
