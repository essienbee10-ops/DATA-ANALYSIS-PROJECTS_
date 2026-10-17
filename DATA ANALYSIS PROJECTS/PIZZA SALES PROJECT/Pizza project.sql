-- DATA CLEANING
-- TRIMING trailing spaces
SET SQL_SAFE_UPDATES=0;
UPDATE pizza_sales
SET pizza_size = TRIM(pizza_size);

-- Checking for Duplicates
SELECT pizza_id, COUNT(*) AS occurrence
FROM pizza_sales
GROUP BY pizza_id
HAVING COUNT(*) > 1;

-- Checking for null values
SELECT * 
FROM pizza_sales
WHERE pizza_id IS NULL
OR pizza_name IS NULL
OR order_id IS NULL
OR quantity IS NULL
OR unit_price IS NULL;

-- Inconsistencies
SELECT DISTINCT pizza_size
FROM pizza_sales;

-- Checking spelling inconsistencies
SELECT DISTINCT pizza_category
FROM pizza_sales;

-- Checking for dates
SELECT 
MIN(order_date), MAX(order_date)
FROM pizza_sales;

-- Checking for numerical relationships
SELECT * 
FROM pizza_sales
WHERE total_price <> quantity * unit_price;

-- Checking for strange outliers
SELECT MIN(unit_price), AVG(unit_price), MAX(unit_price)
FROM pizza_sales;

-- ANALYSIS PHASE

SELECT SUM(total_price) AS Total_Revenue
FROM pizza_sales;


SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Average_order_value
FROM pizza_sales;

SELECT SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales;

SELECT COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales;

SELECT SUM(quantity) / COUNT(DISTINCT order_id) AS Average_pizzas_per_order
FROM pizza_sales;

-- Which pizzas generate the most revenue ('The Thai Chicken Pizza')
SELECT pizza_name, ROUND(SUM(total_price), 2)
FROM pizza_sales
GROUP BY pizza_name
ORDER BY ROUND(SUM(total_price)) DESC
LIMIT 5;

-- Which pizzas sell the most units ('The Classic Deluxe Pizza')
SELECT 
    pizza_name,
    SUM(quantity) AS total_pieces_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_pieces_sold DESC
LIMIT 5;

-- Which pizza category brings most revenue (Classic)
SELECT pizza_category, SUM(quantity) AS total_pieces, ROUND(SUM(total_price), 2) AS revenue
FROM pizza_sales
GROUP BY pizza_category
ORDER BY revenue DESC;

--  Monthly revenue
SELECT MONTHNAME(order_date) AS Month_Name, MONTH(order_date) AS Month_Number, 
			ROUND(SUM(total_price),2) AS revenue
FROM pizza_sales
GROUP BY MONTHNAME(order_date), MONTH(order_date)
ORDER BY Month_Name DESC;

-- Peak Month (September)
SELECT MONTHNAME(order_date) AS Month_Name, MONTH(order_date) AS Month_Number, 
			ROUND(SUM(total_price),2) AS revenue
FROM pizza_sales
GROUP BY MONTHNAME(order_date), MONTH(order_date)
ORDER BY Month_Name DESC
LIMIT 1;

-- Day of week which generates most income (Friday)
SELECT DAYNAME(order_date) AS Day_of_week, ROUND(SUM(total_price),2) AS revenue
FROM pizza_sales
GROUP BY Day_of_week
ORDER BY revenue DESC;

-- Day of week with peak orders (Friday)
SELECT DAYNAME(order_date) AS Day_of_week, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY Day_of_week
ORDER BY total_orders DESC;


-- PEAK HOURS Ananlysis (12pm)
SELECT HOUR(order_time) AS Hour_time, COUNT(DISTINCT order_id) AS orders, SUM(quantity) AS total_sold, 
ROUND(SUM(total_price),2) AS revenue
FROM pizza_sales
GROUP BY Hour_time
ORDER BY orders DESC;

-- Day+Hour Heatmap Analysis (Thursdays 1pm)
SELECT DAYNAME(order_date) AS Day_of_week, HOUR(order_time) AS Hour_time, 
		COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DAYNAME(order_date), HOUR(order_time)
ORDER BY total_orders DESC;

-- Average order value by day
SELECT 
    DAYNAME(order_date) AS day,
    ROUND(
        SUM(total_price) / COUNT(DISTINCT order_id),
        2
    ) AS average_order_value
FROM pizza_sales
GROUP BY DAYNAME(order_date)
ORDER BY average_order_value DESC;


WITH monthly_sales AS (
		SELECT DATE_FORMAT(order_date, '%Y-%m') AS Month, 
				ROUND(SUM(total_price),2) AS revenue
		FROM pizza_sales
        GROUP BY Month
        )
	SELECT Month, 
			revenue, 
			ROUND(LAG(revenue) OVER(ORDER BY Month), 2) AS previous_month_revenue, 
			ROUND (revenue-LAG(revenue) OVER(ORDER BY Month),2) AS revenue_change,
            ROUND(
            ((revenue-LAG(revenue) OVER(ORDER BY Month))/
            LAG(revenue) OVER(ORDER BY Month))*100,2
            ) AS Percentage_change
     FROM monthly_sales
     ;
		
        -- Running total by Month
        WITH monthly_sales AS (
         SELECT DATE_FORMAT(order_date,'%Y-%m') AS Month, 
					ROUND(SUM(total_price),2) AS revenue
		FROM pizza_sales
        GROUP BY DATE_FORMAT(order_date,'%Y-%m')
        )
        SELECT Month, revenue,
				SUM(revenue)OVER(ORDER BY Month) AS running_total
		FROM monthly_sales;
        
		-- Pareto Analysis (Which pizzas drive 80% of revenue)
        WITH sales AS (
				SELECT pizza_name,
							ROUND(SUM(total_price),2) AS revenue
				FROM pizza_sales
                GROUP BY pizza_name
                ),
			ranked_pizzas AS (
				SELECT pizza_name, revenue,
						ROUND(SUM(revenue) OVER(ORDER BY revenue DESC),2) AS cumulative_revenue,
                        ROUND(SUM(revenue) OVER(), 2) AS total_revenue
				FROM sales
                )
				SELECT pizza_name, revenue,
						ROUND((cumulative_revenue/total_revenue) * 100,2) AS percentage_revenue
                        FROM ranked_pizzas
                        ORDER BY revenue DESC;
                      
		-- Pizza stratification based on average revenue
				WITH pizza_comp AS (
                 SELECT pizza_name, ROUND(SUM(total_price), 2) AS revenue
                 FROM pizza_sales
                 GROUP BY pizza_name
                 ),
                 pizza_comp2 AS (
                 SELECT pizza_name, revenue,
							ROUND(AVG(revenue) OVER(), 2) AS avg_revenue
				FROM pizza_comp
                )
                SELECT pizza_name, revenue, avg_revenue,
                 CASE
					WHEN revenue > avg_revenue THEN 'High value pizza'
                    WHEN revenue < avg_revenue THEN 'Low value pizza'
                    ELSE 'Average value pizza'
				END
                FROM pizza_comp2;
                  
-- Finding which pizzas are usually bought together
                SELECT a.pizza_name AS pizza_1,
					   b.pizza_name AS pizza_2,
                       COUNT(*) AS times_bought_together
				FROM pizza_sales a
                JOIN pizza_sales b
                ON a.order_id = b.order_id
                AND a.pizza_name <b.pizza_name
				GROUP BY a.pizza_name, b.pizza_name
                ORDER BY times_bought_together DESC
                
                            
                            
                            
						
        
                    
        
        
        







