-- Queries (SQL-analysis-of-employment-data)

-- NOTE run schema.sql code before running queries

--------------Query 1

-- Employee details (number, last name, first name, sex, and salary)
SELECT e.emp_no AS "Number", e.last_name AS "Last Name", 
	   e.first_name AS "First Name", e.sex AS "Sex",
	   s.salary AS "Salary"
FROM employees AS e
LEFT JOIN salaries AS s
ON e.emp_no = s.emp_no;


--------------Query 2

-- First name, last name, and hire date for employees hired in year 1986
SELECT first_name AS "First Name", last_name AS "Last Name", hire_date AS "Hire Date"
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = '1986';


--------------Query 3

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


--------------Query 4

-- Employee, emp number, last name, first name, deptartment name

-- Creat view with department and dept_emp
CREATE VIEW department_details AS
SELECT e.emp_no, e.dept_no, d.dept_name
FROM dept_emp AS e
LEFT JOIN departments AS d
ON e.dept_no = d.dept_no;

SELECT * FROM department_details;

-- Note, some employees have multiple departments
SELECT e.emp_no AS "Employee Numnber", e.last_name AS "Last Name",
	   e.first_name AS "First Name", d.dept_name AS "Department Name"
FROM employees AS e
JOIN department_details AS d
ON e.emp_no = d.emp_no;


--------------Query 5

-- First name, last name, sex for employees with first name Hercules and last name starts with B
SELECT first_name AS "First Name", last_name AS "Last Name", sex AS "Sex"
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


--------------Query 6



-- Employees from sale department: employee number, last name, first name, dept name
SELECT e.emp_no AS "Employee Number", e.last_name AS "Last Name",
	   e.first_name AS "First Name", 
	   (
		SELECT d.dept_name AS "Department Name"
		FROM departments
		WHERE dept_no IN
		   (
		   SELECT 
		   )
	   )
FROM employees AS e;
		   

-- Clean up to drop views created in prior steps
DROP VIEW manager_details;
DROP VIEW department_details;