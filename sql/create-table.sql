-- ==========================================
-- 1. MEMBUAT DIMENSION TABLES
-- ==========================================

CREATE TABLE dim_country (
    country_id INT PRIMARY KEY,
    country VARCHAR(255),
    region VARCHAR(255)
);

CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name TEXT,
    category VARCHAR(255)
);

CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    day_of_week VARCHAR(50),
    month INT,
    quarter INT,
    year INT
);

CREATE TABLE dim_time (
    time_id INT PRIMARY KEY,
    hour INT,
    time_of_day VARCHAR(50),
    period VARCHAR(10)
);

-- ==========================================
-- 2. MEMBUAT FACT TABLE
-- ==========================================

CREATE TABLE fact_sales (
    invoice_id VARCHAR(50),
    product_id INT,
    customer_id VARCHAR(50),
    country_id INT,
    date_id INT,
    time_id INT,
    quantity INT,
    unit_price NUMERIC(10, 2),
    total_sales NUMERIC(12, 2)
);