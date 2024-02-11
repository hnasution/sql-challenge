# sql-challenge
Module 9 Challenge

Background
To do a research project about people whom the company employed during the 1980s and 1990s. All that remains of the employee database from that period are six CSV files.

Data Modelling
Inspect the CSV files, and then sketch an ERD of the tables using QuickDBD http://www.quickdatabasediagrams.com/

Data Engineering
1. Create a table schema for each of the six CSV files
2. Import each CSV files into its corresponding SQL table
    * When importing importing employees csv files, there was error message 'date/time field value out of range: '7/25/1953', related to datestyle setting. 
    Postgress accepted dates in format 'YYYY-MM-DD" whilst CSV files date format was 'MM/DD/YYYY'. 
    Although the datestyle in Postgress was set to ISO, MDY, importing csv file was unsuccessful.
    Changed datestyle in postgress from ISO, MDY to ISO DMY
    After some modification and changeing the date format in CSV file, re-imported finally successfull. 
    * There was also error when importing dept_emp csv file. 
    I identified duplicate entries in the dept_emp, I made assumption that the duplicates are on the second line.
    To fix the importing duplicate error message, I decided to delete the second line on each of the duplicate entries before importing the csv file.
    Re-importing file was succesfull, 
    
Data Analysis for the following can be found in the Data_Analysis folder https://github.com/hnasution/sql-challenge/tree/main/EmployeeSQL/Data_Analysis
1. List the employee number, last name,  rst name, sex, and salary of each employee.
2. List the  rst name, last name, and hire date for the employees who were hired in 1986.
3. List the manager of each department along with their department number, department name, employee number, last name, and  rst name.
4. List the department number for each employee along with that employee’s employee number, last name,  rst name, and department name.
5. List the  rst name, last name, and sex of each employee whose  rst name is Hercules and whose last name begins with the letter B.
6. List each employee in the Sales department, including their employee number, last name, and  rst name.
7. List each employee in the Sales and Development departments, including their employee number, last name,  rst name, and department name.
8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

