CREATE DATABASE IF NOT EXISTS ecommerce_project;
USE ecommerce_project;
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Customer_Country VARCHAR(50),
    Order_Datetime DATETIME,
    Order_Source VARCHAR(20),
    Sales_POC VARCHAR(100),
    Order_Value DECIMAL(10,2)
);
DESCRIBE Orders;
CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Customer_Age INT,
    Customer_Gender VARCHAR(10),
    Customer_Country VARCHAR(50),
    Customer_Category CHAR(1)
);
DESCRIBE Customers;
CREATE TABLE Sales (
    Sales_POC VARCHAR(100) PRIMARY KEY,
    Sales_Manager VARCHAR(100),
    Sales_Team VARCHAR(50),
    Sales_Target DECIMAL(12,2)
);

DESCRIBE Sales;
show tables;
SELECT *
FROM Orders
LIMIT 10;
SELECT COUNT(*) AS Total_Orders
FROM Orders;
DESCRIBE Orders;
SELECT COUNT(*) FROM Orders;
TRUNCATE TABLE Orders;
SHOW VARIABLES LIKE 'local_infile';
SELECT VERSION();
SET GLOBAL local_infile = 1;
TRUNCATE TABLE Orders;
LOAD DATA LOCAL INFILE 'C:/Users/Asus/Documents/sql ecommerce project/files/Orders.csv'
INTO TABLE Orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
    Order_ID,
    Customer_ID,
    Customer_Country,
    @Order_Datetime,
    Order_Source,
    Sales_POC,
    Order_Value
)
SET Order_Datetime = STR_TO_DATE(@Order_Datetime, '%d-%m-%Y %H:%i');
DROP TABLE Orders;
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Customer_Country VARCHAR(50),
    Order_Datetime VARCHAR(30),
    Order_Source VARCHAR(20),
    Sales_POC VARCHAR(100),
    Order_Value DECIMAL(10,2)
);
SELECT COUNT(*) FROM Orders;
DESCRIBE Customers;
DROP TABLE Customers;
CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Customer_Age INT,
    Customer_Gender VARCHAR(10),
    Customer_Country VARCHAR(50),
    Customer_Category CHAR(1)
);
DESCRIBE Customers;
DROP TABLE Customers;
CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Customer_Country VARCHAR(50),
    Gender CHAR(1),
    Age INT,
    Category CHAR(1)
);
SELECT COUNT(*) AS Total_Customers
FROM Customers;

DROP TABLE sales;
CREATE TABLE Sales (
    Sales_POC VARCHAR(100) PRIMARY KEY,
    Sales_Manager VARCHAR(100),
    Sales_Team VARCHAR(50),
    Target DECIMAL(12,2)
);
DROP TABLE IF EXISTS Sales;

CREATE TABLE Sales (
    Sales_POC VARCHAR(100) PRIMARY KEY,
    Sales_Manager_First_Name VARCHAR(50),
    Sales_Manager_Last_Name VARCHAR(50),
    Sales_Team VARCHAR(50),
    Sales_Target_2023 DECIMAL(12,2)
);
SELECT * FROM Orders LIMIT 10;
SELECT * FROM Customers LIMIT 10;

SELECT * FROM Sales LIMIT 10;
SELECT *
FROM Orders
WHERE Order_ID IS NULL
   OR Customer_ID IS NULL
   OR Order_Value IS NULL;
   
   SELECT *
FROM Customers
WHERE Customer_ID IS NULL;

SELECT *
FROM Sales
WHERE Sales_POC IS NULL;

SELECT Order_Datetime
FROM Orders
LIMIT 10;
ALTER TABLE Orders
ADD COLUMN Order_DateTime_New DATETIME;

SHOW CREATE TABLE Orders;
SET SQL_SAFE_UPDATES = 0;

UPDATE Orders
SET Order_DateTime_New = STR_TO_DATE(Order_Datetime, '%d-%m-%Y %H:%i');

SET SQL_SAFE_UPDATES = 1;


SELECT
    Order_Datetime,
    Order_DateTime_New
FROM Orders
LIMIT 10;

ALTER TABLE Orders
DROP COLUMN Order_Datetime;

ALTER TABLE Orders
CHANGE COLUMN Order_DateTime_New Order_Datetime DATETIME;

DESCRIBE Orders;

SELECT COUNT(*) AS Total_Orders
FROM Orders;

SELECT
SUM(CASE WHEN Customer_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Customer_ID,
SUM(CASE WHEN Customer_Country IS NULL OR Customer_Country='' THEN 1 ELSE 0 END) AS Missing_Country,
SUM(CASE WHEN Order_DateTime_New IS NULL THEN 1 ELSE 0 END) AS Missing_Date,
SUM(CASE WHEN Order_Source IS NULL OR Order_Source='' THEN 1 ELSE 0 END) AS Missing_Source,
SUM(CASE WHEN Sales_POC IS NULL OR Sales_POC='' THEN 1 ELSE 0 END) AS Missing_Sales_POC,
SUM(CASE WHEN Order_Value IS NULL THEN 1 ELSE 0 END) AS Missing_Order_Value
FROM Orders;

SELECT
SUM(CASE WHEN Customer_ID IS NULL THEN 1 ELSE 0 END) AS Missing_ID,
SUM(CASE WHEN Customer_Country IS NULL OR Customer_Country='' THEN 1 ELSE 0 END) AS Missing_Country,
SUM(CASE WHEN Gender IS NULL OR Gender='' THEN 1 ELSE 0 END) AS Missing_Gender,
SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS Missing_Age,
SUM(CASE WHEN Category IS NULL OR Category='' THEN 1 ELSE 0 END) AS Missing_Category
FROM Customers;
SELECT
SUM(CASE WHEN Sales_POC IS NULL OR Sales_POC='' THEN 1 ELSE 0 END) AS Missing_POC,
SUM(CASE WHEN Sales_Manager_First_Name IS NULL OR Sales_Manager_First_Name='' THEN 1 ELSE 0 END) AS Missing_Manager_First,
SUM(CASE WHEN Sales_Manager_Last_Name IS NULL OR Sales_Manager_Last_Name='' THEN 1 ELSE 0 END) AS Missing_Manager_Last,
SUM(CASE WHEN Sales_Team IS NULL OR Sales_Team='' THEN 1 ELSE 0 END) AS Missing_Team,
SUM(CASE WHEN Sales_Target_2023 IS NULL THEN 1 ELSE 0 END) AS Missing_Target
FROM Sales;

SELECT
    CONCAT('[', Order_Source, ']') AS Order_Source,
    COUNT(*) AS Orders
FROM Orders
GROUP BY Order_Source;

SET SQL_SAFE_UPDATES = 0;

UPDATE Orders
SET Order_Source = 'Other'
WHERE TRIM(Order_Source) = '';

SET SQL_SAFE_UPDATES = 1;

ALTER TABLE Orders
RENAME COLUMN Order_DateTime_New TO Order_Datetime;


-- ==========================================
-- PART 1: BASIC BUSINESS KPIs
-- ==========================================

#1. Total Number of Orders
SELECT COUNT(*) AS Total_Orders
FROM Orders;

#2. Total Revenue
SELECT SUM(Order_Value) AS Total_Revenue
FROM Orders;

#3. Average Order Value
SELECT ROUND(AVG(Order_Value), 2) AS Average_Order_Value
FROM Orders;

#4. Highest & Lowest Order Value
SELECT
    MAX(Order_Value) AS Highest_Order,
    MIN(Order_Value) AS Lowest_Order
FROM Orders;


-- ==========================================
-- PART 2: COUNTRY ANALYSIS
-- ==========================================

#5. Orders by Country
SELECT
    Customer_Country,
    COUNT(*) AS Total_Orders
FROM Orders
GROUP BY Customer_Country
ORDER BY Total_Orders DESC;

#6. Revenue by Country
SELECT
    Customer_Country,
    SUM(Order_Value) AS Revenue
FROM Orders
GROUP BY Customer_Country
ORDER BY Revenue DESC;

#7. Revenue Contribution by Country
SELECT
    Customer_Country,
    SUM(Order_Value) AS Revenue,
    ROUND(
        SUM(Order_Value) /
        (SELECT SUM(Order_Value) FROM Orders) * 100,
        2
    ) AS Revenue_Percentage
FROM Orders
GROUP BY Customer_Country
ORDER BY Revenue DESC;

-- ==========================================
-- PART 3: ORDER SOURCE ANALYSIS
-- ==========================================

#8. Orders by Source
SELECT
    Order_Source,
    COUNT(*) AS Orders
FROM Orders
GROUP BY Order_Source;

#9. Revenue by Source
SELECT
    Order_Source,
    SUM(Order_Value) AS Revenue
FROM Orders
GROUP BY Order_Source
ORDER BY Revenue DESC;

-- ==========================================
-- PART 4: CUSTOMER ANALYSIS
-- ==========================================

#10. Revenue by Customer Category
SELECT
    c.Category,
    SUM(o.Order_Value) AS Revenue
FROM Orders o
JOIN Customers c
    ON o.Customer_ID = c.Customer_ID
GROUP BY c.Category
ORDER BY Revenue DESC;

#11. Revenue by Gender
SELECT
    c.Gender,
    SUM(o.Order_Value) AS Revenue
FROM Orders o
JOIN Customers c
    ON o.Customer_ID = c.Customer_ID
GROUP BY c.Gender;

#12. Orders by Age
SELECT
    Age,
    COUNT(*) AS Orders
FROM Customers
GROUP BY Age
ORDER BY Orders DESC;

#13. Top 10 Customers by Revenue
SELECT
    Customer_ID,
    SUM(Order_Value) AS Revenue
FROM Orders
GROUP BY Customer_ID
ORDER BY Revenue DESC
LIMIT 10;

#14. Repeat Customers
SELECT
    Customer_ID,
    COUNT(Order_ID) AS Total_Orders
FROM Orders
GROUP BY Customer_ID
HAVING COUNT(Order_ID) > 1
ORDER BY Total_Orders DESC;

#15. New vs Repeat Customers
SELECT
    CASE
        WHEN Order_Count = 1 THEN 'New'
        ELSE 'Repeat'
    END AS Customer_Type,
    COUNT(*) AS Customers
FROM
(
    SELECT
        Customer_ID,
        COUNT(*) AS Order_Count
    FROM Orders
    GROUP BY Customer_ID
) t
GROUP BY Customer_Type;


-- ==========================================
-- PART 5: SALES TEAM ANALYSIS
-- ==========================================

#16. Revenue by Sales Team
SELECT
    s.Sales_Team,
    SUM(o.Order_Value) AS Revenue
FROM Orders o
JOIN Sales s
    ON o.Sales_POC = s.Sales_POC
GROUP BY s.Sales_Team
ORDER BY Revenue DESC;

#17. Revenue by Sales Manager
SELECT
    CONCAT(s.Sales_Manager_First_Name, ' ', s.Sales_Manager_Last_Name) AS Manager,
    SUM(o.Order_Value) AS Revenue
FROM Orders o
JOIN Sales s
    ON o.Sales_POC = s.Sales_POC
GROUP BY Manager
ORDER BY Revenue DESC;

#18. Target vs Achievement
SELECT
    s.Sales_POC,
    s.Sales_Target_2023,
    SUM(o.Order_Value) AS Achievement
FROM Orders o
JOIN Sales s
    ON o.Sales_POC = s.Sales_POC
GROUP BY
    s.Sales_POC,
    s.Sales_Target_2023;

#19. Target Achievement Percentage
SELECT
    s.Sales_POC,
    s.Sales_Target_2023,
    SUM(o.Order_Value) AS Achievement,
    ROUND(
        SUM(o.Order_Value) / s.Sales_Target_2023 * 100,
        2
    ) AS Achievement_Percentage
FROM Orders o
JOIN Sales s
    ON o.Sales_POC = s.Sales_POC
GROUP BY
    s.Sales_POC,
    s.Sales_Target_2023;
    
#20. Best Performing Sales Managers
SELECT
    CONCAT(
        s.Sales_Manager_First_Name,
        ' ',
        s.Sales_Manager_Last_Name
    ) AS Sales_Manager,
    SUM(o.Order_Value) AS Revenue
FROM Orders o
JOIN Sales s
ON o.Sales_POC = s.Sales_POC
GROUP BY Sales_Manager
ORDER BY Revenue DESC
LIMIT 5;


-- ==========================================
-- PART 6: TOP PERFORMERS
-- ==========================================

#21. Top 10 Customers
SELECT
    Customer_ID,
    SUM(Order_Value) AS Revenue
FROM Orders
GROUP BY Customer_ID
ORDER BY Revenue DESC
LIMIT 10;

#22. Top 10 Sales POCs
SELECT
    Sales_POC,
    SUM(Order_Value) AS Revenue
FROM Orders
GROUP BY Sales_POC
ORDER BY Revenue DESC
LIMIT 10;

#23. Top 5 Countries
SELECT
    Customer_Country,
    SUM(Order_Value) AS Revenue
FROM Orders
GROUP BY Customer_Country
ORDER BY Revenue DESC
LIMIT 5;


-- ==========================================
-- PART 7: TIME ANALYSIS
-- ==========================================

#24. Monthly Revenue
SELECT
    MONTH(Order_Datetime) AS Month,
    SUM(Order_Value) AS Revenue
FROM Orders
GROUP BY Month
ORDER BY Month;

#25. Monthly Orders
SELECT
    MONTH(Order_Datetime) AS Month,
    COUNT(*) AS Orders
FROM Orders
GROUP BY Month
ORDER BY Month;

#26. Monthly Revenue Growth
WITH Monthly_Revenue AS
(
    SELECT
        MONTH(Order_Datetime) AS Month,
        SUM(Order_Value) AS Revenue
    FROM Orders
    GROUP BY MONTH(Order_Datetime)
)

SELECT
    Month,
    Revenue,
    LAG(Revenue) OVER(ORDER BY Month) AS Previous_Month_Revenue,
    Revenue - LAG(Revenue) OVER(ORDER BY Month) AS Growth
FROM Monthly_Revenue;


#27. Cumulative Monthly Revenue
WITH Monthly_Revenue AS
(
    SELECT
        MONTH(Order_Datetime) AS Month,
        SUM(Order_Value) AS Revenue
    FROM Orders
    GROUP BY MONTH(Order_Datetime)
)

SELECT
    Month,
    Revenue,
    SUM(Revenue) OVER(
        ORDER BY Month
    ) AS Cumulative_Revenue
FROM Monthly_Revenue;


-- ==========================================
-- PART 8: ADVANCED SQL
-- ==========================================

#28. Rank Sales POCs by Revenue
SELECT
    Sales_POC,
    SUM(Order_Value) AS Revenue,
    RANK() OVER (
        ORDER BY SUM(Order_Value) DESC
    ) AS Ranking
FROM Orders
GROUP BY Sales_POC;

#29. Running Revenue
SELECT
    Order_Datetime,
    SUM(Order_Value) OVER (
        ORDER BY Order_Datetime
    ) AS Running_Revenue
FROM Orders;


#30. Dense Rank Sales POCs
SELECT
    Sales_POC,
    SUM(Order_Value) AS Revenue,
    DENSE_RANK() OVER (
        ORDER BY SUM(Order_Value) DESC
    ) AS Ranking
FROM Orders
GROUP BY Sales_POC;
