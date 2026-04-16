-- A. Total sales per category
SELECT 
    p.category, 
    SUM(f.total_sales) AS total_revenue
FROM fact_sales f
JOIN dim_product p ON f.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;


-- B. Count of Sales by region (top 5)
SELECT 
    c.region, 
    COUNT(f.invoice_id) AS total_transactions
FROM fact_sales f
JOIN dim_country c ON f.country_id = c.country_id
GROUP BY c.region
ORDER BY total_transactions DESC
LIMIT 5;

-- C. Monthly sales trend
SELECT 
    d.year, 
    d.month, 
    SUM(f.total_sales) AS total_revenue
FROM fact_sales f
JOIN dim_date d ON f.date_id = d.date_id
GROUP BY d.year, d.month
ORDER BY d.year ASC, d.month ASC;

-- D. Top spending customer (top 5)
SELECT 
    customer_id, 
    SUM(total_sales) AS total_spent
FROM fact_sales
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 5;


-- E. Peak sales hour
SELECT 
    t.hour, 
    SUM(f.total_sales) AS total_revenue,
    COUNT(f.invoice_id) AS total_transactions
FROM fact_sales f
JOIN dim_time t ON f.time_id = t.time_id
GROUP BY t.hour
ORDER BY total_revenue DESC;

-- F. Top 10 Countries by Average Order Value (AOV)
SELECT 
    c.country, 
    COUNT(DISTINCT f.invoice_id) AS total_orders, 
    SUM(f.total_sales) AS total_revenue,
    SUM(f.total_sales) / COUNT(DISTINCT f.invoice_id) AS average_order_value
FROM fact_sales f
JOIN dim_country c ON f.country_id = c.country_id
GROUP BY c.country
ORDER BY average_order_value DESC
LIMIT 10;

-- G. Sales Trend by Time Period (Morning/Afternoon/Evening/Night)
SELECT 
    t.time_of_day, 
    COUNT(DISTINCT f.invoice_id) AS total_transactions, 
    SUM(f.total_sales) AS total_revenue
FROM fact_sales f
JOIN dim_time t ON f.time_id = t.time_id
GROUP BY t.time_of_day
ORDER BY total_revenue DESC;


