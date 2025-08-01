# Four Essential Northwind Database Queries

## 1. Schema Exploration Query

**Get complete database structure:**
```sql
-- Show all tables and their columns with data types
SELECT 
    TABLE_NAME,
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE,
    COLUMN_DEFAULT,
    COLUMN_KEY
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_SCHEMA = 'northwind'
ORDER BY TABLE_NAME, ORDINAL_POSITION;
```

**Alternative simpler approach:**
```sql
-- Describe each table structure
DESCRIBE customers;
DESCRIBE orders;
DESCRIBE order_details;
DESCRIBE products;
-- etc.

-- Or show create statement for a table
SHOW CREATE TABLE customers;
```

## 2. Basic SELECT Query

**Simple data retrieval:**
```sql
-- Get customer information from a specific country
SELECT 
    CustomerID,
    CompanyName,
    ContactName,
    City,
    Country
FROM customers
WHERE Country = 'USA'
ORDER BY CompanyName
LIMIT 10;
```

## 3. JOIN Query

**Multi-table relationship query:**
```sql
-- Get order details with customer and product information
SELECT 
    o.OrderID,
    c.CompanyName AS CustomerName,
    p.ProductName,
    od.Quantity,
    od.UnitPrice,
    (od.Quantity * od.UnitPrice) AS LineTotal,
    o.OrderDate
FROM orders o
INNER JOIN customers c ON o.CustomerID = c.CustomerID
INNER JOIN order_details od ON o.OrderID = od.OrderID
INNER JOIN products p ON od.ProductID = p.ProductID
WHERE o.OrderDate >= '1997-01-01'
ORDER BY o.OrderDate DESC, o.OrderID
LIMIT 20;
```

## 4. Aggregate/Summary Query

**Data analysis with grouping:**
```sql
-- Sales summary by category and year
SELECT 
    cat.CategoryName,
    YEAR(o.OrderDate) AS OrderYear,
    COUNT(DISTINCT o.OrderID) AS NumberOfOrders,
    SUM(od.Quantity) AS TotalQuantity,
    ROUND(SUM(od.Quantity * od.UnitPrice), 2) AS TotalSales,
    ROUND(AVG(od.Quantity * od.UnitPrice), 2) AS AverageOrderValue
FROM orders o
INNER JOIN order_details od ON o.OrderID = od.OrderID
INNER JOIN products p ON od.ProductID = p.ProductID
INNER JOIN categories cat ON p.CategoryID = cat.CategoryID
WHERE o.OrderDate IS NOT NULL
GROUP BY cat.CategoryName, YEAR(o.OrderDate)
HAVING TotalSales > 1000
ORDER BY OrderYear DESC, TotalSales DESC;
```

## Testing Your Setup

**Quick connection test:**
```sql
-- Verify you're connected to the right database
SELECT DATABASE();

-- Count records in main tables
SELECT 'customers' AS table_name, COUNT(*) AS record_count FROM customers
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'order_details', COUNT(*) FROM order_details
UNION ALL
SELECT 'products', COUNT(*) FROM products;
```

## Common MySQL CLI Tips

**Viewing Results:**
- Use `\G` instead of `;` for vertical display of wide results
- Example: `SELECT * FROM customers WHERE CustomerID = 'ALFKI'\G`

**Saving Output:**
```sql
-- Save query results to file
SELECT * FROM customers 
INTO OUTFILE '/tmp/customers.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';
```
