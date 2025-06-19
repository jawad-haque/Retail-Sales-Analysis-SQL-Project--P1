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
