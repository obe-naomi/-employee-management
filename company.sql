-- Create a new database
CREATE DATABASE company;

-- Use the newly created database
USE company;

-- Table 1: departments
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

-- Populate departments table
INSERT INTO departments (department_id, department_name) VALUES
(1, 'Marketing'),
(2, 'Sales'),
(3, 'Engineering'),
(4, 'Human Resources'),
(5, 'Finance');

-- Table 2: employees
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    hire_date DATE,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Populate employees table
INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, department_id) VALUES
(101, 'John', 'Doe', 'jdoe@company.com', '555-1234', '2019-01-15', 1),
(102, 'Jane', 'Smith', 'jsmith@company.com', '555-5678', '2018-03-20', 2),
(103, 'Peter', 'Jones', 'pjones@company.com', '555-8765', '2020-05-10', 3),
(104, 'Mary', 'Brown', 'mbrown@company.com', '555-4321', '2019-07-22', 1),
(105, 'David', 'Davis', 'ddavis@company.com', '555-1111', '2017-11-05', 4),
(106, 'Susan', 'Wilson', 'swilson@company.com', '555-2222', '2021-02-18', 2),
(107, 'Chris', 'Evans', 'cevans@company.com', '555-3333', '2022-09-01', 3),
(108, 'Lisa', 'Taylor', 'ltaylor@company.com', '555-4444', '2020-04-12', 5),
(109, 'Paul', 'Walker', 'pwalker@company.com', '555-5555', '2018-08-30', 3),
(110, 'Karen', 'Miller', 'kmiller@company.com', '555-6666', '2020-10-25', 4);


-- Table 3: salaries
CREATE TABLE salaries (
    salary_id INT PRIMARY KEY,
    employee_id INT,
    salary DECIMAL(10, 2),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- Populate salaries table
INSERT INTO salaries (salary_id, employee_id, salary) VALUES
(1, 101, 60000.00),
(2, 102, 75000.00),
(3, 103, 85000.00),
(4, 104, 62000.00),
(5, 105, 55000.00),
(6, 106, 78000.00),
(7, 107, 95000.00),
(8, 108, 70000.00),
(9, 109, 88000.00),
(10, 110, 60000.00);
  
