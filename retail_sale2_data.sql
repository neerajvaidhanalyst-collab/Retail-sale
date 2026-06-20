-- 1.write a sql query to retrieve all column for sales made on  '2022-06-14'
 
 SELECT 
    *
FROM
    retail
WHERE
    sale_date = '2022-06-14';
 
 --  Q.2 Write a SQL query to retrieve all transactions where the category
 -- is 'Clothing' and the quantity sold is more than 4 .
     
SELECT 
    *
FROM
    retail
WHERE
    category = 'Clothing' AND quantiy >= 4;
    
-- -- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.

    
    SELECT 
    category, COUNT(category), SUM(total_sale)
FROM
    retail
GROUP BY category;
 
 -- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

    SELECT 
    ROUND(AVG(age), 2)
FROM
    retail
WHERE
    category = 'Beauty'; 
     
  -- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.

  SELECT 
    *
FROM
    retail
WHERE
    total_sale > 1000; 
     
-- Q.6 Write a SQL query to find the total number 
-- of transactions (transaction_id) made by each gender in each category.

SELECT 
    category, gender, COUNT(transactions_id)
FROM
    retail
GROUP BY category , gender
ORDER BY category;
     

    -- Q.7 Write a SQL query to find the top 5 customers based on the highest total sales 

SELECT 
    customer_id, SUM(total_sale)
FROM
    retail
GROUP BY customer_id
ORDER BY SUM(total_sale) DESC
LIMIT 5;

-- Q.8 Write a SQL query to find the number of unique 
-- customers who purchased items from each category.

    SELECT 
    category,    
    COUNT(DISTINCT customer_id) as cnt_unique_cs
FROM retail_sales
GROUP BY category

   
     
-- Q.9 Write a SQL query to create each shift and
-- number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

with hourly_sale as 
(select *,
		case 
			when hour(sale_time) < 12 then 'morning'
            when hour (sale_time) between 12 and 17 then 'afternoon'
            else 'evening'
        end as shift 
from retail) 
select shift,count(*)
from hourly_sale
group by shift;       