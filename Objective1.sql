-- Objective1 Queries
use RestaurantProject;
select * from menu_items;

-- Task1 : View the menu_items table and write a query to find the number of items on the menu
select count(*) from menu_items;

-- Task2 : What are the least and most expensive items on the menu?
select min(price) from menu_items;
select max(price) from menu_items;

-- Task3 : How many Italian dishes are on the menu? What are the least and most expensive Italian dishes on the menu?
select count(*) from menu_items where category='Italian'; --Ans: 9 Italian Dishes are there
select * from menu_items where price=(select min(price) from menu_items where category='Italian') and category='Italian';
--Ans: Spaghetti nad Fettuccine Alfredo; price: 15
select * from menu_items where price=(select max(price) from menu_items where category='Italian') and category='Italian';
--Ans: Shrimp Scampi; price: 20

-- Task4 : How many dishes are in each category? What is the average dish price within each category?
select category, count(menu_item_id) as dish_count, avg(price) as avg_price from menu_items group by category;