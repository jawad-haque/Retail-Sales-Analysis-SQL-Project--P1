-- 8.Write a SQL query to find the top 5 customers based on the highest total sales.

SELECT 
    customer_id, SUM(total_sale) AS total_sales
FROM
    retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;