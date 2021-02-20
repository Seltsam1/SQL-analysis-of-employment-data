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


-- Department managers details (dept number, dept name, manager number, last name, first name)

-- Create view to join first 2 tables
CREATE VIEW manager_details AS 
SELECT dm.dept_no AS "Department Number", e.emp_no AS "Manager Number", 
       e.last_name AS "Last Name", 
       e.first_name AS "First Name"
FROM employees AS e
RIGHT JOIN dept_manager AS dm
ON e.emp_no = dm.emp_no;

-- Query to join 3rd table for final results
SELECT m."Department Number", d.dept_name AS "Department Name",
       m."Manager Number", m."Last Name", m."First Name"
FROM manager_details AS m
JOIN departments AS d
ON "Department Number" = d.dept_no;


-- Employee, emp number, last name, first name, deptartment name

-- COME BACK TO NUMBER 4

SELECT * FROM dept_emp;


-- 


-- First name, last name, sex for employees with first name Hercules and last name starts with B
SELECT first_name AS "First Name", last_name AS "Last Name", sex AS "Sex"
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


-- Clean up to drop views created in prior steps
DROP VIEW manager_details;