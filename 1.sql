-- 1.Write a SQL query to retrieve all columns for sales made on '2022-11-05'.

SELECT 
    *
FROM
    retail_sales
WHERE
    sale_date = '2022-11-05';