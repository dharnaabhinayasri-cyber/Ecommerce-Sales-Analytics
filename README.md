# Ecommerce-Sales-Analytics
End-to-End E-Commerce Sales & Profitability Analysis using Excel, SQL and Python

Project Overview

This project analyzes the Sample Superstore dataset to understand sales performance, profitability, discount impact, product performance, customer behavior, regional performance, and business trends.

The project follows an end-to-end data analytics workflow:

Data → Excel Analysis → SQL Analysis → Python EDA → Business Insights

Business Objectives

Analyze overall sales and profit performance.

Compare yearly sales and profitability.

Identify profitable and loss-making products and sub-categories.

Analyze the relationship between discounts and profitability.

Compare sales and profit across regions and categories.

Analyze customer-level sales and profitability.

Identify important business trends and opportunities.

Perform data validation and quality checks.

Tools & Technologies

Microsoft Excel — data analysis, PivotTables, KPIs, charts, dashboard

MySQL — data validation, aggregation, profitability analysis, discount analysis, customer analysis, trend analysis, ranking and advanced SQL

Python — Pandas, NumPy, Matplotlib, exploratory data analysis and visualization

Jupyter Notebook — Python analysis and documentation

Project Workflow

Raw Dataset
     ↓
Data Cleaning & Validation
     ↓
Excel Analysis & Dashboard
     ↓
MySQL Analysis
     ↓
Python Exploratory Data Analysis
     ↓
Business Insights
     ↓
Business Recommendations

Repository Structure

Ecommerce-Sales-Analytics/
│
├── data/
│   ├── ecommerce_cleaned.csv
│   └── Sample - Superstore.csv
│
├── excel_dashboard/
│   └── Superstore_ecommerce_cleaned.xlsx
│
├── notebook/
│   └── 01_Exploratory_Analysis.ipynb
│
├── screenshot_python/
│   ├── bottom 10 products by profitability.png
│   ├── discount vs profit.png
│   ├── monthly sales trend.png
│   ├── profit by category.png
│   ├── profit by sub-category.png
│   ├── profit bysubcategory.png
│   ├── sales & profit by category.png
│   ├── sales & profit by region.png
│   ├── sales & profit by year.png
│   ├── Top 10 Loss-making products.png
│   └── top 10 products by sales.png
│
├── sql/
│   ├── salesdata.csv
│   └── SALESdata.sql
│
├── venv314/
│
├── .gitattributes
└── README.md

Excel Analysis

Excel was used for data analysis, PivotTables, KPI calculations, and business charts.

Key analysis areas include:

Sales and profit by year

Sales and profit by category

Sales and profit by region

Product and sub-category profitability

Discount analysis

Top-performing products

Loss-making products

KPI analysis

The Excel workbook is available in:

excel_dashboard/Superstore_ecommerce_cleaned.xlsx

SQL Analysis

MySQL was used to perform structured business analysis, including:

Data validation

Total sales, profit, orders and quantity

Category and sub-category profitability

Negative-profit analysis

Product-level profitability

Regional performance

Customer analysis

Discount analysis

Monthly and yearly trends

Year-over-year analysis

Running totals

Product ranking

Top-N analysis

SQL files are available in:

sql/

Python Analysis

Python was used for exploratory data analysis and visualization using Pandas, NumPy and Matplotlib.

The notebook covers:

Data loading and inspection

Data validation

Data cleaning checks

Sales and profit analysis

Category analysis

Sub-category analysis

Regional analysis

Product profitability

Discount analysis

Monthly sales trends

Top and bottom products

Business-oriented visualizations

Notebook:

notebook/01_Exploratory_Analysis.ipynb

Key Business Insights

1. Sales Growth

Sales increased from approximately $484K in 2014 to approximately $733K in 2017, showing strong overall revenue growth.

2. Profitability Trend

Profit margin improved through 2016, reaching approximately 13.43%, before declining to approximately 12.74% in 2017.

3. Discount Impact

The analysis showed a strong relationship between discounting and profitability. The 0% discount group generated approximately 29.5% profit margin, while the 30% discount group showed approximately -10.05% margin.

4. Product Profitability

Some products generated significant sales but comparatively weak or negative profit, demonstrating why revenue should not be evaluated without profitability.

5. Tables Sub-Category

The Tables sub-category generated approximately -$2,951 profit in 2016, with a margin of approximately -4.85%, highlighting a product/sub-category profitability risk.

6. Data Quality

The dataset contains identified product ID/name inconsistencies. These records were retained for analysis rather than silently deleted, allowing the data-quality issue to be monitored separately.

Business Recommendations

Review products receiving high discounts before continuing aggressive promotions.

Evaluate discount thresholds using product-level profitability.

Investigate consistently loss-making products and sub-categories.

Monitor profit margin alongside revenue growth.

Evaluate products using both sales and profit rather than sales alone.

Monitor regional and customer-level profitability.

Use data-quality flags to prevent inconsistent product information from affecting business decisions.

Skills Demonstrated

Data Cleaning

Data Validation

Exploratory Data Analysis

Excel

PivotTables

KPI Analysis

Data Visualization

MySQL

SQL Aggregations

GROUP BY

CTEs

Window Functions

Ranking

YoY Analysis

Customer Analysis

Product Profitability Analysis

Discount Analysis

Python

Pandas

NumPy

Matplotlib

Business Insights

Business Recommendations

Project Type

Personal Data Analytics Project

## 🛠️ Version Control Rescue Notes

During GitHub publishing, I faced conflicts between my local project structure and the remote branch.  
To ensure **no structural changes** and preserve all datasets, dashboards, notebooks, and scripts, I followed these steps:

1. **Aborted rebase** when Git flagged deletions (`git rebase --abort`).  
2. **Verified local files** (`data/`, `excel_dashboard/`, `notebook/`, `sql/`, `screenshot/python/`) remained intact.  
3. **Staged and committed** everything again (`git add . && git commit`).  
4. **Force pushed local truth** (`git push origin main --force`) so GitHub mirrors my exact portfolio structure.  

👉 Outcome: My project structure stayed unchanged, and the repo now reflects the complete workflow — datasets, Excel dashboard, Jupyter notebook, SQL scripts, and Python visualizations.

This project demonstrates an end-to-end approach to transforming raw e-commerce data into analytical findings and actionable business recommendations.