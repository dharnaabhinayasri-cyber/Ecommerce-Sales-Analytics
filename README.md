# E-Commerce Sales & Profitability Analytics

## Project Overview

An end-to-end data analytics project using the Sample Superstore dataset to evaluate sales performance, product profitability, discount impact, customer purchasing patterns, and regional trends.

I used Microsoft Excel for KPI analysis and dashboarding, MySQL for business-focused queries, and Python (Pandas, NumPy, and Matplotlib) for exploratory data analysis and visualization.

The objective is to identify the factors associated with declining profitability, distinguish high-revenue products from high-profit products, and translate analytical findings into actionable business recommendations.

**Tools:** Excel, MySQL, Python, Pandas, NumPy, Matplotlib, Jupyter Notebook.

**Workflow:** Data validation → Data preparation → SQL analysis → Python EDA → Excel dashboard → Business insights and recommendations.

## Key Business Insights

1. **Revenue Growth:** Annual sales increased from approximately $484K in 2014 to $733K in 2017. Revenue growth should be evaluated alongside profitability to understand whether growth translated into stronger margins.

2. **Profitability Trend:** Reported profit margin declined from approximately 13.43% in 2016 to 12.74% in 2017, indicating a need to investigate changes in product mix, discounting, and costs.

3. **Discount and Profitability:** The reported profit margin was approximately 29.5% for transactions with no discount and -10.05% for the 30% discount group. This indicates an association between discount levels and profitability in the observed data; it does not establish causation.

4. **Loss-Making Products:** Product and sub-category analysis identified areas where positive sales did not translate into positive profit.

5. **Data Quality:** Product ID/name inconsistencies were flagged and retained for investigation rather than silently removed.