-- 9.Write a SQL query to find the number of unique customers who purchased items from each category.

SELECT 
    category,
    COUNT(DISTINCT (customer_id)) AS total_unique_customers
FROM
    retail_sales
GROUP BY category;