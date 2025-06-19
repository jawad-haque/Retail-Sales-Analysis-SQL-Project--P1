-- SQL Retail Sales Analysis - P1 
 
 
 -- DATABASE SETUP
 
 
-- CREATE DATABASE 
create database retail_sales_p1;


-- CREATE TABLE 
CREATE TABLE retail_sales
            (
                transaction_id INT PRIMARY KEY,	
                sale_date DATE,	 
                sale_time TIME,	
                customer_id	INT,
                gender	VARCHAR(15),
                age	INT,
                category VARCHAR(15),	
                quantity	INT,
                price_per_unit FLOAT,	
                cogs	FLOAT,
                total_sale FLOAT
            );


-- SHOW THE TABLE
SELECT 
    *
FROM
    retail_sales;

    
-- COUNT THE NUMBER OF ROWS
SELECT 
    COUNT(*)
FROM
    retail_sales;


-- DATA CLEANING:-


-- FIND NULL VALUES
SELECT 
    *
FROM
    retail_sales
WHERE
    transaction_id IS NULL
        OR sale_time IS NULL
        OR sale_time IS NULL
        OR customer_id IS NULL
        OR gender IS NULL
        OR age IS NULL
        OR category IS NULL
        OR quantity IS NULL
        OR price_per_unit IS NULL
        OR cogs IS NULL
        OR total_sale IS NULL;
        

-- DELETE NULL VALUES
DELETE FROM retail_sales 
WHERE
    transaction_id IS NULL
    OR sale_time IS NULL
    OR sale_time IS NULL
    OR customer_id IS NULL
    OR gender IS NULL
    OR age IS NULL
    OR category IS NULL
    OR quantity IS NULL
    OR price_per_unit IS NULL
    OR cogs IS NULL
    OR total_sale IS NULL;


-- DATA EXPLORATION


-- How many sales we have?
SELECT 
    COUNT(*) AS total_sale
FROM
    retail_sales;

-- How many unique customers we have? 
SELECT 
    COUNT(DISTINCT customer_id) AS total_customers
FROM
    retail_sales;

-- How many unique category we have? 
SELECT 
    COUNT(DISTINCT category) AS total_category
FROM
    retail_sales;

-- What are the different types of categories we have?
SELECT DISTINCT
    category
FROM
    retail_sales;


-- DATA ANALYSIS AND BUSINESS KEY PROBLEMS & ANSWERS

-- 1.Write a SQL query to retrieve all columns for sales made on '2022-11-05'.

SELECT 
    *
FROM
    retail_sales
WHERE
    sale_date = '2022-11-05';
    
-- 2.Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022.

SELECT 
    *
FROM
    retail_sales
WHERE
    category = 'Clothing' AND quantity = 4
        AND sale_date >= '2022-11-01'
        AND sale_date < '2022-12-01';
        
-- 3.Write a SQL query to calculate the total sales (total_sale) for each category.

SELECT 
    category,
    SUM(total_sale) AS net_sale,
    COUNT(*) AS total_orders
FROM
    retail_sales
GROUP BY category;

-- 4.Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

SELECT 
    round(AVG(age), 2) AS avg_age
FROM
    retail_sales
WHERE
    category = 'Beauty';
    
-- 5.Write a SQL query to find all transactions where the total_sale is greater than 1000.

SELECT 
    *
FROM
    retail_sales
WHERE
    total_sale > 1000;
    
-- 6.Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.

SELECT 
    category,
    gender,
    COUNT(*) AS total_transactions
FROM
    retail_sales
GROUP BY category , gender
ORDER BY category;

-- 7.Write a SQL query to calculate the average sale for each month. Find out best selling month in each year.

SELECT 
		YEAR, 
        MONTH, 
        avg_sale 
FROM
	(
		SELECT 
				YEAR(sale_date) AS YEAR, 
                MONTH(sale_date) AS MONTH, 
                AVG(total_sale) AS avg_sale, 
                RANK() OVER(PARTITION BY YEAR(sale_date) 
				ORDER BY AVG(total_sale) DESC)  
                AS rnk
				FROM retail_sales 
                GROUP BY  YEAR, MONTH
	) 
				AS t1
				WHERE rnk = 1;
                
-- 8.Write a SQL query to find the top 5 customers based on the highest total sales.

SELECT 
    customer_id, SUM(total_sale) AS total_sales
FROM
    retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;

-- 9.Write a SQL query to find the number of unique customers who purchased items from each category.

SELECT 
    category,
    COUNT(DISTINCT (customer_id)) AS total_unique_customers
FROM
    retail_sales
GROUP BY category;

-- 10.Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17).  

WITH hourly_sale
AS
(
SELECT 
    *,
    CASE
        WHEN HOUR(sale_time) < 12 THEN 'Morning'
        WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift
FROM
    retail_sales
)
SELECT 
    shift, COUNT(*) AS total_orders
FROM
    hourly_sale
GROUP BY shift;

-- End of project   

