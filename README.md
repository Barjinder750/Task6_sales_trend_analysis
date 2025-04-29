# Task 6: Sales Trend Analysis Using Aggregations

## Objective
Analyze monthly revenue and order volume from the `online_sales` dataset using SQL.

## Dataset Columns
- `order_date` — Date of each order
- `amount` — Revenue per order
- `product_id` — Unique product identifier

## Tools Used
- MySQL Workbench

## Approach
1. Extract year and month using `EXTRACT()`.
2. Calculate monthly totals using:
   - `SUM(amount)` for total revenue
   - `COUNT(DISTINCT product_id)` for total orders
3. Group by year and month.
4. Sort by chronological order.

## Main Query

```sql
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



Bonus Query : Top 3 Months by Revenue
SELECT
  EXTRACT(YEAR FROM order_date) AS order_year,
  EXTRACT(MONTH FROM order_date) AS order_month,
  SUM(amount) AS total_revenue
FROM
  online_sales
GROUP BY
  EXTRACT(YEAR FROM order_date),
  EXTRACT(MONTH FROM order_date)
ORDER BY
  total_revenue DESC
LIMIT 3;
