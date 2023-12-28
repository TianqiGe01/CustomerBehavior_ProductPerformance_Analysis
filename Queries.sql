-- Customer 
-- Which customers have spent the most money on orders?
SELECT CustomerName, SUM(expense_per_order) AS total_expense
FROM Customerdw
GROUP BY CustomerName
ORDER BY total_expense DESC;

-- What is the average order value for each customer?
SELECT CustomerName, AVG(expense_per_order) AS average_order_value
FROM Customerdw
GROUP BY CustomerName
ORDER BY average_order_value DESC;

-- Which customers place the most orders?
SELECT CustomerName, COUNT(DISTINCT Orderdate) AS number_of_orders_placed
FROM Customerdw
GROUP BY CustomerName
ORDER BY number_of_orders_placed DESC;

-- How has customer spending evolved over time?
SELECT Orderdate, SUM(expense_per_order) AS total_expense
FROM Customerdw
GROUP BY Orderdate
ORDER BY Orderdate;

-- Which customers have consistently high spending over time?
SELECT CustomerName, COUNT(DISTINCT Orderdate) AS active_months, SUM(expense_per_order) AS total_expense
FROM Customerdw
GROUP BY CustomerName
ORDER BY total_expense DESC;

-- Which cities have the highest spending customers?
SELECT customer_city, SUM(expense_per_order) AS total_expense_by_customer_city
FROM Customerdw
GROUP BY customer_city
ORDER BY total_expense_by_customer_city DESC;

-- Products
-- Which products generate the highest revenue for the company?
SELECT ProductName, SUM(expense_per_order) AS total_revenue
FROM Customerdw
GROUP BY ProductName
ORDER BY total_revenue DESC;

-- Which products are the most popular overall?
SELECT ProductName, COUNT(*) AS total_orders
FROM Customerdw
GROUP BY ProductName
ORDER BY total_orders DESC;

-- Which category of products are ordered in the largest quantities?
SELECT CategoryName, AVG(quantity) AS average_quantity_per_order
FROM Customerdw
GROUP BY CategoryName
ORDER BY average_quantity_per_order DESC;

-- How does the seasonal variation impact order frequency and expenses?
SELECT MONTH(Orderdate) AS month, COUNT(*) AS total_orders, SUM(expense_per_order) AS total_expense
FROM Customerdw
GROUP BY month
ORDER BY month;

-- Supplier
-- Which supplier cities generate the most revenue?
SELECT supplier_city, SUM(expense_per_order) AS total_expense_from_supplier_country
FROM Customerdw
GROUP BY supplier_city
ORDER BY total_expense_from_supplier_country DESC;

-- Which supplier cities supply the most products?
SELECT supplier_city, SUM(quantity) AS total_quantity_ordered_from_supplier_country
FROM Customerdw
GROUP BY supplier_city
ORDER BY total_quantity_ordered_from_supplier_country DESC;
