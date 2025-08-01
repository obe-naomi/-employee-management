-- The Scenario
-- You are a new junior analyst on the HR team. Your manager has asked you to answer a question to help with an upcoming budget meeting.
-- Your Task:
-- "The Finance department needs to know the total annual payroll for each department. They also want to see the average salary for each department. Please provide a list of each department's name, its total salary expenditure, and its average salary. They would like to see the departments with the highest total payroll first."

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

SELECT CONCAT(e.first_name, ' ' , e.last_name) AS employee_name, Year(current_date()) - YEAR(e.hire_date) AS years_at_company, d.department_name
FROM employees AS e
INNER JOIN departments AS d
ON e.department_id = d.department_id
WHERE Year(current_date()) - YEAR(e.hire_date) >= 4
ORDER BY years_at_company DESC
;

-- New Scenario: A Staffing Report
-- Let's imagine the company has recently acquired another small company, and some of the employees from the new acquisition haven't been assigned to a department yet. We need to identify these employees.
-- Your Task:
-- "Your manager wants a report of all employees in the company. For each employee, they want to see their full name and their department name. Your report must include all employees, even those who have not yet been assigned to a department."

SELECT CONCAT(e.first_name, ' ' , e.last_name) AS full_name, d.department_name
FROM employees AS e
LEFT JOIN departments AS d
ON e.department_id = d.department_id
;

-- New Scenario:
-- "Based on your last report, your manager now wants a simple list of just the employees who have not yet been assigned to a department. This will help them prioritize the next steps for onboarding."

SELECT CONCAT(e.first_name, ' ' , e.last_name) AS full_name, d.department_name
FROM employees AS e
LEFT JOIN departments AS d
ON e.department_id = d.department_id
WHERE d.department_name IS NULL
;