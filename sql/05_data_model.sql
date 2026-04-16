DROP TABLE IF EXISTS dim_product;
CREATE TABLE dim_product AS
SELECT
    productkey,
    product,
    standard_cost,
    color,
    subcategory,
    category
FROM product_clean;

DROP TABLE IF EXISTS dim_region;
CREATE TABLE dim_region AS
SELECT
    salesterritorykey,
    region,
    country,
    group_name
FROM region_clean;

DROP TABLE IF EXISTS dim_reseller;
CREATE TABLE dim_reseller AS
SELECT
    resellerkey,
    reseller,
    city,
    state_province,
    country_region
FROM reseller_clean;

DROP TABLE IF EXISTS dim_salesperson;
CREATE TABLE dim_salesperson AS
SELECT
    employeekey,
    salesperson,
    title
FROM salesperson_clean;

DROP TABLE IF EXISTS fact_sales;

CREATE TABLE fact_sales AS
SELECT
    salesordernumber,
    orderdate,
    EXTRACT(YEAR FROM orderdate) AS order_year,
    EXTRACT(MONTH FROM orderdate) AS order_month,
    productkey,
    resellerkey,
    employeekey,
    salesterritorykey,
    quantity,
    unitprice,
    sales AS revenue,
    totalproductcost,
    (sales - totalproductcost) AS profit
FROM sales_clean;

SELECT COUNT(*) FROM fact_sales;
SELECT * FROM fact_sales LIMIT 10;

DROP VIEW IF EXISTS vw_monthly_sales;

CREATE VIEW vw_monthly_sales AS
SELECT
    DATE_TRUNC('month', orderdate) AS month_start,
    SUM(revenue) AS monthly_revenue,
    SUM(totalproductcost) AS monthly_cost,
    SUM(profit) AS monthly_profit,
    SUM(quantity) AS total_quantity
FROM fact_sales
GROUP BY DATE_TRUNC('month', orderdate)
ORDER BY month_start;
SELECT * FROM vw_monthly_sales;

SELECT SUM(revenue), SUM(profit) FROM fact_sales;
SELECT order_year, SUM(revenue)
FROM fact_sales
GROUP BY order_year;
