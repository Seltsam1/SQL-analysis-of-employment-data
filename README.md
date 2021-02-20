# SQL-analysis-of-employment-data
Analysis using sql of csv files for employment data


## Getting Started

- All csv files used in analysis are in the resources folder
- schema.sql file is used to create tables in SQL (PostgreSQL)
  - Update filepath for copy commands to your local folder containing csv files to use code
- query.sql contains all analyses

## Features

ERD-data-modeling.png
- ERD (Entity Relationship Diagram) of table structure
- Shows relationships of data in csv files, used as guideline to create SQL schema for tables
- Generated via http://www.quickdatabasediagrams.com


schema.sql
- Drop commands if need to rerun code
- Create table commands for 6 tables
  - titles, employees, departments, dept_manager, dept_emp, salaries
- Copy commands to import data from csv files
- Query commands to confirm table import

query.sql
- Contains 8 queries:
  -   Details of each employee
  -   Names of employees hired in a specific year
  -   List of managers for each department along with details
  -   List of employees with a specific first name and last beginning with a specific letter
  -   List of employees in Sales department with details
  -   List of employees in Sales or Development departments with details
  -   Frequency found of employee last names in descending order
-  Additional details of queries located within comments in file

## Licensing by:

The code in this project is licensed under MIT license.
