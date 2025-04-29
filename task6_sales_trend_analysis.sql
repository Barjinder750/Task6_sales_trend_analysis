USE sales_db;
CREATE TABLE online_sales (
  order_date DATE,
  amount DECIMAL(10,2),
  product_id INT
);

-- Sales Trend Analysis

SELECT
  EXTRACT(YEAR FROM order_date) AS order_year,
  EXTRACT(MONTH FROM order_date) AS order_month,
  SUM(amount) AS total_revenue,
  COUNT(DISTINCT product_id) AS total_orders
FROM
  online_sales
GROUP BY
  EXTRACT(YEAR FROM order_date),
  EXTRACT(MONTH FROM order_date)
ORDER BY
  order_year,
  order_month;