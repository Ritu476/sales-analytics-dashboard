DROP TABLE IF EXISTS stg_product;
DROP TABLE IF EXISTS stg_region;
DROP TABLE IF EXISTS stg_reseller;
DROP TABLE IF EXISTS stg_salesperson;
DROP TABLE IF EXISTS stg_salespersonregion;
DROP TABLE IF EXISTS stg_targets;
DROP TABLE IF EXISTS stg_sales;

CREATE TABLE stg_product (
    productkey TEXT,
    product TEXT,
    standard_cost TEXT,
    color TEXT,
    subcategory TEXT,
    category TEXT,
    background_color_format TEXT,
    font_color_format TEXT
);

CREATE TABLE stg_region (
    salesterritorykey TEXT,
    region TEXT,
    country TEXT,
    group_name TEXT
);

CREATE TABLE stg_reseller (
    resellerkey TEXT,
    business_type TEXT,
    reseller TEXT,
    city TEXT,
    state_province TEXT,
    country_region TEXT
);

CREATE TABLE stg_salesperson (
    employeekey TEXT,
    employeeid TEXT,
    salesperson TEXT,
    title TEXT,
    upn TEXT
);

CREATE TABLE stg_salespersonregion (
    employeekey TEXT,
    salesterritorykey TEXT
);

CREATE TABLE stg_targets (
    employeekey TEXT,
    target_year TEXT,
    target_month TEXT,
    target_amount TEXT
);

CREATE TABLE stg_sales (
    salesordernumber TEXT,
    salesorderlinenumber TEXT,
    orderdate TEXT,
    productkey TEXT,
    resellerkey TEXT,
    employeekey TEXT,
    salesterritorykey TEXT,
    orderquantity TEXT,
    unitprice TEXT,
    salesamount TEXT,
    totalproductcost TEXT
);