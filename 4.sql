-- 4.Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

SELECT 
    round(AVG(age), 2) AS avg_age
FROM
    retail_sales
WHERE
    category = 'Beauty';