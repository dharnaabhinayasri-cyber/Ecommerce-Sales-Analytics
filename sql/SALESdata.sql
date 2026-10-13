USE ecommerce_analysis;
SELECT COUNT(*) AS Total_Rows
FROM salesdata;
SELECT COUNT(*) AS Total_Columns
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'ecommerce_analysis'
  AND TABLE_NAME = 'salesdata';
  DESCRIBE salesdata;
  SELECT *
FROM salesdata
LIMIT 10;
SELECT 
    SUM(Sales) AS Total_Revenue
FROM salesdata;
SELECT 
    SUM(Profit) AS Total_Profit
FROM salesdata;
SELECT COUNT(DISTINCT `Order ID`) AS Total_Orders
FROM salesdata;
SELECT 
    SUM(Quantity) AS Total_Quantity
FROM salesdata;
SELECT 
    SUM(Sales) / COUNT(DISTINCT `Order ID`) AS Average_Order_Value
FROM salesdata;
SELECT 
    Category,
    SUM(Sales) AS Total_Sales
FROM salesdata
GROUP BY Category
ORDER BY Total_Sales DESC
LIMIT 1;
SELECT 
    Category,
    SUM(Profit) AS Total_Profit
FROM salesdata
GROUP BY Category
ORDER BY Total_Profit DESC
LIMIT 1;
SELECT 
    Category,
    SUM(Profit) AS Total_Profit
FROM salesdata
GROUP BY Category
ORDER BY Total_Profit ASC
LIMIT 1;
SELECT 
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Profit) / SUM(Sales) AS Profit_Margin
FROM salesdata
GROUP BY Category
ORDER BY Total_Profit DESC;
SELECT 
    `Sub-Category`,
    SUM(Profit) AS Total_Profit
FROM salesdata
GROUP BY `Sub-Category`
HAVING SUM(Profit) < 0
ORDER BY Total_Profit ASC;
SELECT 
    `Sub-Category`,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Profit) / SUM(Sales) AS Profit_Margin
FROM salesdata
GROUP BY `Sub-Category`
ORDER BY Total_Profit ASC;
SELECT 
    `Product Name`,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM salesdata
GROUP BY `Product Name`
HAVING SUM(Sales) > 10000
   AND SUM(Profit) < 1000
ORDER BY Total_Sales DESC;
SELECT 
    Region,
    SUM(Sales) AS Total_Sales
FROM salesdata
GROUP BY Region
ORDER BY Total_Sales DESC
LIMIT 1;
SELECT 
    Region,
    SUM(Profit) AS Total_Profit
FROM salesdata
GROUP BY Region
ORDER BY Total_Profit DESC
LIMIT 1;
SELECT 
    Region,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Profit) / SUM(Sales) AS Profit_Margin
FROM salesdata
GROUP BY Region
ORDER BY Profit_Margin ASC
LIMIT 1;
SELECT 
    Region,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent
FROM salesdata
GROUP BY Region
ORDER BY Profit_Margin_Percent ASC;
SELECT 
    `Customer Name`,
    SUM(Sales) AS Total_Revenue
FROM salesdata
GROUP BY `Customer Name`
ORDER BY Total_Revenue DESC
LIMIT 10;
SELECT 
    `Customer Name`,
    SUM(Profit) AS Total_Profit
FROM salesdata
GROUP BY `Customer Name`
ORDER BY Total_Profit DESC
LIMIT 10;
SELECT 
    `Customer Name`,
    COUNT(DISTINCT `Order ID`) AS Total_Orders
FROM salesdata
GROUP BY `Customer Name`
HAVING COUNT(DISTINCT `Order ID`) > 1
ORDER BY Total_Orders DESC;
SELECT 
    AVG(Customer_Revenue) AS Average_Revenue_Per_Customer
FROM
(
    SELECT 
        `Customer Name`,
        SUM(Sales) AS Customer_Revenue
    FROM salesdata
    GROUP BY `Customer Name`
) AS CustomerSummary;
SELECT 
    DATE_FORMAT(`Order Date`, '%Y-%m') AS Month,
    SUM(Sales) AS Total_Sales
FROM salesdata
GROUP BY DATE_FORMAT(`Order Date`, '%Y-%m')
ORDER BY Month;
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
    Total_Sales,
    Previous_Year_Sales,
    ROUND(
        (Total_Sales - Previous_Year_Sales)
        / NULLIF(Previous_Year_Sales, 0) * 100,
        2
    ) AS YoY_Growth_Percent
FROM YearlyComparison
ORDER BY Sales_Year;
SELECT 
    AVG(Discount) AS Average_Discount
FROM salesdata;
SELECT 
    Discount,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Profit) / SUM(Sales) AS Profit_Margin
FROM salesdata
GROUP BY Discount
ORDER BY Discount;
SELECT 
    `Product Name`,
    AVG(Discount) AS Average_Discount
FROM salesdata
GROUP BY `Product Name`
HAVING AVG(Discount) > 0.30
ORDER BY Average_Discount DESC;
SELECT 
    `Product Name`,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    AVG(Discount) AS Average_Discount
FROM salesdata
GROUP BY `Product Name`
HAVING SUM(Profit) < 0
   AND AVG(Discount) > 0.20
ORDER BY Total_Profit ASC;
SELECT COUNT(*) AS Total_Rows
FROM salesdata;
SELECT COUNT(*) AS Total_Columns
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'ecommerce_analysis'
  AND TABLE_NAME = 'salesdata';
  SELECT 
    SUM(Sales) AS Total_Revenue,
    SUM(Profit) AS Total_Profit,
    COUNT(DISTINCT `Order ID`) AS Total_Orders,
    SUM(Quantity) AS Total_Quantity,
    ROUND(
        SUM(Profit) / NULLIF(SUM(Sales), 0) * 100,
        2
    ) AS Profit_Margin_Percent
FROM salesdata;
SELECT 
    Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(
        SUM(Profit) / NULLIF(SUM(Sales), 0) * 100,
        2
    ) AS Profit_Margin_Percent
FROM salesdata
GROUP BY Category
ORDER BY Total_Profit DESC;
SELECT 
    Discount,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(
        SUM(Profit) / NULLIF(SUM(Sales), 0) * 100,
        2
    ) AS Profit_Margin_Percent
FROM salesdata
GROUP BY Discount
ORDER BY Discount;
SELECT
    Category,
    Discount,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(
        SUM(Profit) / NULLIF(SUM(Sales), 0) * 100,
        2
    ) AS Profit_Margin_Percent
FROM salesdata
GROUP BY Category, Discount
ORDER BY Category, Discount;
SELECT 
    `Product Name`,
    AVG(Discount) AS Average_Discount
FROM salesdata
GROUP BY `Product Name`
HAVING AVG(Discount) > 0.30
ORDER BY Average_Discount DESC;
SELECT 
    `Product Name`,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    AVG(Discount) AS Average_Discount,
    ROUND(SUM(Profit) / NULLIF(SUM(Sales), 0) * 100, 2) AS Profit_Margin_Percent
FROM salesdata
GROUP BY `Product Name`
HAVING AVG(Discount) > 0.30
ORDER BY Average_Discount DESC;
SELECT 
    `Product Name`,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    AVG(Discount) AS Average_Discount,
    ROUND(SUM(Profit) / NULLIF(SUM(Sales), 0) * 100, 2) AS Profit_Margin_Percent
FROM salesdata
GROUP BY `Product Name`
HAVING AVG(Discount) > 0.30
   AND SUM(Profit) < 0
ORDER BY Total_Profit ASC;
SELECT 
    Discount,
    COUNT(*) AS Total_Rows,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit) / NULLIF(SUM(Sales), 0) * 100, 2) AS Profit_Margin_Percent
FROM salesdata
GROUP BY Discount
ORDER BY Discount;
SELECT 
    `Product Name`,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    AVG(Discount) AS Average_Discount
FROM salesdata
GROUP BY `Product Name`
HAVING SUM(Profit) < 0
   AND AVG(Discount) > 0.20
ORDER BY Total_Profit ASC;
SELECT
    Discount,
    COUNT(*) AS Total_Transactions,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit) / NULLIF(SUM(Sales), 0) * 100, 2) AS Profit_Margin_Percent
FROM salesdata
GROUP BY Discount
ORDER BY Discount;
SELECT
    `Product Name`,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(AVG(Discount) * 100, 2) AS Average_Discount_Percent,
    ROUND(SUM(Profit) / NULLIF(SUM(Sales), 0) * 100, 2) AS Profit_Margin_Percent
FROM salesdata
GROUP BY `Product Name`
HAVING SUM(Sales) > 5000
   AND SUM(Profit) < 0
ORDER BY Total_Profit ASC;
SELECT 
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent
FROM salesdata
GROUP BY Category
ORDER BY Total_Profit DESC;
SELECT 
    Region,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent
FROM salesdata
GROUP BY Region
ORDER BY Profit_Margin_Percent ASC;
SELECT 
    Discount,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent
FROM salesdata
GROUP BY Discount
ORDER BY Discount;
SELECT 
    YEAR(`Order Date`) AS Sales_Year,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent
FROM salesdata
GROUP BY YEAR(`Order Date`)
ORDER BY Sales_Year;

-- 1. Check the record count
SELECT COUNT(*) AS row_count
FROM salesdata;

-- 2. Validate the core financial KPIs
SELECT
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(SUM(Profit) / NULLIF(SUM(Sales), 0) * 100, 2)
        AS profit_margin_pct
FROM salesdata;

-- 3. Identify loss-making sub-categories
SELECT
    Category,
    `Sub-Category`,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM salesdata
GROUP BY Category, `Sub-Category`
HAVING SUM(Profit) < 0
ORDER BY total_profit ASC;