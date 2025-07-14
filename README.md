# Analysis
# 📊 SQL Financial Analysis Project

This project simulates a simplified investment portfolio and performs SQL-based financial analysis using historical asset prices. It calculates total portfolio value, individual asset allocation, and identifies top-performing tickers on a specific date.

---

## 📁 Files

- Financial_Analysis.sql: Contains SQL table definitions and queries for portfolio evaluation.

---

## 🏗️ Database Schema

- Assets: Master list of tickers and their sectors  
- Holdings: Quantity and weight of holdings per investor  
- Prices: Historical open/close prices, returns, and volume per ticker

---

## 🔍 Key SQL Features Used

- Table creation with primary and foreign keys  
- Joins (INNER JOIN)  
- Aggregations (SUM, ROUND, GROUP BY)  
- Common Table Expressions (CTEs)  
- Filtering by date  
- Sorting and limiting results (ORDER BY, FETCH FIRST)

---

## 📈 SQL Queries Overview

1. Total Portfolio Value on a Given Date  
   Calculates the combined value of all holdings for each investor.

2. Value of Each Holding  
   Shows per-asset value in the portfolio.

3. Asset Allocation (%) per Investor  
   Determines the percentage of the portfolio allocated to each asset.

4. Top Performing Tickers by Daily Return  
   Retrieves top 5 assets with the highest return on a specified date.

---

## 🧠 Sample Insights (for 2023-12-29)

- Total portfolio value per investor  
- Highest weighted holdings per user  
- Top 5 performing tickers on that day  
- Diversification of portfolio by ticker

---

## ✅ Skills Highlighted

- SQL for data modeling and business logic  
- Financial data interpretation  
- Query optimization using subqueries and CTEs  
- Portfolio performance analysis techniques

- ## 📂 Data

The dataset includes:
- `assets.csv`: Master list of tickers and their sector classification
- `holdings.csv`: Holdings of investors, including quantity and weight
- `PRICES.csv`: Daily historical pricing data with open, close, adjusted prices, and returns

These CSV files are used to populate the `Assets`, `Holdings`, and `Prices` tables in the SQL project.


---

## 🚀 How to Use

1. Run the table creation statements in any SQL database (e.g., Oracle, PostgreSQL).
2. Load sample data (or real stock data, if available).
3. Execute the queries to retrieve portfolio insights.

---

## 📌 Note

This is a simplified simulation and can be extended by adding:
- Time-series return calculations  
- Sector-level aggregation  
- Visualization dashboards (Tableau)

---

## 👤 Author

Anshum Luthra – Aspiring Data Analyst  
📫 LinkedIn: www.linkedin.com/in/anshum-luthra
