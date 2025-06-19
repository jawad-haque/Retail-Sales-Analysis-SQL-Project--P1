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

