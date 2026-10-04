# EDA Project — Oracle SQL Exploratory Data Analysis

A hands-on exploratory data analysis project built in **Oracle XE 21c**,
using clean, analysis-ready data from my [Oracle Medallion Data Warehouse](https://github.com/AreebaAamir123/sql-oracle-data-warehouse) project.

This repo walks through a structured 6-step EDA process: from exploring
the schema, to understanding dimensions, to finding the top and bottom
performers in the business.

---

## 📊 About the Data

The data analyzed here comes directly from the **Gold layer**  Data Warehouse project — a medallion-architecture pipeline
(Bronze → Silver → Gold) built entirely in Oracle.

The Gold layer exposes a **star schema** with three views:

| View | Purpose | Rows |
|---|---|---|
| `gold.dim_customers` | One row per customer, with demographics and geography | ~18,000 |
| `gold.dim_products` | One row per current product, with category and pricing | ~295 |
| `gold.fact_sales` | One row per sales transaction | ~60,000 |

All cleaning, deduplication, standardization, and validation happened
**upstream** in the DWH project — so this EDA repo can focus purely on
analysis, not data prep.

> **Why this matters:** using a curated star schema (instead of raw CSVs)
> means every query here runs against consistent, tested data. No surprises
> from typos, duplicates, or invalid dates.

---

## 🎯 Purpose

The goal of this project is to demonstrate a **structured EDA workflow**
using pure Oracle SQL —

Each step answers a specific kind of question:

| Step | Focus | Question it answers |
|---|---|---|
| 1 | Database Exploration | What tables, views, and columns exist? |
| 2 | Dimension Exploration | What values appear in each dimension? |
| 3 | Date Exploration | What time range does the data cover? |
| 4 | Measure Exploration | What are the business's "big numbers"? |
| 5 | Magnitude Analysis | How do measures break down by dimension? |
| 6 | Ranking Analysis | Who are the top/bottom performers? |

---

Important: This is a guided project from (Bara)[https://github.com/DataWithBaraa] who made it in sql server using t-sql, i've translated it to pl/sql in Oracle (XE)
