-- Create departments table
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);

-- Create employees table
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(150) UNIQUE,
    salary NUMERIC(10,2),
    department_id INT REFERENCES departments(department_id),
    hire_date DATE
);

-- Create projects table
CREATE TABLE projects (
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(200),
    budget NUMERIC(12,2),
    start_date DATE,
    end_date DATE
);

-- Create transactions table (Financial data)
CREATE TABLE transactions (
    transaction_id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES employees(employee_id),
    amount NUMERIC(12,2),
    transaction_type VARCHAR(50),
    transaction_date DATE
);
INSERT INTO departments (name, location)
VALUES 
('Finance', 'Berlin'),
('IT', 'Munich'),
('HR', 'Hamburg');

INSERT INTO employees (first_name, last_name, email, salary, department_id, hire_date)
VALUES
('Ahmed', 'Javed', 'ahmed.javed@company.com', 75000, 1, '2022-01-10'),
('Sara', 'Khan', 'sara.khan@company.com', 68000, 2, '2023-03-15'),
('Ali', 'Raza', 'ali.raza@company.com', 72000, 1, '2021-07-20');

INSERT INTO projects (project_name, budget, start_date, end_date)
VALUES
('AI Risk Assessment', 200000, '2024-01-01', '2024-12-31'),
('Enterprise RAG System', 150000, '2025-02-01', '2025-08-30');

INSERT INTO transactions (employee_id, amount, transaction_type, transaction_date)
VALUES
(1, 1200.50, 'Expense', '2025-01-15'),
(2, 5000.00, 'Bonus', '2025-01-20'),
(3, 2300.75, 'Expense', '2025-02-10');

SELECT * FROM employees;