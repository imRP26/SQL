/*
 * https://leetcode.com/problems/immediate-food-delivery-ii/
 */



/*
 * Approach from -> 
 * https://leetcode.com/problems/immediate-food-delivery-ii/solutions/1936270/simple-and-easiest-mysql-solution-using-in-avg-easy-to-understand/
 */
select round(avg(order_date = customer_pref_delivery_date) * 100, 2) as immediate_percentage from 
Delivery where (customer_id, order_date) in 
(select customer_id, min(order_date) as first_order from Delivery group by customer_id);



/*
 * Approach from -> 
 * https://leetcode.com/problems/immediate-food-delivery-ii/solutions/1936270/simple-and-easiest-mysql-solution-using-in-avg-easy-to-understand/comments/2020364
 */
select round(sum(if(order_date = customer_pref_delivery_date, 1, 0)) / count(*) * 100, 2) as 
immediate_percentage from Delivery where (customer_id, order_date) in 
(select customer_id, min(order_date) as first_order_date from Delivery group by customer_id); 
