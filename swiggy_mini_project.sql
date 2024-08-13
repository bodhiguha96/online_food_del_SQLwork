use online_food;
show tables;
select * from swiggy;
/*Count total rows in a table */
select count(ID) from swiggy;

describe swiggy;               

/*ADD primary key */
alter table swiggy add primary key(ID);

/* Total number of restaurants */
select count(distinct(restaurant)) from swiggy;

/*Find restautants which appeared more than once */
select count(restaurant) - count(distinct(restaurant)) as repeated_resto
from swiggy;

#OR - Using group by
select restaurant, count(restaurant)
from swiggy
group by restaurant
having count(restaurant) > 1;

/*Find total cities in the data */
select count(distinct(city)) from swiggy;

/*Sort number of restaurants from each city in descending order */
select city, count(distinct(restaurant)) as total_resto
from swiggy
group by city
order by total_resto desc;

/*Find total orders made from each restaurant from Bangalore */
select restaurant, count(id) as orders
from swiggy
where city = 'Bangalore'
group by restaurant
order by count(id) desc;

/* Find the restaurant name with maximum orders */
select restaurant, city, total_orders
from(select restaurant, city, count(ID) as total_orders, 
	dense_rank() over(order by count(ID) desc) as rankk
	from swiggy
	group by restaurant, city) as rakings
where rankk = 1;

#Less useful way

select restaurant, city, count(ID) as total_orders
from swiggy
group by restaurant, city
order by count(ID) desc
limit 1;

/* Find top three restaurant names with maximum orders */

/*Find restaurants from Kormangala area of Bangalore who serve chinese food */

/*Find average delivery time taken by swiggy */

/*Find average delivery time taken by swiggy in each city */

/*Find all restaurants from Mumbai, Delhi and Kolkata who serve
North Indian and South Indian dishes */




