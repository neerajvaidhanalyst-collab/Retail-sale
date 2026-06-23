

# 🛒 Retail Sales Analysis Using SQL

## 📌 Project Overview

This project focuses on analyzing retail sales data using SQL. The objective is to extract meaningful business insights from transactional sales records through data querying, aggregation, filtering, and reporting techniques.

The project demonstrates practical SQL skills commonly used by Data Analysts and Business Intelligence professionals.

---

## 🎯 Objectives

* Analyze retail sales performance.
* Understand customer purchasing behavior.
* Identify top-performing categories and customers.
* Generate business reports using SQL queries.
* Practice real-world data analysis scenarios.

---

## 🛠️ Tools & Technologies

* SQL
* MySQL
* Relational Database Concepts

---

## 📂 Dataset Information

The dataset contains retail transaction records with the following attributes:

| Column Name    | Description                   |
| -------------- | ----------------------------- |
| transaction_id | Unique transaction identifier |
| sale_date      | Date of sale                  |
| sale_time      | Time of sale                  |
| customer_id    | Customer identifier           |
| gender         | Customer gender               |
| age            | Customer age                  |
| category       | Product category              |
| quantity       | Quantity purchased            |
| total_sale     | Total transaction value       |

---

## 📊 Business Questions Solved

### 1. Retrieve Sales for a Specific Date

```sql
SELECT *
FROM retail
WHERE sale_date = '2022-06-14';
```

---

### 2. Find Clothing Transactions with Quantity Greater Than 4

```sql
SELECT *
FROM retail
WHERE category = 'Clothing'
AND quantity >= 4;
```

---

### 3. Calculate Total Sales by Category

```sql
SELECT
    category,
    COUNT(*) AS total_orders,
    SUM(total_sale) AS revenue
FROM retail
GROUP BY category;
```

---

### 4. Average Age of Beauty Category Customers

```sql
SELECT ROUND(AVG(age),2)
FROM retail
WHERE category = 'Beauty';
```

---

### 5. Transactions with Sales Greater Than ₹1000

```sql
SELECT *
FROM retail
WHERE total_sale > 1000;
```

---

### 6. Transaction Count by Gender and Category

```sql
SELECT
    category,
    gender,
    COUNT(transaction_id) AS total_transactions
FROM retail
GROUP BY category, gender;
```

---

### 7. Top 5 Customers by Total Sales

```sql
SELECT
    customer_id,
    SUM(total_sale) AS total_revenue
FROM retail
GROUP BY customer_id
ORDER BY total_revenue DESC
LIMIT 5;
```

---

### 8. Unique Customers per Category

```sql
SELECT
    category,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM retail
GROUP BY category;
```

---

### 9. Sales Analysis by Shift

```sql
WITH hourly_sale AS (
SELECT *,
CASE
    WHEN HOUR(sale_time) < 12 THEN 'Morning'
    WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
    ELSE 'Evening'
END AS shift
FROM retail
)

SELECT
    shift,
    COUNT(*) AS total_orders
FROM hourly_sale
GROUP BY shift;
```

---

## 🔍 Key Insights Generated

* Identified top spending customers.
* Analyzed category-wise revenue contribution.
* Measured customer engagement across categories.
* Studied shopping patterns by time of day.
* Compared purchasing behavior across genders.
* Evaluated high-value transactions.

---

## 📈 SQL Concepts Used

* SELECT Statements
* WHERE Clause
* Aggregate Functions (SUM, COUNT, AVG)
* GROUP BY
* ORDER BY
* LIMIT
* DISTINCT
* Common Table Expressions (CTE)
* Conditional Logic (CASE WHEN)
* Date & Time Functions

---

## 🚀 Learning Outcomes

Through this project, I gained hands-on experience in:

* Data Cleaning & Exploration
* Business-Oriented SQL Analysis
* Customer Segmentation
* Revenue Analysis
* Query Optimization
* Analytical Thinking Using SQL

---

## 📁 Project Structure

```text
Retail-Sales-SQL-Project/
│
├── retail_sale2_data.sql
├── README.md
│
└── SQL Queries
    ├── Sales Analysis
    ├── Customer Analysis
    ├── Revenue Analysis
    └── Shift-wise Reporting
