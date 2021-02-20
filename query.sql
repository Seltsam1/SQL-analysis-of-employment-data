-- Queries (SQL-analysis-of-employment-data)

-- NOTE run schema.sql code before running queries


-- Employee details (number, last name, first name, sex, and salary)
SELECT * FROM employees LIMIT 50;

SELECT e.emp_no AS "Number", e.last_name AS "Last Name", 
	   e.first_name AS "First Name", e.sex AS "Sex"
FROM employees AS e
LIMIT 20;

SELECT e.emp_no AS "Number", e.last_name AS "Last Name", 
	   e.first_name AS "First Name", e.sex AS "Sex",
	   s.salary AS "Salary"
FROM employees AS e
LEFT JOIN salaries AS s
ON e.emp_no = s.emp_no
LIMIT 20;