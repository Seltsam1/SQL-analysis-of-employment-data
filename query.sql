-- Queries (SQL-analysis-of-employment-data)

-- NOTE run schema.sql code before running queries

--------------Query 1

-- Employee details (number, last name, first name, sex, and salary)
SELECT e.emp_no AS "Employee Number", e.last_name AS "Last Name", 
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
SELECT dm.dept_no AS "Department Number", 
       d.dept_name AS "Department Name",
       e.emp_no AS "Manager Number", 
       e.last_name AS "Last Name", 
       e.first_name AS "First Name"
FROM employees AS e
RIGHT JOIN dept_manager AS dm
ON e.emp_no = dm.emp_no
JOIN departments as D
ON dm.dept_no = d.dept_no;


--------------Query 4

-- Employee, emp number, last name, first name, deptartment name
SELECT de.emp_no AS "Employee Numnber", e.last_name AS "Last Name",
       e.first_name AS "First Name", d.dept_name AS "Department Name"
FROM dept_emp AS de
INNER JOIN departments AS d
ON de.dept_no = d.dept_no
INNER JOIN employees AS e
ON e.emp_no = de.emp_no;


--------------Query 5

-- First name, last name, sex for employees with first name Hercules and last name starts with B
SELECT first_name AS "First Name", last_name AS "Last Name", sex AS "Sex"
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


--------------Query 6

-- Employees of sales department: employee number, last name, first name, department
SELECT de.emp_no AS "Employee Numnber", e.last_name AS "Last Name",
       e.first_name AS "First Name", d.dept_name AS "Department Name"
FROM dept_emp AS de
INNER JOIN departments AS d
ON de.dept_no = d.dept_no
INNER JOIN employees AS e
ON e.emp_no = de.emp_no
WHERE d.dept_name = 'Sales'


--------------Query 7

-- Employees of sales or development departments: employee number, last name, first name, department
SELECT de.emp_no AS "Employee Numnber", e.last_name AS "Last Name",
       e.first_name AS "First Name", d.dept_name AS "Department Name"
FROM dept_emp AS de
INNER JOIN departments AS d
ON de.dept_no = d.dept_no
INNER JOIN employees AS e
ON e.emp_no = de.emp_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'


--------------Query 8

-- Count of employee last names in descending order
SELECT last_name AS "Last Name", COUNT(last_name) AS "Frequency of Last Name"
FROM employees
GROUP BY last_name
ORDER BY "Frequency of Last Name" DESC;
