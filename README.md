# BI-DATA-
DATA SQL BI 
Overview

This SQL file contains the schema for the trains_dw database designed for a retail sales data warehouse. It follows the Star Schema design, which is a common approach for structuring data warehouses to enable efficient sales analysis.

The schema includes four main tables:

dim_customer: Contains details about the customers.

dim_product: Contains information about the products.

dim_time: Represents time-related data (date, month, year, etc.).

fact_sales: Stores the actual sales data, linking to the dimension tables via foreign keys.

This database design is optimized for analytical queries, making it suitable for sales trend analysis and performance tracking.
