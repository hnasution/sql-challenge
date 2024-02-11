--A good practice to drop any existing tables before creatiing theem to avoid conflicts and inconsistencies
--Delete tables if they already exist.
DROP TABLE IF EXISTS titles, departments, employees, dept_manager, dept_emp, salaries;

--Set datestyle to csv file date format
--Though it is recommended to use "ISO, YYYY-MM-DD" for datastyle as it is widely recognise and standard format
SET datestyle = 'ISO, MDY';

-- Table to store titles for employees
CREATE TABLE titles (
    title_id VARCHAR(10) PRIMARY KEY, -- Unique Title code
    title VARCHAR(50) NOT NULL -- Title cannot be empty
);

-- Table to store department info
CREATE TABLE departments (
    dept_no VARCHAR(10) PRIMARY KEY, -- Unique Department code
    dept_name VARCHAR(50) NOT NULL -- Department Description
);

--Create employees table to store employees' information 
--Reference employee.csv
CREATE TYPE sex_type AS ENUM ('M', 'F', 'X'); --Allowing sex type  M, F, add X for future data entries
CREATE TABLE employees (
    emp_no INT PRIMARY KEY, -- Employee number as unique identification for each employee
    emp_title_id VARCHAR(10) NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles (title_id), -- Foreign key referencing title_id in titles table
    birth_date DATE NOT NULL, -- marked NOT Null to guarantee each employee has birth date and the value cannot be empty
    first_name VARCHAR(35) NOT NULL, 
    last_name VARCHAR(35) NOT NULL,
    sex sex_type NOT NULL,
    hire_date DATE NOT NULL
);

--Create table to store department manager information
CREATE TABLE dept_manager (
    dept_no VARCHAR(10) NOT NULL, -- Department code cannot be empty
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no), -- Foreign key referencing departments table
    emp_no INT NOT NULL, -- Employee number and cannot be empty
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no), -- Foreign key referencing employees table
    PRIMARY KEY (dept_no, emp_no) -- Defines a composite primary key, that means the combination of dept_no and emp_no must be unique
    -- to ensure only one manager per department and one department per manager
);

--Create table to store employee department assignments
CREATE TABLE dept_emp (
    emp_no INT NOT NULL PRIMARY KEY, -- Unique Employee number and cannot be empty
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no), -- Foreign key referencing employees table
    dept_no VARCHAR(10) NOT NULL, -- Department number cannot be empty
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no) -- Foreign key referencing departments table
);

--Create table to store employees' salaries
--Reference salaries.csv
CREATE TABLE salaries (
    emp_no INT PRIMARY KEY,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no), -- Foreign key referencing emp_no in employees table
    salary DECIMAL (10,2) NOT NULL -- Store salary in decimal and cannot be null
);