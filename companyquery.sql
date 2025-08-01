-- The Scenario
-- You are a new junior analyst on the HR team. Your manager has asked you to answer a question to help with an upcoming budget meeting.
-- Your Task:
-- "The Finance department needs to know the total annual payroll for each department. They also want to see the average salary for each department. Please provide a list of each department's name, its total salary expenditure, and its average salary. They would like to see the departments with the highest total payroll first."

-- This single task will require you to:
-- 1. Join the three tables (employees, salaries, and departments).
-- 2. Use aggregate functions (SUM and AVG).
-- 3. Use the GROUP BY clause.
-- 4. Use the ORDER BY clause.

SELECT d.department_name, SUM(s.salary) -- AVG(s.salary)
FROM departments AS d
INNER JOIN employees AS e
ON d.department_id = e.department_id
INNER JOIN salaries AS s
ON e.employee_id = s.employee_id
GROUP BY d.department_name
ORDER BY d.department_name DESC
;

SELECT d.department_name, AVG(s.salary)
FROM departments AS d
INNER JOIN employees AS e
ON d.department_id = e.department_id
INNER JOIN salaries AS s
ON e.employee_id = s.employee_id
GROUP BY d.department_name
ORDER BY d.department_name DESC
;

SELECT d.department_name, SUM(s.salary), AVG(s.salary)
FROM departments AS d
INNER JOIN employees AS e
ON d.department_id = e.department_id
INNER JOIN salaries AS s
ON e.employee_id = s.employee_id
GROUP BY d.department_name
ORDER BY d.department_name DESC
;
-- Fully right answer --
SELECT d.department_name, SUM(s.salary) AS total_payroll, AVG(s.salary) AS average_salary
FROM departments AS d
INNER JOIN employees AS e
ON d.department_id = e.department_id
INNER JOIN salaries AS s
ON e.employee_id = s.employee_id
GROUP BY d.department_name
ORDER BY total_payroll DESC
;

-- New Scenario: A Cross-Departmental Project
-- The Engineering department is planning a major new project and needs to assemble a team from different departments. They need to understand who the most experienced employees are across the company to find potential team leads.
-- Your Task:
-- "Your manager needs a report listing the full name of every employee, their department name, and the number of years they have been with the company. They want the list to be sorted from the most senior employees (those who have been with the company the longest) to the newest employees. Only include employees who have been with the company for at least 4 years."

-- To solve this, you will need to:
-- Join the employees and departments tables.
-- Calculate the number of years an employee has been with the company. You'll need to use a function to handle dates for this. (Don't worry, I'll give you a hint).
-- Filter the results using a WHERE clause.
-- Order the final results.

-- Hint: To calculate the difference in years between two dates, you can use MySQL's YEAR() function to extract the year from the current date and from the hire date, and then subtract them. For example, YEAR(CURDATE()) - YEAR(e.hire_date). CURDATE() is a MySQL function that returns the current date.

SELECT e.first_name AS employee_name, Year(current_date()) - YEAR(e.hire_date) AS years_at_company, d.department_name
FROM employees AS e
INNER JOIN departments AS d
ON e.department_id = d.department_id
WHERE Year(current_date()) - YEAR(e.hire_date) >= 4
ORDER BY years_at_company DESC
;

SELECT CONCAT(e.first_name, ' ' , e.last_name) AS employee_name, Year(current_date()) - YEAR(e.hire_date) AS years_at_company, d.department_name
FROM employees AS e
INNER JOIN departments AS d
ON e.department_id = d.department_id
WHERE Year(current_date()) - YEAR(e.hire_date) >= 4
ORDER BY years_at_company DESC
;