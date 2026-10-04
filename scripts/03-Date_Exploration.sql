/*
=======================================================================================
                                03-Date_Exploration.sql
=======================================================================================
*/

-- First and last order dates, plus the range
SELECT
    MIN(order_date)                                     AS first_order,
    MAX(order_date)                                     AS last_order,
    MAX(order_date) - MIN(order_date)                   AS range_days,
    TRUNC(MONTHS_BETWEEN(MAX(order_date), MIN(order_date)))     AS range_months,
    TRUNC(MONTHS_BETWEEN(MAX(order_date), MIN(order_date)) / 12) AS range_years
FROM gold.fact_sales
WHERE order_date IS NOT NULL;


-- Oldest and Youngest Customer in our DB

SELECT 
    MIN(birthdate) AS oldest_birthdate,
    TRUNC(MONTHS_BETWEEN(SYSDATE, MIN(birthdate)) / 12) AS oldest_age,
    MAX(birthdate) AS youngest_birthdate,
    TRUNC(MONTHS_BETWEEN(SYSDATE, MAX(birthdate)) / 12) AS youngest_age
FROM gold.dim_customers;
