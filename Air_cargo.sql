create database Aircargo;

/*Create an ER diagram for the given airlines' database.*/

/*Write a query to display all the passengers who have traveled on routes 01
to 25 from the passengers_on_flights table.*/
Select * from passengers_on_flights
where route_id >=1 and route_id <=25
order by route_id;

/*Write a query to identify the number of passengers and total revenue in 
business class from the ticket_details table.*/
select count(customer_id) as no_of_passengers,
sum(Price_per_ticket) as total_revenue from ticket_details
where class_id = 'business';

/* 5) Write a query to display the full name of the customer by extracting the 
first name and last name from the customer table.*/
select concat(first_name," ",last_name) as full_name from customer;

/* 6) Write a query to extract the customers who have registered and booked a 
ticket from the customer and ticket_details tables.*/
select c.first_name, c.last_name from customer c
join ticket_details t
on c.customer_id = t.customer_id;

/* 7) Write a query to identify the customer’s first name and last name based 
on their customer ID and brand (Emirates) from the ticket_details table.*/
with customer_details as
(
select c.customer_id, c.first_name, c.last_name, t.brand from customer c
join ticket_details t
on c.customer_id = t.customer_id
)
select first_name, last_name from customer_details
where brand = 'emirates'

/* 8) Write a query to identify the customers who have traveled by Economy 
Plus class using the sub-query on the passengers_on_flights table*/
select first_name, last_name from customer
where customer_id in (
select customer_id from passengers_on_flights
where class_id = "economy plus"
)

/* 9) Write a query to determine whether the revenue has crossed 10000 using 
the IF clause on the ticket_details table.*/
select sum(price_per_ticket),
IF(SUM(price_per_ticket) > 10000,'Crossed 10000','Not Crossed') AS revenue_status
from ticket_details;

/* 10) Write a query to create and grant access to a new user to perform 
database operations.*/
create user 'akv'@'localhost' Identified by 'pass123';
grant all privileges
On aircargo.*
to'akv'@'localhost';
flush privileges;

/* 11) Write a query to find the maximum ticket price for each class using 
window functions on the ticket_details table.*/
select class_id, max(price_per_ticket) over (partition by class_id) as max_price
from ticket_details

/* 12) Write a query to extract the passengers whose route ID is 4 by improving 
the speed and performance of the passengers_on_flights table using the 
index.*/

create index idx_route_id on  passengers_on_flights(route_id);
select * from  passengers_on_flights where route_id = 4;

/* 13) For route ID 4, write a query to view the execution plan of the 
passengers_on_flights table.*/
explain
select * from passengers_on_flights
where route_id = 4

/* 14) Write a query to calculate the total price of all tickets booked by a 
customer across different aircraft IDs using the rollup function*/
select customer_id, aircraft_id,
SUM(no_of_tickets * price_per_ticket) AS total_price
from ticket_details
group by customer_id, aircraft_id with rollup;

/* 15) Write a query to create a view with only business class customers and the 
airline brand.*/
create view table_air as (
select p.class_id , t.brand from passengers_on_flights p
join ticket_details t
on t.customer_id = p.customer_id
where p.class_id = 'business' );

select * from table_air;

/* 16) Write a query to create a stored procedure that extracts all the details 
from the routes table where the traveled distance is more than 2000
miles */
select * from routes
where distance_miles > 2000;

USE `aircargo`;
DROP procedure IF EXISTS `travel_route`;

DELIMITER $$
USE `aircargo`$$
CREATE PROCEDURE `travel_route` ()
BEGIN
select * from routes
where distance_miles > 2000;
END$$

DELIMITER ;

/* 17) Using GROUP BY, determine the total number of tickets purchased by 
each customer and the total price paid.*/
select customer_id, sum(no_of_tickets) as total_tickets,
sum(no_of_tickets* price_per_ticket) as total_price
from ticket_details
group by customer_id;

/* 18) Calculate the average number of passengers per flight route.*/
select route_id,
count(customer_id) as avg_passengers
from passengers_on_flights
group by route_id;











