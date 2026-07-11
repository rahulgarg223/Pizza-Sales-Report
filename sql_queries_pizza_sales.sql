USE startersql;

-- ============================================================
-- PIZZA SALES ANALYSIS SQL QUERIES
-- ============================================================

-- KPI 1 : Total Revenue
SELECT
    ROUND(SUM(total_price),2) AS Total_Revenue
FROM pizza_sales;

-- ============================================================

-- KPI 2 : Average Order Value
SELECT
    ROUND(SUM(total_price) / COUNT(DISTINCT order_id),2) AS Avg_Order_Value
FROM pizza_sales;

-- ============================================================

-- KPI 3 : Total Pizzas Sold
SELECT
    SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales;

-- ============================================================

-- KPI 4 : Total Orders
SELECT
    COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales;

-- ============================================================

-- KPI 5 : Average Pizzas Per Order
SELECT
    ROUND(SUM(quantity) / COUNT(DISTINCT order_id),2) AS Avg_Pizzas_Per_Order
FROM pizza_sales;

-- ============================================================

-- ============================================================
-- DAILY TREND FOR TOTAL ORDERS
-- ============================================================

SELECT
    DAYNAME(order_date) AS Order_Day,
    COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY
    DAYOFWEEK(order_date),
    DAYNAME(order_date)
ORDER BY
    DAYOFWEEK(order_date);

-- ============================================================
-- MONTHLY TREND FOR TOTAL ORDERS
-- ============================================================

SELECT
    MONTHNAME(order_date) AS Month_Name,
    COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY
    MONTH(order_date),
    MONTHNAME(order_date)
ORDER BY
    MONTH(order_date);

-- ============================================================
-- PERCENTAGE OF SALES BY PIZZA CATEGORY
-- ============================================================

SELECT
    pizza_category,
    ROUND(SUM(total_price),2) AS Revenue,
    ROUND(
        (SUM(total_price) * 100) /
        (SELECT SUM(total_price) FROM pizza_sales),
        2
    ) AS Percentage_of_Sales
FROM pizza_sales
GROUP BY
    pizza_category
ORDER BY
    Revenue DESC;

-- ============================================================
-- TOTAL PIZZA SOLD BY PIZZA CATEGORY
-- ============================================================

SELECT
    pizza_category,
    SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY
    pizza_category
ORDER BY
    Total_Pizza_Sold DESC;

-- ============================================================
-- PERCENTAGE OF SALES BY PIZZA SIZE
-- ============================================================

SELECT
    pizza_size,
    ROUND(SUM(total_price),2) AS Revenue,
    ROUND(
        (SUM(total_price) * 100) /
        (SELECT SUM(total_price) FROM pizza_sales),
        2
    ) AS Percentage_of_Sales
FROM pizza_sales
GROUP BY
    pizza_size
ORDER BY
    Revenue DESC;

-- ============================================================
-- TOP 5 PIZZAS BY REVENUE
-- ============================================================

SELECT
    pizza_name,
    ROUND(SUM(total_price),2) AS Revenue
FROM pizza_sales
GROUP BY
    pizza_name
ORDER BY
    Revenue DESC
LIMIT 5;

-- ============================================================
-- BOTTOM 5 PIZZAS BY REVENUE
-- ============================================================

SELECT
    pizza_name,
    ROUND(SUM(total_price),2) AS Revenue
FROM pizza_sales
GROUP BY
    pizza_name
ORDER BY
    Revenue ASC
LIMIT 5;

-- ============================================================
-- TOP 5 PIZZAS BY QUANTITY
-- ============================================================

SELECT
    pizza_name,
    SUM(quantity) AS Quantity_Sold
FROM pizza_sales
GROUP BY
    pizza_name
ORDER BY
    Quantity_Sold DESC
LIMIT 5;

-- ============================================================
-- BOTTOM 5 PIZZAS BY QUANTITY
-- ============================================================

SELECT
    pizza_name,
    SUM(quantity) AS Quantity_Sold
FROM pizza_sales
GROUP BY
    pizza_name
ORDER BY
    Quantity_Sold ASC
LIMIT 5;

-- ============================================================
-- TOP 5 PIZZAS BY TOTAL ORDERS
-- ============================================================

SELECT
    pizza_name,
    COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY
    pizza_name
ORDER BY
    Total_Orders DESC
LIMIT 5;

-- ============================================================
-- BOTTOM 5 PIZZAS BY TOTAL ORDERS
-- ============================================================

SELECT
    pizza_name,
    COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY
    pizza_name
ORDER BY
    Total_Orders ASC
LIMIT 5;