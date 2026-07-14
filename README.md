# 📊 SQL Business Analysis Project

## Project Overview

This project demonstrates end-to-end business analysis using SQL on a sales dataset. The objective was to transform raw transactional data into meaningful business insights by writing optimized SQL queries and answering real-world business questions.

The project focuses on analyzing customer behavior, sales performance, revenue trends, sales team performance, and business KPIs that help organizations make data-driven decisions.

This project showcases practical SQL skills commonly required for Business Analyst, Data Analyst, and Business Intelligence roles.

---

# Business Problem

Businesses generate thousands of transactions every day. Without proper analysis, it becomes difficult to understand:

- Which customers generate the highest revenue?
- Which countries contribute the most sales?
- Which sales teams are achieving their targets?
- Which sales channels perform the best?
- How are sales changing over time?
- What are the most important KPIs for business growth?

This project answers these questions using SQL.

---

# Dataset

The project uses three relational tables.

### Orders
Contains order-level transactional information including:

- Order ID
- Customer ID
- Order Date
- Order Value
- Sales Representative
- Order Source
- Customer Country

### Customers
Contains customer demographic information.

- Customer ID
- Customer Category
- Gender
- Age

### Sales
Contains sales hierarchy and target information.

- Sales POC
- Sales Team
- Sales Manager
- Annual Sales Target

---

# Database Schema

The database follows a relational model.

Customers (1) --------< Orders >-------- (1) Sales

Primary Keys

- Customer_ID
- Sales_POC

Foreign Keys

- Orders.Customer_ID
- Orders.Sales_POC

---

# Project Objectives

The primary objectives of this project are:

- Analyze overall business performance.
- Measure sales KPIs.
- Identify high-value customers.
- Evaluate country-wise revenue.
- Analyze sales team performance.
- Compare sales targets with actual achievements.
- Study monthly sales trends.
- Demonstrate advanced SQL concepts.

---

# Business KPIs

The following KPIs were calculated:

- Total Number of Orders
- Total Revenue
- Average Order Value
- Highest Order Value
- Lowest Order Value
- Orders by Country
- Revenue by Country
- Orders by Source
- Revenue by Source
- Revenue by Customer Category
- Revenue by Gender
- Orders by Age Group
- Revenue by Sales Team
- Revenue by Sales Manager
- Target vs Achievement
- Achievement Percentage
- Top Customers
- Top Sales Representatives
- Top Revenue Generating Countries
- Monthly Revenue
- Monthly Orders

---

# SQL Concepts Demonstrated

## Basic SQL

- SELECT
- WHERE
- ORDER BY
- LIMIT

## Aggregate Functions

- COUNT()
- SUM()
- AVG()
- MAX()
- MIN()

## String Functions

- CONCAT()

## Numeric Functions

- ROUND()

## Date Functions

- MONTH()

## Joins

- INNER JOIN

## Grouping

- GROUP BY
- HAVING

## Window Functions

- RANK()
- DENSE_RANK()
- SUM() OVER()

## Advanced SQL

- Window Functions
- Running Totals
- Ranking
- Aggregated Reporting

---

# Business Questions Answered

This project answers several real-world business questions including:

### Sales Performance

- How many total orders were received?
- What is the total revenue?
- What is the average order value?
- What are the highest and lowest order values?

### Customer Analysis

- Which customers generate the highest revenue?
- Which customer category contributes the most?
- How does revenue vary by gender?
- Which age group places the most orders?

### Country Analysis

- Which countries generate the highest revenue?
- Which countries place the highest number of orders?

### Sales Team Analysis

- Which sales team performs the best?
- Which sales manager generates the highest revenue?
- Which sales representatives achieved their targets?

### Time Analysis

- Monthly revenue trend
- Monthly order trend

### Advanced Analysis

- Ranking sales representatives
- Running revenue calculation
- Revenue achievement percentage

---

# Key Business Insights

The SQL analysis enables businesses to:

- Identify top-performing customers.
- Recognize high-revenue countries.
- Measure sales team productivity.
- Compare actual sales against targets.
- Track monthly business growth.
- Improve sales strategy using data-driven insights.
- Monitor customer purchasing behavior.

---

# Skills Demonstrated

- SQL
- MySQL
- Relational Databases
- Data Cleaning
- Data Aggregation
- Business Analysis
- KPI Reporting
- Window Functions
- Data Exploration
- Query Optimization
- Data Interpretation

---

# Tools Used

- MySQL
- MySQL Workbench
- GitHub

---

# Project Structure

```
SQL-Business-Analysis-Project/

│── README.md
│── Business_Analysis_Queries.sql
│── Dataset/
│     ├── Orders.csv
│     ├── Customers.csv
│     └── Sales.csv
│
│── Screenshots/
│
└── Results/
```

---

# Learning Outcomes

Through this project I strengthened my understanding of:

- Writing optimized SQL queries
- Working with multiple related tables
- Solving business problems using SQL
- Building KPI reports
- Performing customer and sales analysis
- Using aggregate and window functions
- Translating raw data into actionable business insights

---

# Future Improvements

Potential enhancements include:

- Creating interactive Power BI dashboards
- Building SQL stored procedures
- Adding indexes for query optimization
- Developing automated reporting workflows
- Performing customer segmentation using RFM analysis

---

# Author

**Arnnav Paul**

MBA – Hospital & Healthcare Management

Aspiring Business Analyst | SQL | Power BI | Excel | Python

---

## ⭐ If you found this project useful, feel free to star the repository.
