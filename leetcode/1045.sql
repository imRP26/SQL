/*
 * https://leetcode.com/problems/customers-who-bought-all-products/
 */



/*
 * Simple, Naivety
 */
with t as 
(select customer_id, count(distinct product_key) as num_products from Customer group by customer_id) 
select customer_id from t where num_products = (select count(*) from Product);  



/*
 * Simple approach 1 from LC official Editorial!
 */
select customer_id from Customer group by customer_id having count(distinct product_key) = 
(select count(product_key) from Product);
