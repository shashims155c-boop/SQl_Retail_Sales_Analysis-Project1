#SQL Retail Sales Analysis
create database sql_p1;

##create table
create table retail_Sales(
transactions_id int,
sale_date date,
sale_time time,
customer_id	int,
gender varchar(25),
age	int,
category varchar (25),
quantiy int,
price_per_unit float,
cogs float,
total_sale float
);
### Data cleaning
select * from
retail_sales;

select * from retail_sales;  

select * from retail_sales
limit 100;

select count(*)
from retail_sales;
select count( customer_id) from retail_sales;


ALTER TABLE retail_sales
CHANGE COLUMN `ï»¿transactions_id` transactions_id INT;

select * from retail_sales
where total_sale is null;

## Data exploration

#how many sales we have
select count(*) as total_sales from retail_sales;

#how many unique customers we have ?
select count(distinct customer_id) as total_customers from retail_sales;

select distinct category from retail_sales;

## Data Analysis & Business key problems & answers
 
 # Q1 write a sql query to retrive all columns for sales made on '2022-11-05'
 select * 
 from retail_sales
 where sale_date='05-11-2022';
 
 # Q2 write a sql query to retrive all transaction where the category
 # is clothing and the quantity sold is more than 10 in the mothn of nov-2022
 SELECT *
FROM retail_sales
WHERE category = 'Clothing'
  AND quantiy >= 4
  AND DATE(sale_date) BETWEEN '01-11-2022' AND '02-11-2022';
  
# Q3 write a sql query to calculate the total sales (total sales) for each category

select category,
sum(total_sale) as Net_sale,
count(*) as total_orders
from retail_sales
group by 1;

# Q4 write a sql query to find the average age of customers who purchased itmes from the beauty category
select 
avg(age)
from retail_sales
where category='Beauty';

# Q5 WRITE A QUERY TO FIND ALL TRANSACTIONS WHERE THE TOTAL SALE IS GREATER THAT 1000
SELECT *
FROM retail_sales
WHERE total_sale > 1000;

# Q6 WRITE A SQL QUERY TO FIND THE TOTAL NUMBER OF TRANSACTIONS (TRANSACTION_ID) MADE BY EACH GENDER IN EACH CATEGORY
SELECT category, gender,
count(*) AS total_sales
FROM retail_sales
GROUP BY category, gender
ORDER BY 1;

# Q7 WRITE A SQL QUERY TO CALCULATE THE AVERAGE SALE FOR EACH MONTH FIND OUT BEST SELLING MONTH IN EACH YEAR
SELECT extract(YEAR FROM sale_date) as YEAR,
extract(MONTH FROM sale_date) MONTH,
avg(total_sale) AS TOTAL_SALES
FROM retail_sales
group by 1,2
ORDER BY 1,2;

# Q8 WRITE A SQL QUERY TO FIND THE TOP 5 CUSTOMERS BASED ON THE HIGHEST TOTAL SALES

 SELECT customer_id,
 sum(total_sale) AS  TOTAL_SALES
 FROM retail_sales
 GROUP BY 1
 ORDER BY 2 DESC
 LIMIT 5;
 
 # Q9 WRITE A SQL QUERY TO FIND THE NUMBER OF UNIQUE CUSTOMERS WHO PURCHASED ITEAMS FROM EACH CATEGORY
 
 SELECT  category, 
 COUNT(DISTINCT customeR_id) AS unique_customer
 FROM retail_sales
 group by  category;

# Q10 WRITE SQL QUERY TO CREATE EACH SHIFT AND NUMBER OF ORDERS (EXAMPLE MORNING <=12, AFTERNOON BETWEEN 12 & 17, EVENING >17)

with Hourly_sales
as (
SELECT * ,
case
when  extract(hour from sale_time)<12 then 'morning'
when extract(hour from sale_time) Between 12 and 17 then 'Afternoon'
else 'evening'
end as shift
from retail_sales)
select 
count(*) as total_orders
from Hourly_Sales
group by shift;

# END OF PTOJECT