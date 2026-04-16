CREATE TABLE product_clean AS
SELECT
    productkey,
    product,
    REPLACE(REPLACE(standard_cost, '$', ''), ',', '')::NUMERIC AS standard_cost,
    color,
    subcategory,
    category
FROM stg_product;

CREATE TABLE region_clean AS
SELECT
    salesterritorykey,
    region,
    country,
    group_name
FROM stg_region;

CREATE TABLE reseller_clean AS
SELECT
    resellerkey,
    reseller,
    city,
    state_province,
    country_region
FROM stg_reseller;

CREATE TABLE salesperson_clean AS
SELECT
    employeekey,
    salesperson,
    title
FROM stg_salesperson;

CREATE TABLE targets_clean AS
SELECT
    employeeid,
    target_amount,
    target_date
FROM stg_targets;

CREATE TABLE sales_clean AS
SELECT
    salesordernumber,
    TO_DATE(orderdate, 'DD-MM-YYYY') AS orderdate,
    productkey,
    resellerkey,
    employeekey,
    salesterritorykey,
    quantity,
    unitprice,
    sales,
    totalproductcost
FROM stg_sales;

SELECT COUNT(*) FROM sales_clean;
SELECT COUNT(*) FROM product_clean;
SELECT * FROM sales_clean LIMIT 5;