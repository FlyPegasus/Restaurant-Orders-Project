-- Objective2 : Explore the orders table
use RestaurantProject;

-- Task1 : View the order_details table. What is the date range of the table?
select * from order_details;
select min(order_date) from order_details; --Ans: 2023-01-01
select max(order_date) from order_details; --Ans: 2023-03-31

-- Task2 : How many orders were made within this date range? How many items were ordered within this date range?
select count(distinct order_id) from order_details where order_date>=(select min(order_date) from order_details) and order_date<=(select max(order_date) from order_details);
--Ans: 5370
select count(distinct order_details_id) from order_details where order_date>=(select min(order_date) from order_details) and order_date<=(select max(order_date) from order_details);
--Ans: 12234

-- Task3 : Which orders had the most number of items?
select order_id, count(item_id) as item_count from order_details group by order_id order by item_count desc;
--select max(item_count) from (select order_id, count(item_id) as item_count from order_details group by order_id) as view1;
--Ans: order_id: 330, 3473, 2675, 1957, 440, 443, 4305

-- Task4 : How many orders had more than 12 items?
select count(*) from (select order_id, count(item_id) as item_count from order_details group by order_id) as view1 where item_count>12;
--Ans: 20