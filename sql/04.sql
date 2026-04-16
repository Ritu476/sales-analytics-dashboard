SELECT *
FROM sales_clean
WHERE orderdate IS NULL
   OR productkey IS NULL
   OR resellerkey IS NULL
   OR employeekey IS NULL
   OR salesterritorykey IS NULL;

   SELECT *
FROM sales_clean
WHERE sales <= 0
   OR quantity <= 0
   OR unitprice <= 0;

 SELECT *
FROM sales_clean
WHERE totalproductcost < 0;  

UPDATE product_clean
SET product = TRIM(product),
    color = TRIM(color),
    subcategory = TRIM(subcategory),
    category = TRIM(category);

	UPDATE reseller_clean
SET reseller = TRIM(reseller),
    city = TRIM(city),
    state_province = TRIM(state_province),
    country_region = TRIM(country_region);

	UPDATE region_clean
SET region = TRIM(region),
    country = TRIM(country),
    group_name = TRIM(group_name);

	UPDATE salesperson_clean
SET salesperson = TRIM(salesperson),
    title = TRIM(title);

	SELECT productkey, COUNT(*)
FROM product_clean
GROUP BY productkey
HAVING COUNT(*) > 1;

SELECT resellerkey, COUNT(*)
FROM reseller_clean
GROUP BY resellerkey
HAVING COUNT(*) > 1;

SELECT employeekey, COUNT(*)
FROM salesperson_clean
GROUP BY employeekey
HAVING COUNT(*) > 1;

SELECT salesterritorykey, COUNT(*)
FROM region_clean
GROUP BY salesterritorykey
HAVING COUNT(*) > 1;

SELECT
    salesordernumber,
    sales,
    totalproductcost,
    (sales - totalproductcost) AS expected_profit
FROM sales_clean;