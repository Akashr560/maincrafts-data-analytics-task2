-- ============================================
-- MainCrafts Technology Internship
-- Data Analytics & Business Intelligence
-- Task 2 - SQL Analysis
-- ============================================

-- ============================================
-- Query 1: INNER JOIN (Orders + Customers)
-- ============================================

SELECT
    o.Order_ID,
    o.Order_Date,
    c.Customer_Name,
    c.Region,
    c.Segment,
    o.Product_Category,
    o.Sales,
    o.Quantity,
    o.Profit,
    o.Discount
FROM orders o
INNER JOIN customers c
ON o.Customer_ID = c.Customer_ID;

-- ============================================
-- Query 2: Total Sales by Region
-- ============================================

SELECT
    c.Region,
    SUM(o.Sales) AS Total_Sales
FROM orders o
INNER JOIN customers c
ON o.Customer_ID = c.Customer_ID
GROUP BY c.Region
ORDER BY Total_Sales DESC;

-- ============================================
-- Query 3: Profit Margin by Category
-- ============================================

SELECT
    Product_Category,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin
FROM orders
GROUP BY Product_Category;

-- ============================================
-- Query 4: Monthly Sales Trend
-- ============================================

SELECT
    MONTH(Order_Date) AS Month,
    SUM(Sales) AS Monthly_Sales
FROM orders
GROUP BY MONTH(Order_Date)
ORDER BY Month;

-- ============================================
-- Query 5: Top 5 Customers by Revenue
-- ============================================

SELECT
    c.Customer_Name,
    SUM(o.Sales) AS Total_Revenue
FROM orders o
INNER JOIN customers c
ON o.Customer_ID = c.Customer_ID
GROUP BY c.Customer_Name
ORDER BY Total_Revenue DESC
LIMIT 5;

-- ============================================
-- Query 6: Total Orders by Region
-- ============================================

SELECT
    c.Region,
    COUNT(o.Order_ID) AS Total_Orders
FROM orders o
INNER JOIN customers c
ON o.Customer_ID = c.Customer_ID
GROUP BY c.Region
ORDER BY Total_Orders DESC;

-- ============================================
-- Query 7: Average Sales by Category
-- ============================================

SELECT
    Product_Category,
    ROUND(AVG(Sales), 2) AS Average_Sales
FROM orders
GROUP BY Product_Category;

-- ============================================
-- Query 8: Total Profit by Region
-- ============================================

SELECT
    c.Region,
    SUM(o.Profit) AS Total_Profit
FROM orders o
INNER JOIN customers c
ON o.Customer_ID = c.Customer_ID
GROUP BY c.Region
ORDER BY Total_Profit DESC;

-- ============================================
-- Query 9: Customer Count by Segment
-- ============================================

SELECT
    Segment,
    COUNT(Customer_ID) AS Total_Customers
FROM customers
GROUP BY Segment;

-- ============================================
-- Query 10: Overall Business KPIs
-- ============================================

SELECT
    COUNT(Order_ID) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND((SUM(Profit)/SUM(Sales))*100,2) AS Profit_Margin,
    ROUND(AVG(Sales),2) AS Average_Order_Value
FROM orders;

-- ============================================
-- End of SQL Queries
-- ============================================