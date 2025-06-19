-- 2.Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022.

SELECT 
    *
FROM
    retail_sales
WHERE
    category = 'Clothing' AND quantity = 4
        AND sale_date >= '2022-11-01'
        AND sale_date < '2022-12-01';