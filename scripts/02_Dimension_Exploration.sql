/* 
=====================================================================================
                                02_Dimension_Exploration
=====================================================================================
*/

-- Countries our customers come from
SELECT DISTINCT country
FROM gold.dim_customers
ORDER BY country;

-- Marital status values
SELECT DISTINCT marital_status
FROM gold.dim_customers
ORDER BY marital_status;

-- Gender values
SELECT DISTINCT gender
FROM gold.dim_customers
ORDER BY gender;

-- Full product hierarchy (category → subcategory → product)
SELECT DISTINCT category, subcategory, product_name
FROM gold.dim_products
ORDER BY 1, 2, 3;

-- Product lines
SELECT DISTINCT product_line
FROM gold.dim_products
ORDER BY product_line;

-- Categories and their depth (how many subcategories each has)
SELECT category, COUNT(DISTINCT subcategory) AS subcategory_count
FROM gold.dim_products
GROUP BY category
ORDER BY category;
