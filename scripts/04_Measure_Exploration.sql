/* =====================================================================
                          04_Measure_Exploration
   ===================================================================== */

-- 1. Total Sales
SELECT SUM(sales_amount) AS total_sales
FROM gold.fact_sales;

-- 2. How many items are sold
SELECT SUM(quantity) AS total_items_sold
FROM gold.fact_sales;

-- 3. Average selling price
SELECT ROUND(AVG(price), 2) AS avg_selling_price
FROM gold.fact_sales;

-- 4. Total number of orders
SELECT COUNT(DISTINCT order_number) AS total_orders
FROM gold.fact_sales;

-- 5. Total number of products
SELECT COUNT(*) AS total_products
FROM gold.dim_products;

-- 6. Total number of customers
SELECT COUNT(*) AS total_customers
FROM gold.dim_customers;

-- 7. Total number of customers that have placed an order
SELECT COUNT(DISTINCT customer_key) AS customers_with_orders
FROM gold.fact_sales;
