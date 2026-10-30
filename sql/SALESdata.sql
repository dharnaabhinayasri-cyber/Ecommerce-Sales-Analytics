-- 1. Select database
USE ecommerce_analysis;

-- 2. Verify current database
SELECT DATABASE();

-- 3. Show available tables
SHOW TABLES;

-- 4. Check table structure
DESCRIBE salesdata;

-- 5. Check first 10 records
SELECT *
FROM salesdata
LIMIT 10;

-- 1. Total rows
SELECT COUNT(*) AS Total_Rows
FROM salesdata;

-- 2. Total columns
SELECT COUNT(*) AS Total_Columns
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'ecommerce_analysis'
AND TABLE_NAME = 'salesdata';

-- 3. Unique order IDs
SELECT COUNT(DISTINCT `Order ID`) AS Total_Orders
FROM salesdata;

-- 4. Unique customers
SELECT COUNT(DISTINCT `Customer Name`) AS Total_Customers
FROM salesdata;

-- 5. Date range
SELECT
    MIN(`Order Date`) AS First_Order_Date,
    MAX(`Order Date`) AS Last_Order_Date
FROM salesdata;

-- 1. Check missing values
SELECT
    SUM(CASE WHEN Sales IS NULL THEN 1 ELSE 0 END)
        AS Missing_Sales,

    SUM(CASE WHEN Profit IS NULL THEN 1 ELSE 0 END)
        AS Missing_Profit,

    SUM(CASE WHEN Quantity IS NULL THEN 1 ELSE 0 END)
        AS Missing_Quantity,

    SUM(CASE WHEN Discount IS NULL THEN 1 ELSE 0 END)
        AS Missing_Discount,

    SUM(CASE WHEN `Order Date` IS NULL THEN 1 ELSE 0 END)
        AS Missing_Order_Date,

    SUM(CASE WHEN Region IS NULL THEN 1 ELSE 0 END)
        AS Missing_Region,

    SUM(CASE WHEN Category IS NULL THEN 1 ELSE 0 END)
        AS Missing_Category

FROM salesdata;

-- 2. Check duplicate Row IDs
SELECT
    `Row ID`,
    COUNT(*) AS Duplicate_Count
FROM salesdata
GROUP BY `Row ID`
HAVING COUNT(*) > 1;

-- 3. Check invalid negative sales
SELECT *
FROM salesdata
WHERE Sales < 0;

-- 4. Check negative quantities
SELECT *
FROM salesdata
WHERE Quantity < 0;

-- 5. Check discount range
SELECT *
FROM salesdata
WHERE Discount < 0 OR Discount > 1;

USE ecommerce_analysis;

-- 1. Total Sales
SELECT
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM salesdata;

-- 2. Total Profit
SELECT
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM salesdata;

-- 3. Total Orders
SELECT
    COUNT(DISTINCT `Order ID`) AS Order_Count
FROM salesdata;

-- 4. Profit Margin
SELECT
    ROUND(
        SUM(Profit) / NULLIF(SUM(Sales), 0) * 100,
        2
    ) AS Profit_Margin_Percentage
FROM salesdata;

-- 5. Average Order Value
SELECT
    ROUND(
        SUM(Sales) / NULLIF(COUNT(DISTINCT `Order ID`), 0),
        2
    ) AS Average_Order_Value
FROM salesdata;

-- 6. Total Quantity
SELECT
    SUM(Quantity) AS Total_Quantity
FROM salesdata;

SELECT

    ROUND(SUM(Sales), 2) AS Total_Sales,

    ROUND(SUM(Profit), 2) AS Total_Profit,

    COUNT(DISTINCT `Order ID`) AS Total_Orders,

    SUM(Quantity) AS Total_Quantity,

    ROUND(
        SUM(Profit) / NULLIF(SUM(Sales), 0) * 100,
        2
    ) AS Profit_Margin_Percentage,

    ROUND(
        SUM(Sales) /
        NULLIF(COUNT(DISTINCT `Order ID`), 0),
        2
    ) AS Average_Order_Value

FROM salesdata;

-- Category-wise Sales, Profit and Profit Margin

SELECT
    Category,

    ROUND(SUM(Sales), 2) AS Total_Sales,

    ROUND(SUM(Profit), 2) AS Total_Profit,

    ROUND(
        SUM(Profit) / NULLIF(SUM(Sales), 0) * 100,
        2
    ) AS Profit_Margin_Percentage

FROM salesdata

GROUP BY Category

ORDER BY Total_Profit DESC;

SELECT
    Category,
    ROUND(SUM(Sales), 2) AS Total_Sales

FROM salesdata

GROUP BY Category

ORDER BY Total_Sales DESC

LIMIT 1;

SELECT
    Category,
    ROUND(SUM(Profit), 2) AS Total_Profit

FROM salesdata

GROUP BY Category

ORDER BY Total_Profit ASC

LIMIT 1;

-- Total Profit by Sub-Category

SELECT
    `Sub-Category`,

    ROUND(SUM(Profit), 2) AS Total_Profit

FROM salesdata

GROUP BY `Sub-Category`

ORDER BY Total_Profit DESC;

SELECT
    `Sub-Category`,

    ROUND(SUM(Sales), 2) AS Total_Sales,

    ROUND(SUM(Profit), 2) AS Total_Profit,

    ROUND(
        SUM(Profit) / NULLIF(SUM(Sales), 0) * 100,
        2
    ) AS Profit_Margin_Percentage

FROM salesdata

GROUP BY `Sub-Category`

HAVING SUM(Profit) < 0

ORDER BY Total_Profit ASC;

SELECT
    Category,
    `Sub-Category`,

    ROUND(SUM(Sales), 2) AS Total_Sales,

    ROUND(SUM(Profit), 2) AS Total_Profit,

    ROUND(
        SUM(Profit) / NULLIF(SUM(Sales), 0) * 100,
        2
    ) AS Profit_Margin_Percentage

FROM salesdata

GROUP BY Category, `Sub-Category`

ORDER BY Total_Profit ASC;

-- Regional Sales and Profitability

SELECT
    Region,

    ROUND(SUM(Sales), 2) AS Total_Sales,

    ROUND(SUM(Profit), 2) AS Total_Profit,

    ROUND(
        SUM(Profit) / NULLIF(SUM(Sales), 0) * 100,
        2
    ) AS Profit_Margin_Percentage

FROM salesdata

GROUP BY Region

ORDER BY Total_Sales DESC;

SELECT
    Region,
    ROUND(SUM(Sales), 2) AS Total_Sales

FROM salesdata

GROUP BY Region

ORDER BY Total_Sales DESC

LIMIT 1;

SELECT
    Region,
    ROUND(SUM(Sales), 2) AS Total_Sales

FROM salesdata

GROUP BY Region

ORDER BY Total_Sales ASC

LIMIT 1;

SELECT
    Region,

    ROUND(SUM(Sales), 2) AS Total_Sales,

    ROUND(SUM(Profit), 2) AS Total_Profit,

    ROUND(
        SUM(Profit) / NULLIF(SUM(Sales), 0) * 100,
        2
    ) AS Profit_Margin_Percentage

FROM salesdata

GROUP BY Region

ORDER BY Profit_Margin_Percentage ASC

LIMIT 1;

SELECT
    Segment,

    ROUND(SUM(Sales), 2) AS Total_Sales,

    ROUND(SUM(Profit), 2) AS Total_Profit,

    COUNT(DISTINCT `Order ID`) AS Total_Orders,

    ROUND(
        SUM(Profit) / NULLIF(SUM(Sales), 0) * 100,
        2
    ) AS Profit_Margin_Percentage

FROM salesdata

GROUP BY Segment

ORDER BY Total_Sales DESC;

USE ecommerce_analysis;

SELECT
    DATE_FORMAT(`Order Date`, '%Y-%m-01') AS Month_Start,

    ROUND(SUM(Sales), 2) AS Total_Sales,

    ROUND(SUM(Profit), 2) AS Total_Profit

FROM salesdata

GROUP BY DATE_FORMAT(`Order Date`, '%Y-%m-01')

ORDER BY Month_Start;

SELECT

    YEAR(`Order Date`) AS Sales_Year,

    ROUND(SUM(Sales), 2) AS Total_Sales,

    ROUND(SUM(Profit), 2) AS Total_Profit,

    ROUND(
        SUM(Profit) / NULLIF(SUM(Sales), 0) * 100,
        2
    ) AS Profit_Margin_Percentage

FROM salesdata

GROUP BY YEAR(`Order Date`)

ORDER BY Sales_Year;

WITH YearlySales AS
(
    SELECT
        YEAR(`Order Date`) AS Sales_Year,
        SUM(Sales) AS Total_Sales

    FROM salesdata

    GROUP BY YEAR(`Order Date`)
),

YearlyComparison AS
(
    SELECT
        Sales_Year,
        Total_Sales,

        LAG(Total_Sales) OVER (
            ORDER BY Sales_Year
        ) AS Previous_Year_Sales

    FROM YearlySales
)

SELECT
    Sales_Year,

    ROUND(Total_Sales, 2) AS Total_Sales,

    ROUND(Previous_Year_Sales, 2) AS Previous_Year_Sales,

    ROUND(
        (Total_Sales - Previous_Year_Sales)
        / NULLIF(Previous_Year_Sales, 0) * 100,
        2
    ) AS YoY_Growth_Percentage

FROM YearlyComparison

ORDER BY Sales_Year;

SELECT

    Discount,

    COUNT(*) AS Total_Transactions,

    ROUND(SUM(Sales), 2) AS Total_Sales,

    ROUND(SUM(Profit), 2) AS Total_Profit,

    ROUND(AVG(Profit), 2) AS Average_Profit,

    ROUND(
        SUM(Profit) / NULLIF(SUM(Sales), 0) * 100,
        2
    ) AS Profit_Margin_Percentage

FROM salesdata

GROUP BY Discount

ORDER BY Discount;

SELECT
    ROUND(AVG(Discount) * 100, 2) AS Average_Discount_Percentage
FROM salesdata;

SELECT

    `Product Name`,

    ROUND(SUM(Sales), 2) AS Total_Sales,

    ROUND(SUM(Profit), 2) AS Total_Profit,

    ROUND(AVG(Discount) * 100, 2)
        AS Average_Discount_Percentage,

    ROUND(
        SUM(Profit) / NULLIF(SUM(Sales), 0) * 100,
        2
    ) AS Profit_Margin_Percentage

FROM salesdata

GROUP BY `Product Name`

HAVING SUM(Profit) < 0
AND AVG(Discount) > 0.20

ORDER BY Total_Profit ASC;

SELECT

    CASE
        WHEN Discount = 0 THEN '0% - No Discount'
        WHEN Discount <= 0.10 THEN '1-10%'
        WHEN Discount <= 0.20 THEN '11-20%'
        WHEN Discount <= 0.30 THEN '21-30%'
        ELSE 'Above 30%'
    END AS Discount_Band,

    COUNT(*) AS Total_Transactions,

    ROUND(SUM(Sales), 2) AS Total_Sales,

    ROUND(SUM(Profit), 2) AS Total_Profit,

    ROUND(AVG(Profit), 2) AS Average_Profit,

    ROUND(
        SUM(Profit) / NULLIF(SUM(Sales), 0) * 100,
        2
    ) AS Profit_Margin_Percentage

FROM salesdata

GROUP BY Discount_Band

ORDER BY
    MIN(Discount);
    
SELECT

    `Customer Name`,

    ROUND(SUM(Sales), 2) AS Total_Revenue

FROM salesdata

GROUP BY `Customer Name`

ORDER BY Total_Revenue DESC

LIMIT 10;

SELECT

    `Customer Name`,

    ROUND(SUM(Profit), 2) AS Total_Profit

FROM salesdata

GROUP BY `Customer Name`

ORDER BY Total_Profit DESC

LIMIT 10;

SELECT

    `Customer Name`,

    COUNT(DISTINCT `Order ID`) AS Total_Orders,

    ROUND(SUM(Sales), 2) AS Total_Revenue,

    ROUND(SUM(Profit), 2) AS Total_Profit

FROM salesdata

GROUP BY `Customer Name`

HAVING COUNT(DISTINCT `Order ID`) > 1

ORDER BY Total_Orders DESC;

SELECT

    ROUND(SUM(Sales), 2) AS Total_Sales,

    ROUND(SUM(Profit), 2) AS Total_Profit,

    ROUND(
        SUM(Profit) / NULLIF(SUM(Sales), 0) * 100,
        2
    ) AS Profit_Margin_Percentage,

    COUNT(DISTINCT `Order ID`) AS Order_Count,

    ROUND(
        SUM(Sales) /
        NULLIF(COUNT(DISTINCT `Order ID`), 0),
        2
    ) AS Average_Order_Value,

    SUM(Quantity) AS Total_Quantity,

    COUNT(*) AS Total_Records

FROM salesdata;