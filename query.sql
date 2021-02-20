-- Queries (SQL-analysis-of-employment-data)

-- NOTE run schema.sql code before running queries


-- Employee details (number, last name, first name, sex, and salary)
SELECT e.emp_no AS "Number", e.last_name AS "Last Name", 
	   e.first_name AS "First Name", e.sex AS "Sex",
	   s.salary AS "Salary"
FROM employees AS e
LEFT JOIN salaries AS s
ON e.emp_no = s.emp_no;


-- First name, last name, and hire date for employees hired in year 1986
SELECT first_name AS "First Name", last_name AS "Last Name", hire_date AS "Hire Date"
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = '1986';


-- Department managers details 
-- (dept number, dept name, manager number, last name, first name)
SELECT * FROM dept_manager;

SELECT * FROM departments;

SELECT * FROM employees LIMIT 10;

SELECT dm.dept_no AS "Department Number", e.emp_no AS "Manager Number", 
       e.last_name AS "Last Name", 
       e.first_name AS "First Name"
FROM employees AS e
JOIN dept_manager AS dm
ON e.emp_no = dm.emp_no
LIMIT 10;

