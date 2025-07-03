--Create Database

CREATE Database sales_data;
USE sales_data;

-- Create table
CREATE TABLE orders (
  order_id INT,
  product_id INT,
  order_date DATE,
  amount DECIMAL(10,2)
);

-- Monthly revenue and order volume
SELECT
  YEAR(order_date) AS year,
  MONTH(order_date) AS month,
  SUM(amount) AS total_revenue,
  COUNT(DISTINCT order_id) AS order_volume
FROM orders
GROUP BY year, month
ORDER BY year, month;

-- Top 3 months by revenue
SELECT
  YEAR(order_date) AS year,
  MONTH(order_date) AS month,
  SUM(amount) AS total_revenue,
  COUNT(DISTINCT order_id) AS order_volume
FROM orders
GROUP BY year, month
ORDER BY total_revenue DESC
LIMIT 3;