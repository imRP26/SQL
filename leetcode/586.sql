/* 
 * https://leetcode.com/problems/customer-placing-the-largest-number-of-orders/
 */



/*
 * Approach from -> https://leetcode.com/problems/customer-placing-the-largest-number-of-orders/editorial/
 */
select customer_number from Orders group by customer_number order by count(*) desc limit 1;



/*
 * (Inefficient) Approach to an aliter question wherein > 1 customers have the largest number of orders -> 
 * https://leetcode.com/problems/customer-placing-the-largest-number-of-orders/editorial/comments/129577
 */
select customer_number from Orders group by customer_number having count(order_number) = 
(select max(numOrders) from 
(select customer_number, count(order_number) as numOrders from orders group by customer_number) 
as temp);



/*
 * Approach to the aliter question from -> 
 * https://leetcode.com/problems/customer-placing-the-largest-number-of-orders/editorial/comments/695474
 */
select customer_number from Orders group by customer_number having count(order_number) = 
(select count(order_number) as order_count from Orders group by customer_number order by 1 
desc limit 1);



/*
 * Approach using the ALL keyword -> 
 * https://leetcode.com/problems/customer-placing-the-largest-number-of-orders/editorial/comments/129576
 */
select customer_number from Orders group by customer_number having count(customer_number) >= 
all(select count(customer_number) from Orders group by customer_number);
