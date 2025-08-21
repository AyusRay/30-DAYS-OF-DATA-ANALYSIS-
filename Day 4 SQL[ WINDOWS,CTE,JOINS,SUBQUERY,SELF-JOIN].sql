-- Create database
CREATE DATABASE day4_practice;
USE day4_practice;

-- Create tables
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    hire_date DATE,
    salary DECIMAL(10,2)
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    department_id INT,
    budget DECIMAL(12,2),
    start_date DATE,
    end_date DATE
);

CREATE TABLE employee_projects (
    employee_id INT,
    project_id INT,
    hours_worked DECIMAL(5,2),
    PRIMARY KEY (employee_id, project_id)
);

-- Insert sample data
INSERT INTO departments VALUES
(1, 'Engineering', 'New York'),
(2, 'Marketing', 'Chicago'),
(3, 'Sales', 'Boston'),
(4, 'HR', 'San Francisco'),
(5, 'Finance', 'Austin');

INSERT INTO employees VALUES
(101, 'John', 'Doe', 1, '2020-01-15', 75000),
(102, 'Jane', 'Smith', 1, '2019-03-22', 85000),
(103, 'Michael', 'Johnson', 2, '2021-07-10', 65000),
(104, 'Sarah', 'Williams', 3, '2018-05-14', 70000),
(105, 'David', 'Brown', 1, '2020-11-30', 80000),
(106, 'Emily', 'Jones', 4, '2019-08-25', 60000),
(107, 'Robert', 'Taylor', 2, '2022-02-14', 62000),
(108, 'Jennifer', 'Anderson', 3, '2020-04-05', 72000),
(109, 'Daniel', 'Thomas', 5, '2021-09-19', 90000),
(110, 'Lisa', 'Martin', 5, '2018-12-10', 95000);

INSERT INTO projects VALUES
(201, 'Website Redesign', 1, 50000, '2023-01-15', '2023-06-15'),
(202, 'Social Media Campaign', 2, 30000, '2023-02-01', '2023-05-31'),
(203, 'Product Launch', 3, 75000, '2023-03-10', '2023-08-15'),
(204, 'Employee Training', 4, 25000, '2023-01-30', '2023-04-30'),
(205, 'Financial Analysis', 5, 60000, '2023-02-15', '2023-12-15'),
(206, 'Mobile App Development', 1, 100000, '2023-03-01', '2023-10-31');

INSERT INTO employee_projects VALUES
(101, 201, 120.5),
(102, 201, 95.0),
(105, 201, 85.5),
(101, 206, 65.0),
(102, 206, 110.0),
(103, 202, 75.5),
(107, 202, 60.0),
(104, 203, 130.0),
(108, 203, 115.5),
(106, 204, 90.0),
(109, 205, 150.0),
(110, 205, 125.5);




SELECT * FROM employees;
Select * from departments;
Select * from projects;
SELECT * FROM employee_projects;


#CTE Exercises
#Create a CTE that calculates the average salary per department, then select employees who earn more than their department's average.


WITH department_average AS (
    SELECT 
        departments.department_id, 
        departments.department_name, 
        AVG(employees.salary) AS avg_salary
    FROM employees
    JOIN departments ON employees.department_id = departments.department_id
    GROUP BY departments.department_id, departments.department_name
)

SELECT 
    employees.first_name,
    employees.last_name,
    employees.department_id,
    department_average.department_name,
    employees.salary,
    department_average.avg_salary
FROM employees
JOIN department_average ON employees.department_id = department_average.department_id
WHERE employees.salary > department_average.avg_salary;

#Using a CTE, find the total hours worked per project and then list projects with more than 250 total hours.

WITH project_hours AS (
    SELECT 
        project_id,
        SUM(hours_worked) AS total_hours  
    FROM employee_projects
    GROUP BY project_id  
)

SELECT 
    projects.project_id,
    projects.project_name,
    project_hours.total_hours
FROM projects 
JOIN project_hours  ON projects.project_id = project_hours.project_id
WHERE project_hours.total_hours > 250
ORDER BY project_hours.total_hours DESC;


#Create a CTE to calculate each employee's tenure in years, then find employees with more than 3 years of tenure.
WITH employee_tenure AS (
    SELECT 
        employee_id,
        first_name,
        last_name,
        hire_date,
        -- Calculate tenure in years
        TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) AS tenure_years
    FROM employees
)

SELECT 
    employee_id,
    first_name,
    last_name,
    hire_date,
    tenure_years
FROM employee_tenure
WHERE tenure_years > 3
ORDER BY tenure_years DESC;

#Window Function Exercises
#Rank employees by salary within their department using the RANK() window function.


SELECT 
    employee_id,
    salary,
    RANK() OVER (ORDER BY salary DESC) AS rank_example,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rank_example,
    ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_number_example
FROM employees;

SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    e.department_id,
    e.salary,
    d.department_name,
    RANK() OVER (
        PARTITION BY e.department_id 
        ORDER BY e.salary DESC
    ) AS salary_rank
FROM employees e
JOIN departments d ON e.department_id = d.department_id
ORDER BY d.department_name, salary_rank;

# Cumulative Salary by Department
SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    d.department_name,
    e.salary,
    SUM(e.salary) OVER (
        PARTITION BY e.department_id 
        ORDER BY e.employee_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
ORDER BY e.department_id, e.employee_id;


#2. Salary Difference from Department Average

SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    d.department_name,
    e.salary,
    AVG(e.salary) OVER (PARTITION BY e.department_id) AS avg_department_salary,
    e.salary - AVG(e.salary) OVER (PARTITION BY e.department_id) AS salary_difference
FROM employees e
JOIN departments d ON e.department_id = d.department_id
ORDER BY e.department_id, e.salary DESC;

#Next Hire Date in Same Department

SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    d.department_name,
    e.hire_date,
    LEAD(e.hire_date) OVER (
        PARTITION BY e.department_id 
        ORDER BY e.hire_date
    ) AS next_hire_date
FROM employees e
JOIN departments d ON e.department_id = d.department_id
ORDER BY e.department_id, e.hire_date;


#1. INNER JOIN: Employees with Department Names

SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    e.salary,
    d.department_name,
    d.location
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
ORDER BY d.department_name, e.last_name;


# 2. LEFT JOIN: All Departments with Employees (including empty departments)

SELECT 
    d.department_id,
    d.department_name,
    d.location,
    e.employee_id,
    e.first_name,
    e.last_name,
    e.salary
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
ORDER BY d.department_name;

# RIGHT JOIN: All Projects with Department Names

SELECT 
    p.project_id,
    p.project_name,
    p.budget,
    p.start_date,
    p.end_date,
    d.department_name
FROM projects p
RIGHT JOIN departments d ON p.department_id = d.department_id
ORDER BY d.department_name;


#5. SELF-JOIN: Employees Hired on the Same Date



SELECT 
    e1.employee_id AS emp1_id,
    CONCAT(e1.first_name, ' ', e1.last_name) AS emp1_name,
    e1.hire_date,
    e2.employee_id AS emp2_id,
    CONCAT(e2.first_name, ' ', e2.last_name) AS emp2_name
FROM employees e1
INNER JOIN employees e2 ON e1.hire_date = e2.hire_date
WHERE e1.employee_id < e2.employee_id  -- Avoid duplicate pairs and self-joins
ORDER BY e1.hire_date;

# 1. Employees Earning More Than Company Average

SELECT 
    employee_id,
    first_name,
    last_name,
    salary
FROM employees
WHERE salary > (
    SELECT AVG(salary) 
    FROM employees
)
ORDER BY salary DESC;


# Project with above average budget 


SELECT 
    project_id,
    project_name,
    budget,
    department_id
FROM projects
WHERE budget > (
    SELECT AVG(budget) 
    FROM projects
)
ORDER BY budget DESC;

