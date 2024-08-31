create database Project_Pizza
use Project_Pizza

select * from pizza_sales

select count(*) from pizza_sales

select sum(total_price) as Total_Revenue from pizza_sales

select count(distinct order_id) from pizza_sales

select sum(total_price) / count(distinct order_id) as Average_order_value
from pizza_sales

select sum(quantity) as total_pizzas_sold from pizza_sales

select count(distinct order_id) as Total_orders from pizza_sales

select cast(sum(quantity) / count(distinct order_id) as decimal(10,2)) 
as Avg_pizzas_per_order from pizza_sales

select dayname(str_to_date(order_date,'%d-%m-%y')) as Order_day,
count(distinct order_id) as Total_orders
from pizza_sales
group by order_day
order by total_orders desc

select monthname(str_to_date(order_date, '%d-%m-%y')) as Month_Name,
count(distinct order_id) as Total_orders from pizza_sales
group by Month_Name
order by total_orders desc

select pizza_category, cast(sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as decimal(10,2))
as PTS from pizza_sales
group by pizza_category
order by pts desc

select pizza_category, sum(total_price)*100 / (select sum(total_price) from pizza_sales where month(str_to_date(order_date, '%d-%m-%y')) = 1) as PTS
from pizza_sales where month(str_to_date(order_date, '%d-%m-%y')) = 1
group by pizza_category
order by pts desc

select pizza_category, sum(total_price) * 100 / (select sum(total_price) from pizza_sales where monthname(str_to_date(order_date, '%d-%m-%y')) = 'january')
as PTS from pizza_sales where monthname(str_to_date(order_date, '%d-%m-%y')) = 'january'
group by pizza_category
order by pts desc

select pizza_size, cast(sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as decimal(10,2))
as PTS from pizza_sales
group by pizza_size
order by pts desc

select pizza_category, sum(quantity) as Quantity_sold_per_category from pizza_sales
group by pizza_category
order by sum(quantity) desc

select pizza_name, sum(total_price) as total_revenue from pizza_sales
group by pizza_name
order by total_revenue limit 5

select pizza_name, sum(quantity) as Total_Quantity from pizza_sales
group by pizza_name
order by total_quantity desc limit 5

select pizza_name, sum(quantity) as Total_Quantity from pizza_sales
group by pizza_name
order by total_quantity limit 5

select pizza_name, count(distinct order_id) as Total_orders from pizza_sales
group by pizza_name
order by total_orders desc limit 5

select pizza_name, count(distinct order_id) as Total_orders from pizza_sales
group by pizza_name
order by total_orders limit 5