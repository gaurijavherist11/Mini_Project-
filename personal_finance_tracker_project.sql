

use gauridb1;
-- USERS
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- CATEGORIES
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL,
    type ENUM('income', 'expense') NOT NULL,
    is_essential BOOLEAN DEFAULT TRUE
);

-- INCOME
CREATE TABLE Income (
    income_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    category_id INT,
    amount DECIMAL(10, 2),
    source VARCHAR(100),
    income_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- EXPENSES
CREATE TABLE Expenses (
    expense_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    category_id INT,
    amount DECIMAL(10, 2),
    description VARCHAR(255),
    expense_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- GOALS
CREATE TABLE Goals (
    goal_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    goal_name VARCHAR(100),
    target_amount DECIMAL(10,2),
    saved_amount DECIMAL(10,2),
    deadline DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- ADJUSTMENTS (For pattern-based suggestions)
CREATE TABLE BudgetAdjustments (
    adjustment_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    category_id INT,
    month VARCHAR(7),
    old_limit DECIMAL(10,2),
    suggested_limit DECIMAL(10,2),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- 1. Insert Users

INSERT INTO Users (username, email, password_hash) VALUES
('rohan', 'rohan@example.com', 'hashed_rohan'),
('gauri', 'gauri@example.com', 'hashed_gauri'),
('anita', 'anita@example.com', 'hashed_anita'),
('raj', 'raj@example.com', 'hashed_raj'),
('sneha', 'sneha@example.com', 'hashed_sneha'),
('karan', 'karan@example.com', 'hashed_karan'),
('meera', 'meera@example.com', 'hashed_meera'),
('akash', 'akash@example.com', 'hashed_akash'),
('rhea', 'rhea@example.com', 'hashed_rhea'),
('vishal', 'vishal@example.com', 'hashed_vishal');

-- 2. Insert Categories (only once)

INSERT INTO Categories (category_name, type, is_essential) VALUES 
('Salary', 'income', TRUE),
('Bonus', 'income', FALSE),
('Freelance', 'income', FALSE),
('Rent', 'expense', TRUE),
('Food', 'expense', TRUE),
('Entertainment', 'expense', FALSE),
('Travel', 'expense', FALSE),
('Utilities', 'expense', TRUE);

--  3. Insert Incomes for All Users

-- Example incomes for each user
INSERT INTO Income (user_id, category_id, amount, source, income_date) VALUES
(1, 1, 60000, 'Job', '2025-07-01'),
(2, 1, 55000, 'Job', '2025-07-01'),
(3, 3, 40000, 'Freelancing', '2025-07-05'),
(4, 1, 62000, 'Job', '2025-07-01'),
(5, 1, 58000, 'Job', '2025-07-01'),
(6, 2, 15000, 'Project Bonus', '2025-07-10'),
(7, 3, 42000, 'Side Gigs', '2025-07-06'),
(8, 1, 70000, 'Company Salary', '2025-07-01'),
(9, 1, 50000, 'Monthly Salary', '2025-07-01'),
(10, 3, 39000, 'Freelancing', '2025-07-08');

-- 4. Insert Expenses for All Users

INSERT INTO Expenses (user_id, category_id, amount, description, expense_date) VALUES
-- Rohan
(1, 4, 15000, 'Rent July', '2025-07-03'),
(1, 5, 4000, 'Groceries', '2025-07-06'),
(1, 6, 2500, 'Netflix + Movies', '2025-07-09'),

-- Gauri
(2, 4, 12000, 'Rent', '2025-07-04'),
(2, 5, 3800, 'Food', '2025-07-06'),
(2, 7, 1500, 'Train Travel', '2025-07-08'),

-- Anita
(3, 5, 3000, 'Snacks & Groceries', '2025-07-07'),
(3, 6, 2200, 'Cinema', '2025-07-11'),

-- Raj
(4, 4, 16000, 'House Rent', '2025-07-03'),
(4, 8, 1800, 'Electricity + Internet', '2025-07-10'),

-- Sneha
(5, 5, 3400, 'Food', '2025-07-05'),
(5, 7, 2700, 'Bus, Auto', '2025-07-08'),

-- Karan
(6, 6, 3000, 'Netflix + Games', '2025-07-09'),
(6, 8, 2400, 'Mobile + Water Bill', '2025-07-11'),

-- Meera
(7, 4, 10000, 'PG Rent', '2025-07-01'),
(7, 5, 4500, 'Monthly groceries', '2025-07-06'),

-- Akash
(8, 7, 3200, 'Weekend Trip', '2025-07-12'),
(8, 5, 4100, 'Food & Snacks', '2025-07-05'),

-- Rhea
(9, 4, 14000, 'House Rent', '2025-07-02'),
(9, 6, 1800, 'OTT Subscriptions', '2025-07-08'),

-- Vishal
(10, 5, 3600, 'Food and cooking', '2025-07-06'),
(10, 8, 2600, 'WiFi + Lights', '2025-07-10');

-- 5. Insert Goals for All Users

INSERT INTO Goals (user_id, goal_name, target_amount, saved_amount, deadline) VALUES
(1, 'Buy a Laptop', 70000, 10000, '2025-12-31'),
(2, 'Emergency Fund', 50000, 20000, '2025-11-01'),
(3, 'Vacation Trip', 60000, 15000, '2025-10-15'),
(4, 'New Phone', 40000, 5000, '2025-09-30'),
(5, 'Car Down Payment', 120000, 30000, '2026-01-01'),
(6, 'Camera Equipment', 55000, 15000, '2025-11-20'),
(7, 'Wedding Savings', 200000, 50000, '2026-05-15'),
(8, 'MBA Fund', 300000, 75000, '2026-07-01'),
(9, 'iPad Purchase', 45000, 12000, '2025-10-10'),
(10, 'Home Furniture', 90000, 18000, '2025-12-01');

 -- SQL Queries
 -- 1. Monthly Expense Summary
SELECT 
    DATE_FORMAT(expense_date, '%Y-%m') AS month,
    SUM(amount) AS total_expense
FROM Expenses
WHERE user_id = 1
GROUP BY month;

-- 2. Category-Wise Spending
SELECT 
    c.category_name,
    SUM(e.amount) AS total_spent
FROM Expenses e
JOIN Categories c ON e.category_id = c.category_id
WHERE e.user_id = 1
GROUP BY c.category_name;

-- 3. View: Monthly Balance Summary
CREATE VIEW MonthlyBalance AS
SELECT 
    DATE_FORMAT(e.expense_date, '%Y-%m') AS month,
    COALESCE(SUM(i.amount), 0) - COALESCE(SUM(e.amount), 0) AS balance
FROM Expenses e
LEFT JOIN Income i 
    ON MONTH(e.expense_date) = MONTH(i.income_date) 
    AND YEAR(e.expense_date) = YEAR(i.income_date)
    AND i.user_id = e.user_id
WHERE e.user_id = 1
GROUP BY month;

-- 4. Spending Trend (Last 3 Months)
SELECT 
    c.category_name,
    AVG(e.amount) AS avg_spent,
    DATE_FORMAT(e.expense_date, '%Y-%m') AS month
FROM Expenses e
JOIN Categories c ON e.category_id = c.category_id
WHERE e.user_id = 1
  AND e.expense_date >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
GROUP BY c.category_name, month;

-- 5. Financial Goal Progress
SELECT 
    goal_name, 
    target_amount, 
    saved_amount,
    ROUND((saved_amount / target_amount) * 100, 2) AS progress_percent,
    deadline
FROM Goals
WHERE user_id = 1;

-- Python Report Export Script
import pandas as pd
import mysql.connector

conn = mysql.connector.connect(
    host='localhost',
    user='root',
    password='',
    database='smartbudget'
)

df = pd.read_sql('SELECT * FROM MonthlyBalance', conn)
df.to_csv('monthly_report.csv', index=False)
print("Exported successfully.")


