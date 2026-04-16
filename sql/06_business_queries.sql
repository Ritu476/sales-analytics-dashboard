SELECT
    SUM(revenue) AS total_revenue,
    SUM(totalproductcost) AS total_cost,
    SUM(profit) AS total_profit
FROM fact_sales;

SELECT
    order_year,
    order_month,
    SUM(revenue) AS monthly_revenue,
    SUM(profit) AS monthly_profit
FROM fact_sales
GROUP BY order_year, order_month
ORDER BY order_year, order_month;

SELECT
    p.product,
    SUM(f.revenue) AS total_revenue,
    SUM(f.profit) AS total_profit
FROM fact_sales f
JOIN dim_product p
    ON f.productkey = p.productkey
GROUP BY p.product
ORDER BY total_revenue DESC
LIMIT 10;

SELECT
    r.region,
    r.country,
    SUM(f.revenue) AS total_revenue,
    SUM(f.profit) AS total_profit
FROM fact_sales f
JOIN dim_region r
    ON f.salesterritorykey = r.salesterritorykey
GROUP BY r.region, r.country
ORDER BY total_revenue DESC;

SELECT
    s.salesperson,
    SUM(f.revenue) AS total_revenue,
    SUM(f.profit) AS total_profit
FROM fact_sales f
JOIN dim_salesperson s
    ON f.employeekey = s.employeekey
GROUP BY s.salesperson
ORDER BY total_revenue DESC
LIMIT 10;

