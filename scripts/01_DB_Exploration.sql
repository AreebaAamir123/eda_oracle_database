/* 
=====================================================================================
                                01_DB_Exploration
=====================================================================================
*/


-- Explore the views 
SELECT * FROM ALL_VIEWS
WHERE OWNER IN ('GOLD')

/* 
Explore Columns:

⚠️Important Difference
 Oracle stores unquoted names as all uppercase (DIM_CUSTOMERS)
EXAMPLE:
WHERE TABLE_NAME = 'DIM_CUSTOMERS'   -- ✅ works
WHERE TABLE_NAME = 'dim_customers'   -- ❌ returns nothing
*/
  
DESCRIBE gold.dim_customers;
DESCRIBE gold.dim_products;
DESCRIBE gold.fact_sales;
