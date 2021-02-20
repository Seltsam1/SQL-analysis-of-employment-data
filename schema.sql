-- Schema for tables (SQL analysis of employment data)

-- Drop tables if exist before running rest of code
-- Drop commands in oposite order of dependencies
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;

--------------------------------------

-- Create tables

CREATE TABLE titles (
	title_id VARCHAR PRIMARY KEY,
	title VARCHAR (40)
);

CREATE TABLE employees (
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR,
	birth_date DATE,
	first_name VARCHAR (40),
	last_name VARCHAR (40),
	sex VARCHAR (1),
	hire_date DATE,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE departments (
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR (40)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR,
	emp_no INT PRIMARY KEY,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Note, dept_emp has composite key as neither alone is unique
CREATE TABLE dept_emp (
	emp_no INT,
	dept_no VARCHAR,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE salaries (
	emp_no INT PRIMARY KEY,
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

----------------------------------

-- Copy commands to import csv data

-- NOTE - UPDATE PATHWAY IF CSV FILES IN DIFFERENT LOCATION

COPY titles
FROM '/Users/seltsam/Public/titles.csv'
DELIMITER ',' CSV HEADER;

COPY employees
FROM '/Users/seltsam/Public/employees.csv'
DELIMITER ',' CSV HEADER;

COPY departments
FROM '/Users/seltsam/Public/departments.csv'
DELIMITER ',' CSV HEADER;

COPY dept_manager
FROM '/Users/seltsam/Public/dept_manager.csv'
DELIMITER ',' CSV HEADER;

COPY dept_emp
FROM '/Users/seltsam/Public/dept_emp.csv'
DELIMITER ',' CSV HEADER;

COPY salaries
FROM '/Users/seltsam/Public/salaries.csv'
DELIMITER ',' CSV HEADER;


---------------------------------

-- Confirm imported data by seperately running query on each table

SELECT * FROM titles LIMIT 100;
SELECT * FROM employees LIMIT 100;
SELECT * FROM departments LIMIT 100;
SELECT * FROM dept_manager LIMIT 100;
SELECT * FROM dept_emp LIMIT 100;
SELECT * FROM salaries LIMIT 100;