# Mini_Project-

# 💸 SmartBudget Pro — Personal Finance Tracker (SQL + Python)

SmartBudget Pro is a robust SQL-based Personal Finance Tracker built for managing and analyzing user income, expenses, savings goals, and spending patterns.

Designed for **DBMS mini-projects or **personal portfolio projects**, it can be extended into a full-stack application using Flask, Chart.js, and Python for data exports.

---

## ✅ Features

- 👥 Manage multiple users
- 💰 Track income, expenses, and categories
- 📅 Monthly & category-wise summaries
- 🎯 Set and monitor financial goals
- 📈 Identify spending trends & patterns
- 🚨 Flag overspending using budget adjustments
- 📤 Export monthly reports via Python (CSV)

---

## 🛠️ Tech Stack

| Layer      | Tool/Language               |
|------------|-----------------------------|
| Database   | MySQL / SQLite              |
| Backend    | Python (optional exports)   |
| Libraries  | `pandas`, `mysql-connector-python`

---

## 🧱 Database Schema

- **Users**
- **Categories** (Income/Expense types)
- **Income**
- **Expenses**
- **Goals**
- **BudgetAdjustments**

🔗 Relationships:
- Each user can have multiple incomes, expenses, goals
- Expenses & Income linked to categories
- BudgetAdjustments suggest improved spending behavior

 In detail :
 🔗 Relationships
Users → Income: One-to-Many (1 user can have many income entries)

Users → Expenses: One-to-Many

Users → Goals: One-to-Many

Categories → Income: One-to-Many (each income has a category)

Categories → Expenses: One-to-Many

---



