DROP TABLE IF EXISTS sales CASCADE;
DROP TABLE IF EXISTS salespersonregion CASCADE;
DROP TABLE IF EXISTS targets CASCADE;
DROP TABLE IF EXISTS product CASCADE;
DROP TABLE IF EXISTS region CASCADE;
DROP TABLE IF EXISTS reseller CASCADE;
DROP TABLE IF EXISTS salesperson CASCADE;

CREATE TABLE product (
    productkey INT PRIMARY KEY,
    product VARCHAR(255),
    standard_cost NUMERIC(12,2),
    color VARCHAR(100),
    subcategory VARCHAR(255),
    category VARCHAR(255),
    background_color_format VARCHAR(20),
    font_color_format VARCHAR(20)
);

CREATE TABLE region (
    salesterritorykey INT PRIMARY KEY,
    region VARCHAR(100),
    country VARCHAR(100),
    group_name VARCHAR(100)
);

CREATE TABLE reseller (
    resellerkey INT PRIMARY KEY,
    business_type VARCHAR(100),
    reseller VARCHAR(255),
    city VARCHAR(100),
    state_province VARCHAR(100),
    country_region VARCHAR(100)
);

CREATE TABLE salesperson (
    employeekey INT PRIMARY KEY,
    employeeid BIGINT,
    salesperson VARCHAR(255),
    title VARCHAR(255),
    upn VARCHAR(255)
);

CREATE TABLE salespersonregion (
    employeekey INT,
    salesterritorykey INT,
    PRIMARY KEY (employeekey, salesterritorykey),
    CONSTRAINT fk_salespersonregion_employee
        FOREIGN KEY (employeekey) REFERENCES salesperson(employeekey),
    CONSTRAINT fk_salespersonregion_region
        FOREIGN KEY (salesterritorykey) REFERENCES region(salesterritorykey)
);

CREATE TABLE targets (
    employeekey INT,
    target_year INT,
    target_month INT,
    target_amount NUMERIC(12,2),
    PRIMARY KEY (employeekey, target_year, target_month),
    CONSTRAINT fk_targets_employee
        FOREIGN KEY (employeekey) REFERENCES salesperson(employeekey)
);

CREATE TABLE sales (
    salesordernumber VARCHAR(50),
    salesorderlinenumber INT,
    orderdate DATE,
    productkey INT,
    resellerkey INT,
    employeekey INT,
    salesterritorykey INT,
    orderquantity INT,
    unitprice NUMERIC(12,2),
    salesamount NUMERIC(12,2),
    totalproductcost NUMERIC(12,2),
    PRIMARY KEY (salesordernumber, salesorderlinenumber),

    CONSTRAINT fk_sales_product
        FOREIGN KEY (productkey) REFERENCES product(productkey),
    CONSTRAINT fk_sales_reseller
        FOREIGN KEY (resellerkey) REFERENCES reseller(resellerkey),
    CONSTRAINT fk_sales_employee
        FOREIGN KEY (employeekey) REFERENCES salesperson(employeekey),
    CONSTRAINT fk_sales_region
        FOREIGN KEY (salesterritorykey) REFERENCES region(salesterritorykey)
);

DROP TABLE IF EXISTS stg_targets;

CREATE TABLE stg_targets (
    employeeid BIGINT,
    target_amount NUMERIC,
    target_date DATE
);

DROP TABLE IF EXISTS stg_sales;

CREATE TABLE stg_sales (
    salesordernumber VARCHAR(50),
    orderdate VARCHAR(20),
    productkey INT,
    resellerkey INT,
    employeekey INT,
    salesterritorykey INT,
    quantity INT,
    unitprice NUMERIC(10,2),
    sales NUMERIC(10,2),
    totalproductcost NUMERIC(10,2)
);