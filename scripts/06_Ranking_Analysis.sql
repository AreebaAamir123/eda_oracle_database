/* =====================================================================
                           06_Ranking_Analysis
   ===================================================================== */

-- ---------------------------------------------------------------------
-- 1. Which 5 products generate the highest revenue?
-- ---------------------------------------------------------------------
SELECT
    p.product_name,
    SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p ON f.product_key = p.product_key
GROUP BY p.product_name
ORDER BY total_revenue DESC
FETCH FIRST 5 ROWS ONLY;


-- ---------------------------------------------------------------------
-- 2. What are the 5 worst-performing products in terms of sales?
-- ---------------------------------------------------------------------
SELECT
    p.product_name,
    SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p ON f.product_key = p.product_key
GROUP BY p.product_name
ORDER BY total_revenue ASC
FETCH FIRST 5 ROWS ONLY;


-- ---------------------------------------------------------------------
-- 3. Top 5 customers by revenue
-- ---------------------------------------------------------------------
SELECT
    c.customer_key,
    c.first_name || ' ' || c.last_name AS customer_name,
    c.country,
    SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c ON f.customer_key = c.customer_key
GROUP BY c.customer_key, c.first_name, c.last_name, c.country
ORDER BY total_revenue DESC
FETCH FIRST 5 ROWS ONLY;


-- ---------------------------------------------------------------------
-- 4. Top 5 customers with the FEWEST orders (still-active buyers only)
--    Note: this only counts customers who actually placed orders.
-- ---------------------------------------------------------------------
SELECT
    c.customer_key,
    c.first_name || ' ' || c.last_name AS customer_name,
    COUNT(DISTINCT f.order_number) AS total_orders
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c ON f.customer_key = c.customer_key
GROUP BY c.customer_key, c.first_name, c.last_name
ORDER BY total_orders ASC
FETCH FIRST 5 ROWS ONLY;


-- ---------------------------------------------------------------------
-- 5. Top 5 categories by revenue
-- ---------------------------------------------------------------------
SELECT
    p.category,
    SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p ON f.product_key = p.product_key
GROUP BY p.category
ORDER BY total_revenue DESC
FETCH FIRST 5 ROWS ONLY;
