
-- =====================================================
-- Database      : trains_dw
-- Schema Type   : Star Schema (Retail Sales)
-- Generated     : Alternative Style SQL
-- =====================================================

SET SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO';
SET time_zone = '+00:00';

START TRANSACTION;

-- =====================================================
-- DIMENSION: CUSTOMER
-- =====================================================
CREATE TABLE dim_customer (
    customer_key INT AUTO_INCREMENT PRIMARY KEY,
    customer_id VARCHAR(50),
    customer_name VARCHAR(255),
    segment VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_general_ci;

-- =====================================================
-- DIMENSION: PRODUCT
-- =====================================================
CREATE TABLE dim_product (
    product_key INT AUTO_INCREMENT PRIMARY KEY,
    product_id VARCHAR(50),
    product_name VARCHAR(255),
    category VARCHAR(100),
    sub_category VARCHAR(100)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_general_ci;

-- =====================================================
-- DIMENSION: TIME
-- =====================================================
CREATE TABLE dim_time (
    time_key INT AUTO_INCREMENT PRIMARY KEY,
    full_date DATE,
    day INT,
    month INT,
    quarter INT,
    year INT
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_general_ci;

-- =====================================================
-- FACT TABLE: SALES
-- =====================================================
CREATE TABLE fact_sales (
    sales_key INT AUTO_INCREMENT PRIMARY KEY,
    order_id VARCHAR(50),
    product_key INT,
    customer_key INT,
    time_key INT,
    sales DECIMAL(10,2),

    INDEX idx_product (product_key),
    INDEX idx_customer (customer_key),
    INDEX idx_time (time_key),

    CONSTRAINT fk_sales_product
        FOREIGN KEY (product_key)
        REFERENCES dim_product(product_key),

    CONSTRAINT fk_sales_customer
        FOREIGN KEY (customer_key)
        REFERENCES dim_customer(customer_key),

    CONSTRAINT fk_sales_time
        FOREIGN KEY (time_key)
        REFERENCES dim_time(time_key)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_general_ci;

COMMIT;
