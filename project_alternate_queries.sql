use Project_Pizza

select * from pizza_sales_date_format_changed

select cast(order_date as date) as order_day from pizza_sales_date_format_changed

select dayname(cast(order_date as date)) as Order_day, count(distinct order_id)
as Total_Orders from pizza_sales_date_format_changed
group by Order_day
order by total_orders desc

select monthname(cast(order_date as date)) as Order_Month, count(distinct order_id)
as Total_orders from pizza_sales_date_format_changed
group by Order_Month
order by total_orders desc