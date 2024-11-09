-- Drop tables if they already exist (for reruns)
DROP TABLE IF EXISTS employees CASCADE ;
DROP TABLE IF EXISTS projects CASCADE ;
DROP TABLE IF EXISTS assignments CASCADE ;
DROP TABLE IF EXISTS departments CASCADE ;
DROP TABLE IF EXISTS salaries_history CASCADE ;

-- Create the Departments table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100),
    manager_id INT,
    budget DECIMAL(10, 2)
);

-- Create the Employees table
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(100),
    hire_date TIMESTAMP,
    salary DECIMAL(10, 2),
    info JSON
);

-- Create the Salaries History table
CREATE TABLE salaries_history (
    employee_id INT,
    salary DECIMAL(10, 2),
    change_date TIMESTAMP,
    FOREIGN KEY (employee_id) REFERENCES employees(id)
);

-- Create the Projects table
CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    start_date TIMESTAMP,
    end_date TIMESTAMP,
    budget DECIMAL(10, 2)
);

-- Create the Assignments table
CREATE TABLE assignments (
    employee_id INT,
    project_id INT,
    hours_worked INT,
    FOREIGN KEY (employee_id) REFERENCES employees(id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

-- Insert sample data into the Employees table
INSERT INTO employees (id, name, department, hire_date, salary, info) VALUES
(1, 'Alice', 'Engineering', '2020-03-01 09:00:00', 60000, '{"skills": {"primary": "Python", "secondary": "SQL"}, "manager": "Bob"}'),
(2, 'Bob', 'Marketing', '2019-01-15 08:00:00', 50000, '{"skills": {"primary": "SEO", "secondary": "Content Writing"}, "manager": "Cathy"}'),
(3, 'Charlie', 'Engineering', '2018-07-23 10:30:00', 55000, '{"skills": {"primary": "Java", "secondary": "Kotlin"}, "manager": "Bob"}'),
(4, 'David', 'Engineering', '2021-04-05 11:00:00', 65000, '{"skills": {"primary": "Go", "secondary": "Python"}, "manager": "Alice"}'),
(5, 'Eve', 'HR', '2017-06-20 12:00:00', 48000, '{"skills": {"primary": "Recruitment", "secondary": "Conflict Resolution"}, "manager": "Dana"}'),
(6, 'Frank', 'Marketing', '2020-02-10 09:30:00', 51000, '{"skills": {"primary": "SEO", "secondary": "Analytics"}, "manager": "Cathy"}'),
(7, 'Grace', 'Finance', '2019-12-01 13:00:00', 70000, '{"skills": {"primary": "Accounting", "secondary": "Budgeting"}, "manager": "Henry"}'),
(8, 'Henry', 'Finance', '2016-11-11 08:00:00', 85000, '{"skills": {"primary": "Accounting", "secondary": "Management"}, "manager": "N/A"}'),
(9, 'Ivy', 'HR', '2020-10-21 10:00:00', 47000, '{"skills": {"primary": "Recruitment", "secondary": "Onboarding"}, "manager": "Dana"}'),
(10, 'John', 'Engineering', '2022-01-10 09:00:00', 62000, '{"skills": {"primary": "C++", "secondary": "Python"}, "manager": "Alice"}');

-- Insert sample data into the Projects table
INSERT INTO projects (project_id, project_name, start_date, end_date, budget) VALUES
(101, 'Project A', '2023-01-01 09:00:00', '2023-06-30 17:00:00', 100000),
(102, 'Project B', '2023-02-01 10:00:00', '2023-12-31 18:00:00', 200000),
(103, 'Project C', '2023-03-15 08:00:00', '2023-09-30 17:00:00', 150000),
(104, 'Project D', '2023-04-01 09:00:00', '2023-10-31 18:00:00', 120000),
(105, 'Project E', '2023-05-01 10:00:00', '2023-11-30 17:00:00', 180000);

-- Insert sample data into the Assignments table
INSERT INTO assignments (employee_id, project_id, hours_worked) VALUES
(1, 101, 120),
(2, 102, 100),
(3, 101, 150),
(4, 103, 140),
(5, 104, 80),
(6, 102, 120),
(7, 103, 110),
(8, 104, 90),
(9, 105, 60),
(10, 105, 130);

-- Insert sample data into the Departments table
INSERT INTO departments (department_id, department_name, manager_id, budget) VALUES
(1, 'Engineering', 1, 500000),
(2, 'Marketing', 2, 300000),
(3, 'HR', 5, 200000),
(4, 'Finance', 8, 400000);

-- Insert sample data into the Salaries History table
INSERT INTO salaries_history (employee_id, salary, change_date) VALUES
(1, 58000, '2019-01-01 09:00:00'),
(1, 60000, '2020-03-01 09:00:00'),
(2, 48000, '2018-01-15 08:00:00'),
(2, 50000, '2019-01-15 08:00:00'),
(3, 53000, '2017-07-23 10:30:00'),
(3, 55000, '2018-07-23 10:30:00'),
(4, 63000, '2021-04-05 11:00:00'),
(4, 65000, '2022-04-05 11:00:00'),
(5, 45000, '2016-06-20 12:00:00'),
(5, 48000, '2017-06-20 12:00:00'),
(6, 49000, '2019-02-10 09:30:00'),
(6, 51000, '2020-02-10 09:30:00');