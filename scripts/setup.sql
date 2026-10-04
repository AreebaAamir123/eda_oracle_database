/* 
======================================================================
                      USER SETUP
=====================================================================
Each script is **self-contained** — you can run any of them independently
against the `eda` connection.

---

## 🚀 How to Run

### Prerequisites

1. Oracle XE 21c installed and running (service name `XEPDB1`)
2. The DWH project already built (Bronze → Silver → Gold) 
3. A dedicated `eda` user created with `SELECT` access to Silver and Gold

### Setup the EDA user

Run as `SYS AS SYSDBA`:
 */

ALTER SESSION SET CONTAINER = XEPDB1;
CREATE USER eda IDENTIFIED BY YourPassword;
GRANT CONNECT, CREATE SESSION, UNLIMITED TABLESPACE TO eda;


-- Log in as silver user to run : 
GRANT SELECT ON crm_cust_info     TO gold WITH GRANT OPTION;
GRANT SELECT ON crm_prd_info      TO gold WITH GRANT OPTION;
GRANT SELECT ON crm_sales_details TO gold WITH GRANT OPTION;
GRANT SELECT ON erp_cust_az12     TO gold WITH GRANT OPTION;
GRANT SELECT ON erp_loc_a101      TO gold WITH GRANT OPTION;
GRANT SELECT ON erp_px_cat_g1v2   TO gold WITH GRANT OPTION;

--
-- Log in as gold user to run : 

GRANT SELECT ON dim_customers TO eda;
GRANT SELECT ON dim_products  TO eda;
GRANT SELECT ON fact_sales    TO eda;
